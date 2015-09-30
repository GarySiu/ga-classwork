puts "Enter a number to convert"
input = gets.chomp.to_i

numerals = {
  'I': 1,
  'V': 5,
  'X': 10,
  'L': 50
}

numerals.values.reverse.each do |numeral|
  if numeral <= input
    @roman = numerals.key(numeral)
    input -= numeral
    break
  end
end

puts "#{@roman} remainder #{input}"