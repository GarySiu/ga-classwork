class Person # If it was two words or more words, you would use UpperCamelCase for class names

  # attr_reader :age, :name
  # attr_writer :age, :name

  attr_accessor :age, :name

  @@count = 0

  DEFAULT_NUMBER_OF_LEGS = 11

  def initialize(name,age)
    @@count += 1

    @name = name
    @age = age
  end
# class << self would set everything below to a class method. Generally don't use it for clarity.
  def self.count
    @@count
  end

  def talk(words) # If you only have one variable, you can skip the parenthesis
    puts "I can talk! Look at me ma! #{words}"
  end
  # def set_name name
  #   puts 'Setting name...'
  #   @name = name # Equivilent to Javascript this.name
  # end

  # # setter
  # def age=(age)
  #   @age = age
  # end
  
  # # getter
  # def age
  #   @age
  # end

  def name
    puts "Returning the user's name"
    @name
  end

  # def self.change_default_leg_number change_default_leg_number
  #   DEFAULT_NUMBER_OF_LEGS = number
  # end
end

# student1 = Person.new
student1 = Person.new('Christine', 90)
# student1.age = 3
# student1.set_name 'Christine'
# puts student1.name
student1.talk '*shakes head*'
puts "The student's name is #{student1.name} and she is #{student1.age}"
puts Person.count

puts Person::DEFAULT_NUMBER_OF_LEGS