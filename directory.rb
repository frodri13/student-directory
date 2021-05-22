@students = []

def input_students
  puts "Please enter the names of the students.".center(70)
  puts "To finish, just hit the return key twice".center(68)
  # get the first name. Alternative to chomp: to_s.slice!(/\w+/)
  name = gets.chomp
  # if name is empty, the program will stop and it will put the following message and stop.
  if name.empty?
    puts "THE HEROES ARE WINNING! OUR SCHOOL IS EMPTY!! NO STUDENTS THIS YEAR!!!".center(75)
    exit
  end
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Which cohort will they be attending?".center(70)
    cohort = gets.chomp
    cohort = "2021" if cohort.length == 0
    puts "What's their age?".center(70)
    age = gets.chomp
    until age.to_i > 0
      puts "Please enter a number".center(70)
      age = gets.chomp
        if age.to_i > 0 && age.to_i < 18
          puts "You're too young to study at the Villains Academy. Please come back when you're older.".center(70)
          exit
        end
    end
  
    puts "Birth country?".center(70)
    country = gets.chomp
    puts "What's their hobby?".center(70)
    hobby = gets.chomp
    # all variables are paired with a symbol and sent as an array 
    @students << {name: name, cohort: cohort, age: age, country: country, hobby: hobby}


    puts "Are you happy with the information you've provided us? if you would like to edit it, please type 'no'.".center(70)
    happy = gets.chomp
    
    while happy == 'no' do
      puts "Type the category you would like to change [name, cohort, age, country, hobby]:".center(70)
      category = gets.chomp
      puts "Please retype your data:".center(70)
      change = gets.chomp

      @students[@students.count - 1][category.to_sym] = change
      puts "Would you like to edit another category?".center(70)
      answer = gets.chomp
      break if answer == 'no'

    end
  
    if @students.count < 2
      puts "Now we have #{@students.count} student".center(70)
    else
      puts "Now we have #{@students.count} students".center(70)
    end
    # get another name from the user
    puts "What's the next student's name?".center(70)
    name = gets.chomp
  end
  # return the array of students
@students
end 

def print_header
  puts "The students of Villains Academy".center(70)
  puts "-------------".center(70)
end

def print_students_list(students)
  # add functionality to print all
  puts "Please select the cohort you would like to print:".center(70)
  cohort = gets.chomp
  count = 0

  students.map {|hash|
      if hash[:cohort].include?(cohort) == true
      puts "#{count += 1}. Name: #{hash[:name]}. Age: #{hash[:age]}. Country: #{hash[:country]}. Hobby #{hash[:hobby]}.".center(70)
      end
    }
end

def print_footer(student)
  if student.count < 2
    puts "Overall, we have #{student.count} great student".center(70) 
  else
    puts "Overall, we have #{student.count} great students".center(70)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit" 
end

def show_students
  print_header
  print_students_list(@students)
  print_footer(@students)
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    exit
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

interactive_menu