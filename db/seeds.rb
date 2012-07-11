# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Holder.create(id: 1, user_id: 1, name: "Presidents Of The United States of America", description: "Presidential Trivia")
Holder.create(id: 2, user_id: 1, name: "My Nephews Favorite Kid Jokes", description: "A list of kid jokes my nephew loves")

president_questions = [
	["Which President was the first president of the United States of America?", "George Washington"],
	["Which President was the Father of John Quincy Adams?", "John Adams"],
	["Which President purchased the vast Louisiana Territory?", "Thomas Jefferson"],
	["Which President was the Author of the Bill of Rights?", "James Madison"],
	["Which President was the last of the Founding Fathers to be elected President?", "James Monroe"],
	["Which President lost their reelection bid to Andrew Jackson?", "John Quincy Adams"],
	["Which President was known as \"Old Hickory\" ?", "Andrew Jackson"],
	["Which President's administration is most often associated with the Panic of 1837", "Martin Van Buren"],
	["Which President had the longest Inaugural Address and shortest term?", "William Henry Harrison"],
	["Which President dedicated his last two years of office to the annexation of Texas?", "John Tyler"],
	["Which President lead the nation to Victory in the Mexican-American War?", "James K. Polk"],
	["Which President was the last President to own slaves while in Office?", "Zachary Taylor"],
	["Which President is considered in the bottom 10 of historical rankings and co-founded the University of Buffalo?", "Millard Fillmore"],
	["Which President signed the Kansas-Nebraska Act?", "Franklin Pierce"],
	["Which President was the last President born in the 18th Century?", "James Buchanan"],
	["Which President issued the Emancipation Proclamation?", "Abraham Lincoln"],
	["Which President was the first President to preside over the Reconstruction Era?", "Andrew Johnson"],
	["Which President helped destroy the KKK in the south, and promote civil rights for Native Americans?", "Ulysses S. Grant"],
	["Which President ordered federal troops to quell the Great Rail Road Strike of 1877?", "Rutherford B. Hayes"],
	["Which President was assassinated, and likely could have been saved had Alexander Graham Bell been allowed to use his metal detector?", "James A. Garfield"],
	["Which President passed and enforced the  Pendleton Civil Service Reform Act, which required all Government Jobs to be awarded based on Merit?", "Chester A. Arthur"],
	["Which President served two terms, but split a part?", "Grover Cleveland"],
	["Which President passed the Sherman Anti-Trust Act?", "Benjamin Harrison"],
	["Which President's assassination was responsible for the Secret Service becoming responsible for the protection of the President?", "William McKinley"],
	["Which President founded the Bull Moose Party in 1912?", "Theodore \"Teddy\" Roosevelt"],
	["Which President's domestic agenda emphasized trust-busting, civil service reform, strengthening the Interstate Commerce Commission, improving the performance of the postal service, and passage of the Sixteenth Amendment?", "William Howard Taft"],
	["Which President saw the Zimmerman Telegram propel the United States into WWI?", "Woodrow Wilson"],
	["Which President saw his administration face one of the largest scandals in presidential history with the  Teapot Dome scandal?", "Warren G. Harding"],
	["Which President resorted confidence in the Office of the President after the TeaPot Dome Scandal by reducing the size of government?", "Calvin Coolidge"],
	["Which President embraced the  Efficiency Movement,  and later was drafted by Truman to make government more efficient?", "Herbert Hoover"],
	["Which President called the day Pearl Harbor was attacked a \"date which will live in infamy\" and lead the United States into WWII?", "Franklin D. Roosevelt"],
	["Which President made the decision to drop the atomic bombs that ended WWII?", "Harry S. Truman"],
	["Which President was responsible for signing the  Interstate Highway System in 1956?", "Dwight D. Eisenhower"],
	["Which President was assassinated in Dallas?", "John F. Kennedy"],
	["Which President passed \"Great Society\" legislation and helped drive the War of Poverty legislation as a key part of his Administration?", "Lyndon B. Johnson"],
	["Which President is associated with the Watergate scandal?", "Richard Nixon"],
	["Which President granted a presidential pardon to President Richard Nixon for his role in the Watergate scandal. ", "Gerald Ford"],
	["Which President created two new cabinet-level departments: the Department of Energy and the Department of Education?", "Jimmy Carter"],
	["Which President survived an assassination attempt and declared it \"Morning in America\"?", "Ronald Reagan"],
	["Which President saw the Berlin Wall fall and beat Michael Dukakis?", "George H. W. Bush"],
	["Which President signed into law the North American Free Trade Agreement?", "Bill Clinton"],
	["Which President signed into law broad tax cuts, the PATRIOT Act, the No Child Left Behind Act, the Partial-Birth Abortion Ban Act, and Medicare prescription drug benefits for seniors.", "George W. Bush"],
	["Which President  signed economic stimulus legislation in the form of the American Recovery and Reinvestment Act of 2009 and the Tax Relief, Unemployment Insurance Reauthorization, and Job Creation Act of 2010.", "Barack Obama"]
]



president_questions.each do |array|
	question = Question.create(holder_id: 1, question: array[0], answer: array[1])
end





