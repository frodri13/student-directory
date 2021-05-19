def input_students
  puts "Please enter the names of the students."
  puts "To finish, just hit the return key twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "What's their age?"
    age = gets.chomp
    puts "Birth country?"
    country = gets.chomp
    puts "What's their hobby?"
    hobby = gets.chomp

    # add the student hash to the array
    students << {name: name, cohort: :november, age: age, country: country, hobby: hobby}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
students
end 

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  count = 0
  while count < students.count do
    name = students[count][:name].to_s
    cohort = students[count][:cohort].to_s
    age = students[count][:age].to_s
    country = students[count][:country].to_s
    hobby = students[count][:hobby].to_s

    puts "#{count += 1}. #{name} (#{cohort} cohort)"
    puts "Age: #{age}. Country of origin: #{country}. Hobby: #{hobby}"
  end
end

def print_footer(student)
  puts "Overall, we have #{student.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)