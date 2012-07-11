bingo_list = @questions.shuffle
cards = []
count = @holder.prints

pdf.text "#{@holder.name}", size: 22
pdf.text "#{@holder.description}", size: 12
pdf.text "Prints for #{@holder.prints} students", size: 8
pdf.move_down 15


pdf.text "Class Room Bingo Instructions ", size: 12
pdf.text "1. Distribute one card to each student.", size: 9
pdf.text "2. The list of questions below is already randomized so that you can begin at the top and contine reading down the list until a student declares they've won", size: 9
pdf.text "3. Once a student has called out bingo, check their work and then declare them the winner", size: 9
pdf.move_down 5
pdf.text "Various Types of Bingo Games", size: 12
pdf.text "There are various ways to play bingo with your students. Consider playing various games at once", size: 9
pdf.move_down 3
pdf.text "Bingo can be played in a number of ways:", size: 12
pdf.text "Traditional Bingo: Five in a row either across, up and down, or via diagnoal corners", size: 9
pdf.move_down 3
pdf.text "Blackout Bingo: Must cover all squares. This is very exciting for students, because most students get very close to winning. This is not a good version to play when you have less than 50 questions however",size: 9
pdf.move_down 3
pdf.text "T Bingo: The center column going either horizontal or verticle and then an appropriate side to form a T. Often the bottom row with the center column isn't considered a win.", size: 9
pdf.move_down 3
pdf.text "U Bingo: This is similiar to T bingo. The goal is to create a \"U\" shape via the outermost sides. The goal is to fill in any three outermost rows or columns.", size: 9
pdf.move_down 3
pdf.text "Square Bingo: Square bingo is U bingo, with one more side requirment needed, thus requirng all 4 sides filled in to form a square.", size: 9
pdf.move_down 10
pdf.text "Bingo Card Questions"

bingo_list.each do |list|
	pdf.text "#{list.question} - #{list.answer}", size: 9
	pdf.move_down 3
end

#Create Individual Bingo Cards
count.times do |count|
	pdf.start_new_page
	
	card = @questions.shuffle
	data =[ ["<font size='37'>B</font>","<font size='37'>I</font>", "<font size='37'>N</font>", "<font size='37'>G</font>", "<font size='37'>O</font>"],
					["#{card[0].answer}",  "#{card[1].answer}",  "#{card[2].answer}",  "#{card[3].answer}",  "#{card[4].answer}"],
					["#{card[5].answer}",  "#{card[6].answer}",  "#{card[7].answer}",  "#{card[8].answer}",  "#{card[9].answer}"],
					["#{card[10].answer}", "#{card[11].answer}", "#{card[12].answer}", "#{card[13].answer}", "#{card[14].answer}"],
					["#{card[15].answer}", "#{card[16].answer}", "#{card[17].answer}", "#{card[18].answer}", "#{card[19].answer}"],
					["#{card[20].answer}", "#{card[21].answer}", "#{card[22].answer}", "#{card[23].answer}", "#{card[24].answer}"] ]
	pdf.text "Name:______________________"
		pdf.move_down 20
 pdf.table(data, cell_style: {height: 100, width: 100, inline_format: true, align: :center, valign: :center})
end



#Create Worksheets

add_amount = @questions.count % 5
questions = @questions.shuffle
next_pos = 0
set_list = []

while next_pos < @questions.count - 1
	question = questions[next_pos].question
	answers = [questions[next_pos].answer]
	while answers.count < 4
		next_answer = Random.rand(0...@questions.count)
		if !answers.include?(questions[next_answer].answer)
			answers << questions[next_answer].answer
		end
	end
	next_pos += 1
	set_list << [question, answers[0], answers[1], answers[2], answers[3]]
end

#answer key here

num = 1
next_count = 0
# count.times do |count|
pdf.start_new_page
pdf.text "ANSWER KEY", size: 18
pdf.text "Each Students Worksheet Will have the same questions, with the ansewers in a different order. This is not a bug, but a feature to prevent cheating", size: 8
pdf.move_down 10

while next_count < set_list.count
	pdf.move_down 10
	pdf.text "Question Set: #{num}"
	5.times do |x|
		question = set_list[next_count]
		answers = [question[1], question[2],question[3],question[4]]
		pdf.text "#{question[0]}", size: 9 
		pdf.text  "#{answers[0]}", size: 10
		pdf.move_down 3
		next_count += 1
	end

	if set_list.count - next_count % 5 != 0
		question = set_list[next_count]
		answers = [question[1], question[2],question[3],question[4]]
		pdf.text "#{question[0]}", size: 9 
		pdf.text  "#{answers[0]}", size: 10
		pdf.move_down 3
		next_count += 1
	end
	num += 1
end






count.times do |count|


num = 1
next_count = 0
# count.times do |count|
pdf.start_new_page
pdf.text "NAME___________________"
pdf.move_down 10

while next_count < set_list.count
	pdf.move_down 10
	pdf.text "Question Set: #{num}"
	5.times do |x|
		question = set_list[next_count]
		answers = [question[1], question[2],question[3],question[4]]
		answers.shuffle!
		pdf.text "#{question[0]}", size: 9
		answers = [ ["A. #{answers[0]}", "B. #{answers[1]}"],
      			["C. #{answers[2]}", "D. #{answers[3]}"]	]
		pdf.table(answers, :cell_style => {:border_width => 0, :size => 9})
		pdf.move_down 10
		next_count += 1
	end

	if set_list.count - next_count % 5 != 0
		question = set_list[next_count]
		answers = [question[1], question[2],question[3],question[4]]
		answers.shuffle!
		pdf.text "#{question[0]}", size: 9
		answers = [ ["A. #{answers[0]}", "B. #{answers[1]}"],
      			["C. #{answers[2]}", "D. #{answers[3]}"]	]
		pdf.table(answers, :cell_style => {:border_width => 0, :size => 9})
		pdf.move_down 10
		next_count += 1
	end
	num += 1
end

end


