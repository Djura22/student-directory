# creation of class method for filtering by Initial
class String
  def initial
    self[0,1]
  end
end

def input_students
  puts "Please enter the name of the student"
  puts "Leave blank if you wish to finish"
  # creation of empty array
  students = []
  name = gets.chomp.to_sym
  # repeat request until name is empty
  while !name.empty? do
    puts "Please enter which cohort the student is a member of. i.e July"
    cohort = gets.chomp.to_sym
    puts "Is the following correct - Name: #{name}, Cohort: #{cohort} ? type y/n"
    user_conf = gets.chomp
    if user_conf == "n"
      puts "re-enter name"
      name = gets.chomp.to_sym
      puts "re-enter cohort (if not known, leave blank)"
      cohort = gets.chomp.to_sym
    end
    if cohort.empty?
      cohort = "N/A".to_sym
    end
    puts "Please enter students nationality"
    nationality = gets.chomp.to_sym
    puts "Please enter students favourite hobbie"
    fav_hobbie = gets.chomp.to_sym
    puts "Please enter students height in feet, i.e 5.8"
    height = gets.chomp.to_sym
    # add the student hash to the array
    students << {name: name, nationality: nationality, hobbie: fav_hobbie, height: height, cohort: cohort}
    if students.count > 1
      puts "Now we have #{students.count} students"
    else
      puts "Now we have #{students.count} student"
    end
    # get more names from the user
    puts "Please enter the name of the next student"
    puts "Leave blank if you wish to finish"
    name = gets.chomp
  end
  # return the array of students
  students
end
#  print the header
def print_header
  puts "The Students of Villains Academy".center(88)
  puts "--------------".center(88)
end
#  print the students names from within the array - with index
def print(students)
  while true do
    students.each.with_index(1) do |student, index|
#     if student[:name].initial == "M" && student[:name].length < 12
      puts "#{index}. #{student[:name]}, Nationality: #{student[:nationality]}, Favourite Hobbie: #{student[:hobbie]}, Height(ft): #{student[:height]} (#{student[:cohort]} cohort)"
    end
  break
  end
end
#  print the total of the students
def print_footer(names)
  if names.count > 1
    puts "Overall, we have #{names.count} great students".center(90)
  else
    puts "We have #{names.count} great student".center(90)
  end
end

def printby_cohort(students)
  sortby_cohort = students.map {|student| student[:cohort]}.uniq
  sortby_cohort.each do |cohort|
    students.each.with_index(1) do |student, index|
      if student[:cohort] == cohort
        puts "#{index}. #{student[:name]}, Nationality: #{student[:nationality]}, Favourite Hobbie: #{student[:hobbie]}, Height(ft): #{student[:height]} (#{student[:cohort]} cohort)"
      end
    end
  end
end
  
  
  
#  call methods
students = input_students
print_header
# print(students)
printby_cohort(students)
print_footer(students)
