@students = []

def input_students
  puts "Please enter the name of the student"
  puts "Leave blank if you wish to finish"
  # asking user for input
  name = STDIN.gets.chop
  # repeat request until name is empty
  while !name.empty? do
    puts "Please enter which cohort the student is a member of. i.e July"
    cohort = STDIN.gets.chop.to_sym
    # confirming input with user
    puts "Is the following correct - Name: #{name}, Cohort: #{cohort} ? type y/n"
    user_conf = STDIN.gets.chop
    # requesting re-entry if user does not confirm
    if user_conf == "n"
      puts "re-enter name"
      name = STDIN.gets.chop.to_sym
      puts "re-enter cohort (if not known, leave blank)"
      cohort = STDIN.gets.chop.to_sym
    end
    # setting default for cohort if none chosen
    if cohort.empty?
      cohort = "N/A".to_sym
    end
    puts "Please enter students nationality"
    nationality = STDIN.gets.chop.to_sym
    puts "Please enter students favourite hobbie"
    fav_hobbie = STDIN.gets.chop.to_sym
    puts "Please enter students height in feet, i.e 5.8"
    height = STDIN.gets.chop.to_sym
    # add the student hash to the array
    @students << {name: name, nationality: nationality, hobbie: fav_hobbie, height: height, cohort: cohort}
    # custom feedback based on student count
    if @students.count > 1
      puts "Now we have #{@students.count} students"
    else
      puts "Now we have #{@students.count} student"
    end
    # get more names from the user
    puts "Please enter the name of the next student"
    puts "Leave blank if you wish to finish"
    name = STDIN.gets.chop
  end
end

# printing students sorted by cohort
def print_by_cohort
  sort_by_cohort = @students.map {|student| student[:cohort]}.uniq
  sort_by_cohort.each do |cohort|
    @students.each.with_index(1) do |student, index|
      if student[:cohort] == cohort
        puts "-- #{index}. #{student[:name]}, Nationality: #{student[:nationality]}, Favourite Hobbie: #{student[:hobbie]}, Height(ft): #{student[:height]} (#{student[:cohort]} cohort)"
      end
    end
  end
end

# creation of string method for filtering by Initial.
class String
  def initial
    self[0,1]
  end
end

# print students by first initial specified
def print_by_initial
  while !@students.empty? do
    puts "Please select initial to search by"
    ini = STDIN.gets.chomp
    @students.each.with_index(1) do |student, index|
      if student[:name].upcase.initial == ini.upcase
        puts "-- #{index}. #{student[:name]}, Nationality: #{student[:nationality]}, Favourite Hobbie: #{student[:hobbie]}, Height(ft): #{student[:height]} (#{student[:cohort]} cohort)"
      end
    end
    break
  end
end

# print students by specified length range (1-i)
def print_by_length
  while !@students.empty? do
  puts "Please select your maximum name length"
    len = STDIN.gets.chomp
    @students.each.with_index(1) do |student, index|
      if student[:name].length <= len.to_i
        puts "-- #{index}. #{student[:name]}, Nationality: #{student[:nationality]}, Favourite Hobbie: #{student[:hobbie]}, Height(ft): #{student[:height]} (#{student[:cohort]} cohort)"
      end
    end
    break
  end
end

def print_header
  # if no students present, does not run
  if !@students.empty?
    puts "The Students of Villains Academy".center(98)
    puts "--------------".center(98)
  end
end

#  print the students names from within the array - with index
def print_student_list
  while !@students.empty? do
    @students.each.with_index(1) do |student, index|
      puts "-- #{index}. #{student[:name]}, Nationality: #{student[:nationality]}, Favourite Hobbie: #{student[:hobbie]}, Height(ft): #{student[:height]} (#{student[:cohort]} cohort)"
    end
  break
  end
end

def print_footer
  # customised footer based on student count
  if @students.count > 1
    puts "Overall, we have #{@students.count} great students".center(100)
  elsif @students.count == 1
    puts "We have #{@students.count} great student".center(100)
  else
    puts "We have no students".center(100)
  end
end

# prints students with no filters
def show_students
  print_header
  print_student_list
  print_footer
end

# saves the student list in an CSV file (students.csv)
def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:nationality], student[:hobbie], student[:height], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

# loads previous save of student list (students.csv)
def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, nationality, hobbie, height, cohort = line.chomp.split(',')
    @students << {name: name, nationality: nationality.to_sym, hobbie: hobbie.to_sym, height: height.to_sym, cohort: cohort.to_sym}
  end
  file.close
end

# 
def try_load_students
  filename = ARGV.first # first argument from the command line
  return load_students if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

# call to the menu and receiving users input
def interactive_menu
  loop do
  # 1. print the menu and ask the user what to do
    print_menu
  # 2. read the input and save it into a variable
    process(STDIN.gets.chomp)
  end
end
  
# menu options
def print_menu
  puts "You are exploring the Student Directory, how would you like to proceed?".center(100)
  puts "1. Input new students"
  puts "2. Print student list"
  puts "3. Print student list by cohort"
  puts "4. Print list of students with specific initial"
  puts "5. Print list of students with name length filter ( i.e 1 - (10) )"
  puts "6. SAVE the list to students.csv"
  puts "7. LOAD list from students.csv"
  puts "9. EXIT program"
end

def process(selection)
  # do what the user has asked

  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      print_by_cohort
    when "4"
      print_by_initial
    when "5"
      print_by_length
    when "6"
      save_students
    when "7"
      load_students
    when "9"
      exit
    else
      puts "Invalid choice, please select again from numbers provided."
  end
end

# call menu (run program)
try_load_students
interactive_menu
