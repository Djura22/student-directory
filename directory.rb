# 1. put the list of students into an Array
students = [
  ["Dr. Hannibal Lecter", :november],
  ["Darth Vader", :november],
  ["Nurse Ratched", :november],
  ["Michael Corleone", :november],
  ["Alex DeLarge", :november],
  ["The Wicked Witch of the West", :november],
  ["Terminator", :november],
  ["Freddy Krueger", :november],
  ["The Joker", :november],
  ["Joffrey Baratheon", :november],
  ["Norman Bates", :november]
]
# 2. print the header
def print_header
  puts "The Students of Villains Academy"
  puts "--------------"
end
# 3. print the students names from within the array
def print(students)
  students.each do |student|
    puts "#{student[0]} (#{student[1]} cohort)"
  end
end
# 4. print the total of the students
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
# 5. call methods
print_header
print(students)
print_footer(students)
