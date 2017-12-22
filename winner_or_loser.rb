puts "Welcome to our tax plan comparison. First things first, are you married?[0/1]"
married = gets.to_i
if married == 1
  puts "Are you and your spouse filing jointly?[Y/N]"
  married = true
  jointly = gets.to_i
  if jointly == 1
    jointly = true
  else
    jointly = false
  end
else
  married = false
  puts "Falseyyyy"
end

#find out income
digit_statement = "[Round to the nearest dollar. Do not add dollar signs or commas.]"
if (married == true) && (jointly == true)
  puts "What is your combined household income?" + digit_statement
  household_income = gets.to_i
elsif (married == true)
  puts "What is your personal income?" + digit_statement
  personal_income == gets.to_i
  puts "And your spouse's income?" + digit_statement
  spousal_income == gets.to_i
else
  #aka if single
  puts "What is your income?" + digit_statement
  personal_income == gets.to_i
end

#check for IRA & 401k contribution
puts "How much did you contribute to a 401k or a traditional IRA this year?" + digit_statement
retirement_contributions = gets.to_i

#check for SALT & mortgage interest deductions
puts "How much do you pay each year in state income tax?" + digit_statement
state_income_tax = gets.to_i
puts "Do you own your home?"
home_owner = gets.to_i
if home_owner == 1
  puts "How much mortgage interest do you pay yearly?" + digit_statement
  mortgage_interest = gets.to_i
  puts "How much property tax do you pay yearly?" + digit_statement
  property_tax = gets.to_i
else
  mortgage_interest = 0
  property_tax = 0
end

#check for student loan deduction
puts "How much did you (or you and your spouse) pay in student loan interest?" + digit_statement
student_loan_interest = gets.to_i
if student_loan_interest > 2500
  #max allowed under 2017 and 2018 laws
  student_loan_interest = 2500
end
if (married == true)
  if (jointly == false)
    #can't get deduction if married filing separately according to
    student_loan_interest = 0
  else
    #can't get 
  end
end
