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

# set pronouns
if (married == true) && (jointly == true)
  pronoun = "y'all"
  possessive_pronoun = pronoun + "'s"
else
  pronoun = "you"
  possessive_pronoun = pronoun + "r"
end

#find out income
digit_statement = "[Round to the nearest dollar. Do not add dollar signs or commas.]"
if (married == true) && (jointly == true)
  puts "What is your combined household income?" + digit_statement
  income = gets.to_i
elsif (married == true)
  puts "What is your personal income?" + digit_statement
  income = gets.to_i
  puts "And your spouse's income?" + digit_statement
  spousal_income = gets.to_i
else
  #aka if single
  puts "What is your income?" + digit_statement
  income = gets.to_i
end

#find out & calculate personal exemptions
puts "Besides " + pronoun + ", how many other people are in your household that will not be filing their own taxes?"
additional_exemptions = gets.to_i
if (joint == true)
  personal_exemptions = 2
else
  personal_exemptions = 1
end
total_exemptions = personal_exemptions + additional_exemptions

#check for IRA & 401k contribution
puts "How much did " + pronoun + " contribute to a 401k or a traditional IRA this year?" + digit_statement
retirement_contributions = gets.to_i

#check for SALT & mortgage interest deductions
puts "How much do " + pronoun + " pay each year in state income tax?" + digit_statement
state_income_tax = gets.to_i
puts "Do you own your home?"
home_owner = gets.to_i
if home_owner == 1
  puts "How much mortgage interest do" + pronoun + " pay yearly?" + digit_statement
  mortgage_interest = gets.to_i
  puts "How much property tax do" + pronoun + " pay yearly?" + digit_statement
  property_tax = gets.to_i
else
  mortgage_interest = 0
  property_tax = 0
end

#check for charitable contributions
puts "How much did " + pronoun + " you donate to charities this year?" + digit_statement
charitable_donations = gets.to_i

#check for student loan deduction
puts "How much did " + pronoun + " pay in student loan interest?" + digit_statement
student_loan_interest = gets.to_i
if student_loan_interest > 2500
  #max allowed under old and 2018 laws
  student_loan_interest = 2500
end
if (married == true)
  if (jointly == false)
    #can't get deduction if married filing separately according to
    student_loan_interest = 0
  else
    #phase out at household_income > $130,000
    if household_income > 130000
      student_loan_interest = 0
    end
  end
else
  #phase out at single income > $65,000
  if personal_income > 65000
    student_loan_interest = 0
  end
end

#determine if payer should itemize deductions
non_standard_deductions = property_tax + state_income_tax + charitable_donations
standard_deduction = 6300
additional_deductions = (student_loan_interest +
                         mortgage_interest +
                         retirement_contributions)
if (married == true) && (jointly == true)
  standard_deduction = standard_deduction*2
end
if non_standard_deductions > standard_deduction
  total_deduction = non_standard_deductions + additional_deductions
else
  total_deduction = standard_deduction + additional_deductions
end

puts total_deduction

taxable_income = income - personal_exemptions*4100 - total_deduction

#establish tax brackets
old_single_tax_brackets = [0, 10000, 30000, 60000, 100000, 500000, 15000000]
old_married_joint_tax_brackets = []
old_single_tax_brackets.each do |amount|
  old_married_joint_tax_brackets.push(amount*2)
end
puts old_married_joint_tax_brackets

old_rates = [0.1, 0.15, 0.25, 0.28, 0.32, 0.35, 0.39]
