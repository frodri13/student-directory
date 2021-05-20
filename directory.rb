def input_students
  puts "Please enter the names of the students.".center(70)
  puts "To finish, just hit the return key twice".center(68)
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
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
    students << {name: name, cohort: cohort, age: age, country: country, hobby: hobby}


    puts "Are you happy with the information you've provided us? if you would like to edit it, please type 'no'.".center(70)
    happy = gets.chomp
    
    while happy == 'no' do
      puts "Type the category you would like to change [name, cohort, age, country, hobby]:".center(70)
      category = gets.chomp
      puts "Please retype your data:".center(70)
      change = gets.chomp

      students[students.count - 1][category.to_sym] = change
      puts "Would you like to edit another category?".center(70)
      answer = gets.chomp
      break if answer == 'no'

    end
  
    if students.count < 2
      puts "Now we have #{students.count} student".center(70)
    else
      puts "Now we have #{students.count} students".center(70)
    end
    # get another name from the user
    puts "What's the next student's name?".center(70)
    name = gets.chomp
  end
  # return the array of students
students
end 

def print_header
  puts "The students of Villains Academy".center(70)
  puts "-------------".center(70)
end

def print(students)
  count = 0
  while count < students.count do
    name = students[count][:name].to_s
    cohort = students[count][:cohort].to_s
    age = students[count][:age].to_s
    country = students[count][:country].to_s
    hobby = students[count][:hobby].to_s

    puts "#{count += 1}. #{name} (#{cohort} cohort)".center(70)
    puts "Age: #{age}. Country of origin: #{country}. Hobby: #{hobby}".center(70)

  end
end

def print_footer(student)
  if student.count < 2
    puts "Overall, we have #{student.count} great student".center(70) 
  else
    puts "Overall, we have #{student.count} great students".center(70)
  end
end

students = input_students
print_header
print(students) 
print_footer(students)