# def hello(name='no name')
#   puts "hello #{name}"
# end
# hello('Gary')

# #splat arguments
# def say_hello(*name)
#   puts name.inspect
# end

# say_hello('John','Luke','Sam','Tom','Lara')

# def mixed_args( a, *b, c)
#   puts a.inspect
#   puts b.inspect
#   puts c.inspect
# end
# mixed_args(1 , 5, 324123 ,2345, 43534, 2342)

def silly_check(num)
  puts "The number is #{num >= 5 ? 'greater than equal to' : 'less than'} 5"
end
silly_check(4)

def drinking_age(age)
  puts "You're #{age < 21 ? 'too young' : 'fine'} to drink in 'murica"
end
drinking_age(20)

def city_boroughs(borough)
  if borough == 'hackney'
    puts "You're a wanker"
  else
    puts "You're possibly not a wanker"
  end
end

city_boroughs('hackney')