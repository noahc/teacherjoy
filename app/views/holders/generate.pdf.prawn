#

prawn_document() do |pdf|
  pdf.text "Hello World"
end
 # <h4>WorkSheets for <%= pluralize(@count, 'student') %></h4>
# #   <% @questions_array.each do |q| %>
# #      <b><%= q[0] %></b>
# #     <p>A <%= q[1] %></p>
# #     <p>B <%= q[2] %></p>
# #     <p>C <%= q[3] %></p>
# #     <p>D <%= q[4] %></p>
# #   <% end %>





# # ##Generate Bingo Cards
# # 		@bingo_list = questions.shuffle
# # 	  	@cards = []
# # 		

# # 		##Generate WorkSheets
# # 		worksheet_questions = questions.shuffle
# # 		question_count = worksheet_questions.length
# # 		@questions_array = []

# # 		question_count.times do |num|
# # 			question = worksheet_questions[num].question
# # 			answers = [worksheet_questions[num].answer]
# # 			taken_ids = [worksheet_questions[num].id]

# # 			until answers.length == 4
# # 				num = rand(0..24)
# # 				if !taken_ids.include?(num)
# # 					taken_ids << num
# # 					answers << worksheet_questions[num].answer
# # 				end
# # 			end

# # 			@questions_array << [question, answers.shuffle].flatten!

# # 		end






# # 		##Generate WorkSheets
# # 		worksheet_questions = questions.shuffle
# # 		question_count = worksheet_questions.length
# # 		@questions_array = []

# # 		question_count.times do |num|
# # 			question = worksheet_questions[num].question
# # 			answers = [worksheet_questions[num].answer]
# # 			taken_ids = [worksheet_questions[num].id]

# # 			until answers.length == 4
# # 				num = rand(0..24)
# # 				if !taken_ids.include?(num)
# # 					taken_ids << num
# # 					answers << worksheet_questions[num].answer
# # 				end
# # 			end

# # 			@questions_array << [question, answers.shuffle].flatten!

# # 		end







# bingo_list = @questions.shuffle
# count = 6
# cards = []

# count.times do |count|
# 	card = @questions.shuffle
# 	short_questions = card[0..24]
# 	cards << short_questions
# end

# pdf.text "#{@holder.name}"
# pdf.text "#{@holder.description}"

# pdf.text "Class Room Bingo Instructions "
# pdf.text "1. Distribute one card to each student."
# pdf.text "2. The list of questions below is already randomized so that you can begin at the top and contine reading down the list until a student declares they've won"
# pdf.text "3. Once a student has called out bingo, check their work and then declare them the winner"

# pdf.move_down 15
# pdf.text "Various Types of Bingo Games"
# pdf.text "There are various ways to play bingo with your students. Consider playing various games at once"
# pdf.move_down 5
# pdf.text "Bingo can be played in a number of ways:"
# pdf.text "Traditional Bingo: Five in a row either across, up and down, or via diagnoal corners"
# pdf.text "Blackout Bingo: Must cover all squares. This is very exciting for students, because most students get very close to winning. This is not a good version to play when you have less than 50 questions however"
# pdf.text "T Bingo: The center column going either horizontal or verticle and then an appropriate side to form a T. Often the bottom row with the center column isn't considered a win."
# pdf.text "U Bingo: This is similiar to T bingo. The goal is to create a \"U\" shape via the outermost sides. The goal is to fill in any three outermost rows or columns."
# pdf.text "Square Bingo: Square bingo is U bingo, with one more side requirment needed, thus requirng all 4 sides filled in to form a square."

# pdf.move_down 30
# pdf.text "Bingo Card Questions"

# bingo_list.each do |list|
# 	pdf.text "#{list.question} - #{list.answer}", size: 10
# 	pdf.move_down 5
# end

# #Create Individual Bingo Cards
# 6.times do |count|
# 	pdf.start_new_page
	
# 	card = cards[count]
# 	data =[ ["B", "I", "N", "G", "O"],
#           ["#{card[0].answer}",  "#{card[1].answer}",  "#{card[2].answer}",  "#{card[3].answer}",  "#{card[4].answer}"],
# 					["#{card[5].answer}",  "#{card[6].answer}",  "#{card[7].answer}",  "#{card[8].answer}",  "#{card[9].answer}"],
# 					["#{card[10].answer}", "#{card[11].answer}", "#{card[12].answer}", "#{card[13].answer}", "#{card[14].answer}"],
# 					["#{card[15].answer}", "#{card[16].answer}", "#{card[17].answer}", "#{card[18].answer}", "#{card[19].answer}"],
# 					["#{card[20].answer}", "#{card[21].answer}", "#{card[22].answer}", "#{card[23].answer}", "#{card[24].answer}"] ]  
#   pdf.text "Name:______________________"
#     pdf.move_down 20
#  pdf.table(data, cell_style: {height: 100, width: 100})
# end

# #Create Worksheets

# add_amount = @questions.count % 5
# questions = @questions.shuffle
# pdf.text "#{questions.count}"
# next_pos = 0
# question_array = []

# while next_pos < @questions.count 
# 	set_array = []
# 	5.times do |x|
# 		question = questions[next_pos].question
# 		answers = [questions[next_pos].answer]
# 		while answers.count < 4
# 			next_answer = Random.rand(0...count)
# 			if !answers.include?(questions[next_answer].answer)
# 				answers << questions[next_answer].answer
# 			end
# 		end
# 		next_pos += 1
# 		set_array << [question, answers[0], answers[1], answers[2], answers[3]]
# 	end

# 	if add_amount >= 1
# 		question = questions[next_pos].question
# 		answers = [questions[next_pos].answer]
# 		while answers.count < 4
# 			next_answer = Random.rand(0...count)
# 			if !answers.include?(questions[next_answer].answer)
# 				answers << questions[next_answer].answer
# 			end
# 		end
# 	next_pos += 1
# 	set_array << [question, answers[0], answers[1], answers[2], answers[3]]
# 	end
# 	question_array << set_array
# end

# #answer key here

# question_array.each do |set_array|
# 	pdf.start_new_page
# 	pdf.text "NAME___________________"
# 	pdf.text "Question Set:"
# 	pdf.move_down 10
# 	set_array.each do |question|
# 		answers = [question[1], question[2],question[3],question[4]]
# 		answers.shuffle!
# 		pdf.text "#{question[0]}"
# 		pdf.text "A. #{answers[0]}"
# 		pdf.text "B. #{answers[1]}"
# 		pdf.text "C. #{answers[2]}"
# 		pdf.text "D. #{answers[3]}"
# 	end
# 	pdf.move_down 20
# end
