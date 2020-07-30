# creation of class method for filtering by Initial.
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
  # asking user for input
  name = gets.chop
  # repeat request until name is empty
  while !name.empty? do
    puts "Please enter which cohort the student is a member of. i.e July"
    cohort = gets.chop.to_sym
    # confirming input with user
    puts "Is the following correct - Name: #{name}, Cohort: #{cohort} ? type y/n"
    user_conf = gets.chop
    # requesting re-entry if user does not confirm
    if user_conf == "n"
      puts "re-enter name"
      name = gets.chop.to_sym
      puts "re-enter cohort (if not known, leave blank)"
      cohort = gets.chop.to_sym
    end
    # setting default for cohort if none chosen
    if cohort.empty?
      cohort = "N/A".to_sym
    end
    puts "Please enter students nationality"
    nationality = gets.chop.to_sym
    puts "Please enter students favourite hobbie"
    fav_hobbie = gets.chop.to_sym
    puts "Please enter students height in feet, i.e 5.8"
    height = gets.chop.to_sym
    # add the student hash to the array
    students << {name: name, nationality: nationality, hobbie: fav_hobbie, height: height, cohort: cohort}
    # custom feedback based on student count
    if students.count > 1
      puts "Now we have #{students.count} students"
    else
      puts "Now we have #{students.count} student"
    end
    # get more names from the user
    puts "Please enter the name of the next student"
    puts "Leave blank if you wish to finish"
    name = gets.chop
  end
  # return the array of students
  students
end
#  print the header
def print_header(students)
  # if no students present, does not run
  if !students.empty?
    puts "The Students of Villains Academy".center(88)
    puts "--------------".center(88)
  end
end
#  print the students names from within the array - with index
def print(students)
  while !students.empty? do
    students.each.with_index(1) do |student, index|
      puts "#{index}. #{student[:name]}, Nationality: #{student[:nationality]}, Favourite Hobbie: #{student[:hobbie]}, Height(ft): #{student[:height]} (#{student[:cohort]} cohort)"
    end
  break
  end
end
# print students by first initial specified
def print_by_initial(students)
  while !students.empty? do
    puts "Please select initial to search by"
    ini = gets.chomp
    students.each.with_index(1) do |student, index|
      if student[:name].upcase.initial == ini.upcase
        puts "#{index}. #{student[:name]}, Nationality: #{student[:nationality]}, Favourite Hobbie: #{student[:hobbie]}, Height(ft): #{student[:height]} (#{student[:cohort]} cohort)"
      end
    end
    break
  end
end
# print students by specified length range (1-i)
def print_by_length(students)
  while !students.empty? do
  puts "Please select your maximum name length"
    len = gets.chomp
    students.each.with_index(1) do |student, index|
      if student[:name].length <= len.to_i
        puts "#{index}. #{student[:name]}, Nationality: #{student[:nationality]}, Favourite Hobbie: #{student[:hobbie]}, Height(ft): #{student[:height]} (#{student[:cohort]} cohort)"
      end
    end
    break
  end
end
#  print the total of the students
def print_footer(names)
  # customised footer based on student count
  if names.count > 1
    puts "Overall, we have #{names.count} great students".center(90)
  elsif names.count == 1
    puts "We have #{names.count} great student".center(90)
  else
    puts "We have no students".center(90)
  end
end
# printing students sorted by cohort
def print_by_cohort(students)
  sort_by_cohort = students.map {|student| student[:cohort]}.uniq
  sort_by_cohort.each do |cohort|
    students.each.with_index(1) do |student, index|
      if student[:cohort] == cohort
        puts "#{index}. #{student[:name]}, Nationality: #{student[:nationality]}, Favourite Hobbie: #{student[:hobbie]}, Height(ft): #{student[:height]} (#{student[:cohort]} cohort)"
      end
    end
  end
end

def interactive_menu
  students = []
  loop do
  # 1. print the menu and ask the user what to do
  puts "Welcome to the Student Directory, how would you like to proceed?"
  puts "1. Input new students"
  puts "2. Print student list"
  puts "3. Print student list by cohort"
  puts "4. Print list of students with specific initial"
  puts "5. Print list of students with name length filter (i.e 1-10)"
  puts "9. To terminate program"
  # 2. read the input and save it into a variable
  selection = gets.chomp
  # 3. do what the user has asked
    case selection
      when "1"
        students = input_students
      when "2"
        print_header(students)
        print(students)
        print_footer(students)
      when "3"
        print_by_cohort(students)
      when "4"
        print_by_initial(students)
      when "5"
        print_by_length(students)
      when "9"
        exit
      else
        puts "Invalid choice, please select again from numbers provided."
    end
  end
end
  
  
  
# call methods
interactive_menu
