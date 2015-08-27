# puts 'hello' if true #Guard clause

# if !true
#   puts 'hello'
# else
#   puts 'bye'
# end

# if true then puts 'hello' else puts 'bye' end  #ALSO WORKS# But it's horrible. Don't use it.

# print 'Enter a number: '
# n = gets.to_i

# if n > 0
#   puts 'Your number is positive'
# elsif n < 0
#   puts 'your number is negative'
# else
#   puts 'Your number is zero'
# end

# print 'Enter a number: '
# n = gets.to_i

# unless n > 10
#   puts 'too small!'
# else puts 'too LARGE!'
# end

# user_registered = false
# puts 'Please signup!' unless user_registered

# puts 'Exit the program? (yes or no):'
# answer = gets.chomp.downcase

# case answer
# when 'yes'
#   puts'bye!'
#   exit
# when 'no'
#   puts 'ok. crack on!'
# else
#   puts 'eh? I do not compute'
# end

#   puts 'Continuing with program...'

# n = 1

# while n < 11
#   puts n
#   n += 1
# end
# puts 'done!'

# Don't bother with for loops

# loop {
#   puts 'What is 435 % 67?'
#   reply = gets.to_i
#   case reply
#   when 435 % 67
#     puts 'You are correct!'
#     exit
#   else 
#   puts 'Nope try again!'
#   end
# }

# puts 'What is 435 % 67?'
# reply = gets.to_i
# while reply != 435 % 67
#  puts 'Nope try again'
#  puts 'What is 435 % 67?'
#   reply = gets.to_i
# end
#   puts 'You are correct!'