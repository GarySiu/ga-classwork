a = ["Anil", "Erik", "Jonathan"]
# return Erik
puts a[1]

h = {0 => "Zero", 1 => "One", :two => "Two", "two" => 2}
# return "One"
puts h[1]
# return "Two"
puts h[:two]
# return 2
puts h["two"]
# add 3 => "Three" to the hash
h[3] = "Three"
puts h
# add :four => 4 to the hash
h[:four] = 4
puts h

is = {true => "It's true!", false => "It's false"}

# What is the return value of is[2 + 2 == 4]?
# "It's true!"

# What is the return value of is["Erik" == "Jonathan"]?
# "It's false"

# What is the return value of is[9 > 10]?
# "It's false"

# What is the return value of is[0]?
# nil

# What is the return value of is["Erik"]?
# nil

users = {
  "Jonathan" => {
    :twitter => "tronathan",
    :favorite_numbers => [12, 42, 75],
  },
  "Erik" => {
    :twitter => "sferik",
    :favorite_numbers => [8, 12, 24],
  },
  "Anil" => {
    :twitter => "bridgpal",
    :favorite_numbers => [12, 14, 85],
  },
}

# Return tronathan
puts users["Jonathan"][:twitter]
# add 7 to Erik's favorite_numbers
users["Erik"][:favorite_numbers] << 7
puts users
# add yourself to the users hash
users["Gary"] = {twitter: '@madhaha', favorite_numbers: [2,3,4]}
puts users
# return array of Erik's favorite_numbers
puts users["Erik"][:favorite_numbers]
# return the smallest of Erik's favorite_numbers
puts users["Erik"][:favorite_numbers].sort.first
# return array of Anil's favorite numbers that are even
puts users["Anil"][:favorite_numbers].select { |num| num % 2 == 0 }
# return an array of the favorite numbers common to all users
puts users["Jonathan"][:favorite_numbers] & users["Erik"][:favorite_numbers] & users["Anil"][:favorite_numbers]
# return an array containing all users' favorite numbers, sorted, and excluding duplicates
(users['Anil'][:favorite_numbers] + users['Erik'][:favorite_numbers] + users['Jonathan'][:favorite_numbers]).sort.uniq