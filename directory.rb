# 1. put the list of students into an Array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
# 2. print the list with header
puts "The Students of Villains Academy"
puts "--------------"
students.each do |student|
  puts student
end
# 3. print the total of the students
puts "Overall, we have #{students.count} great students"
