class HoldersController < ApplicationController
	def index
		@holder = Holder.new
		@holders = Holder.find_all_by_user_id(current_user.id)
	end

	def new
		@holder = Holder.new
	end

	def create
		@holder = Holder.new(params[:holder])
		@holder.user_id = current_user.id
		if @holder.save
			flash[:success] = "Set Created!"
      redirect_to holders_path
		else
			render 'new'
		end
	end

	def edit
		@holder = Holder.find(params[:id])
	end

	def update
		@holder = Holder.find(params[:id])
    if @holder.update_attributes(params[:holder])
    	flash[:success] = "holder updated"
			redirect_to holders_path 
		else
      render 'edit'
    end
	end

	def show
		@holder = Holder.find(params[:id])
		@questions = Question.find_all_by_holder_id(@holder)
		@question = Question.new
	end

	def generate




		@holder = Holder.find(params[:holder_id])
		@count = params[:count].to_i
		questions = Question.find_all_by_holder_id(@holder)

		##Generate Bingo Cards
		@bingo_list = questions.shuffle
	  @cards = []
		@count.times do |count|
			card = questions.shuffle
			short_questions = card[0..24]
			@cards << short_questions
		end

		##Generate WorkSheets
		worksheet_questions = questions.shuffle
		question_count = worksheet_questions.length
		@questions_array = []

		question_count.times do |num|
			question = worksheet_questions[num].question
			answers = [worksheet_questions[num].answer]
			taken_ids = [worksheet_questions[num].id]

			until answers.length == 4
				num = rand(0..24)
				if !taken_ids.include?(num)
					taken_ids << num
					answers << worksheet_questions[num].answer
				end
			end

			@questions_array << [question, answers.shuffle].flatten!

		end

			respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "file_name"
      end
    end
	end

	def destroy
  	Holder.find(params[:id]).destroy
    flash[:success] = "Set destroyed."
    redirect_to holders_path
	end


end
