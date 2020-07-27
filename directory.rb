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
# 2. print the header
def print_header
  puts "The Students of Villains Academy"
  puts "--------------"
end
# 3. print the students names from within the array
def print_names(names)
  names.each do |name|
    puts name
  end
end
# 4. print the total of the students
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
# 5. call methods
print_header
print_names(students)
print_footer(students)
