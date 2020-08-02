# Creation of empty array
@students = []
# setting default loadfile to students.csv
@load_default = "students.csv"
# requiring the csv class
require 'csv'

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
    cohort = "N/A".to_sym if cohort.empty?
    puts "Please enter students nationality"
    nationality = STDIN.gets.chop.to_sym
    puts "Please enter students favourite hobbie"
    fav_hobbie = STDIN.gets.chop.to_sym
    puts "Please enter students height in feet, i.e 5.8"
    height = STDIN.gets.chop.to_sym
    # add the student hash to the array
    pop_student_array(name, nationality, fav_hobbie, height, cohort)
    # custom feedback based on student count
    if @students.count > 1
      puts "Now we have #{@students.count} students"
    else
      puts "Now we have #{@students.count} student"
    end
    # get more names from the user
    return input_students
  end
end

# method defined for populating student array
def pop_student_array(name, nationality, fav_hobbie, height, cohort)
  @students << {name: name, nationality: nationality, hobbie: fav_hobbie, height: height, cohort: cohort}
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
    ini = STDIN.gets.chop
    @students.each.with_index(1) do |student, index|
    puts "-- #{index}. #{student[:name]}, Nationality: #{student[:nationality]}, Favourite Hobbie: #{student[:hobbie]}, Height(ft): #{student[:height]} (#{student[:cohort]} cohort)" if student[:name].upcase.initial == ini.upcase
    end
    break
  end
end

# print students by specified length range (1-i)
def print_by_length
  while !@students.empty? do
  puts "Please select your maximum name length"
    len = STDIN.gets.chop
    @students.each.with_index(1) do |student, index|
    puts "-- #{index}. #{student[:name]}, Nationality: #{student[:nationality]}, Favourite Hobbie: #{student[:hobbie]}, Height(ft): #{student[:height]} (#{student[:cohort]} cohort)" if student[:name].length <= len.to_i
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

# saves the student list in an CSV file
def save_students
  puts "Type filename of new or existing file to save as (including type i.e .csv)"
  fname = gets.chop
  # open the file for writing (using csv class)
  CSV.open("#{fname}", "w") do |file|
  # iterate over the array of students
    @students.each do |student|
      file << [student[:name], student[:nationality], student[:hobbie], student[:height], student[:cohort]]
    end
  end
end

# loads previous save of student list (default set via line 4)
def load_students(load_file = @load_default)
  CSV.foreach(load_file) do |row|
    name, nationality, hobbie, height, cohort = row
      pop_student_array(name, nationality, hobbie, height, cohort)
  end
end

# loads student file from command line
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
    process(STDIN.gets.chop)
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
  puts "6. SAVE a student list"
  puts "7. LOAD a student list"
  puts "8. Print source code"
  puts "9. EXIT program"
end

def process(selection)
  # do what the user has asked

  case selection
    when "1"
      puts "Let's add some students!"
      input_students
    when "2"
      puts "Printing Student List"
      show_students
    when "3"
      puts "Printing Student List by Cohort"
      print_by_cohort
    when "4"
      print_by_initial
    when "5"
      print_by_length
    when "6"
      puts "Saving Students..."
      save_students
    when "7"
      puts "Type existing list to load (including filetype), leaving blank will load default list"
      load_file = gets.chop
      if load_file.empty?
        puts "Loading #{@load_default}"
        load_students
      else
        puts "Loading #{load_file}"
        load_students(load_file)
      end
    when "8"
      print_source_code
    when "9"
      puts "Bye!"
      exit
    else
      puts "Invalid choice, please select again from numbers provided."
  end
end

def print_source_code
  puts "Type (y) to print source code"
  user = gets.chop.upcase
  if user == "Y"
    return $><<IO.read($0)
  end
end


# call methods
print_source_code
try_load_students
interactive_menu
