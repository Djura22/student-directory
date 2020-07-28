def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # creation of empty array
  students = []
  # get first name from user
  name = gets.chomp
  # while name is not empty, keep repeating this line
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get more names from the user
    name = gets.chomp
  end
  # return the array of students
  students
end


=begin
# 1. put the list of students into an Array
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]
=end
# 2. print the header
def print_header
  puts "The Students of Villains Academy"
  puts "--------------"
end
# 3. print the students names from within the array
def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end
# 4. print the total of the students
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
# 5. call methods
students = input_students
print_header
print(students)
print_footer(students)
