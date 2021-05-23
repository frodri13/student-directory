@students = []
# This interactive menu will be the first thing appearing after loading the file in the command line
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" 
end
# pre input_students methods:
# Initial greeting to the user asking them to insert the students' name
def students_name
  puts "Please enter the names of the students.".center(70)
  puts "To finish, just hit the return key twice".center(68)
  # get the first name. Alternative to chomp: to_s.slice!(/\w+/)
  name = STDIN.gets.chomp
  if name.empty?
    false
  else
    @name = name
  end
end

def students_age
  puts "What's their age?".center(70)
  @age = STDIN.gets.chomp
end

def students_cohort
  puts "Which cohort will they be attending?".center(70)
  @cohort = STDIN.gets.chomp
  @cohort = "2021" if @cohort.length == 0
end


def students_country
  puts "Birth country?".center(70)
  @country = STDIN.gets.chomp
end

def students_hobby
  puts "What's their hobby?".center(70)
  @hobby = STDIN.gets.chomp
end

def students_hash_to_array
  @students << {name: @name, cohort: @cohort, age: @age, country: @country, hobby: @hobby}
end

def edit_student_intake
  puts "Are you happy with the information you've provided us? if you would like to edit it, please type 'no'.".center(70)
  happy = STDIN.gets.chomp

  while happy == 'no' do
    puts "Type the category you would like to change [name, cohort, age, country, hobby]:".center(70)
    category = STDIN.gets.chomp
    puts "Please retype your data:".center(70)
    change = STDIN.gets.chomp

    @students[@students.count - 1][category.to_sym] = change
    puts "Would you like to edit another category?".center(70)
    answer = STDIN.gets.chomp
    break if answer == 'no'
  end
end

def students_count
  # while the name is not empty, repeat this code
  if @students.count < 2
    puts "Now we have #{@students.count} student".center(70)
  else
    puts "Now we have #{@students.count} students".center(70)
  end
  # get another name from the user
  puts "What's the next student's name?".center(70)
  name = STDIN.gets.chomp
end

# 1. Input the students:
def input_students
  loop do  
    break if students_name == false
    students_cohort
    students_age
    students_country
    students_hobby
    edit_student_intake
    students_hash_to_array
    students_count
  end
  @students
end

# 2. Show the students:
def print_header
  puts "The students of Villains Academy".center(70)
  puts "-------------".center(70)
end

def print_students_list
  @students.each do|student|
    puts "Name: #{student[:name]}. Cohort: #{student[:cohort]} Age: #{student[:age]}. Country: #{student[:country]}. Hobby: #{student[:hobby]}.".center(70)
  end
end

def print_footer
  if @students.count < 2
    puts "Overall, we have #{@students.count} great student".center(70) 
  else
    puts "Overall, we have #{@students.count} great students".center(70)
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end
# 3. Save students:
def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:age], student[:country], student[:hobby]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end
# 4. Load students:
def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    @name, @cohort, @age, @country, @hobby = line.chomp.split(',')
    students_hash_to_array
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}."
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end
# This method describes every functionality of the print_menu
def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  end
end
# print_menu and process are put in a continuous loop:
def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

try_load_students
interactive_menu

# After we added the code to load the students from file, we ended up with adding the students to @students in two places.
# The lines in load_students() and input_students() are almost the same. 
# This violates the DRY (Don't Repeat Yourself) principle. How can you extract them into a method to fix this problem?