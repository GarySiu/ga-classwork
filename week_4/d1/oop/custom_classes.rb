class Student
  # attr_writer :age
  # attr_reader :name, :age
  attr_accessor :name, :age
  def initialize(name, age)
    @name = name
    @age = age
  end
  def slack gif
    puts "#{@name} slacked an image of #{gif}"
  end
end

class Animal
  attr_accessor :species, :name, :weight
  def initialize(species, name, weight)
    @species = species
    @name = name
    @weight = weight
  end
end

student1 = Student.new('Gary',29)
puts student1.age
puts student1.name
student1.age = 2389478297
puts student1.age
student1.slack "a banana"
animal1 = Animal.new('Horse', 'Ed', 3940358430958)
puts "This is #{animal1.name} the #{animal1.species} that weighs #{animal1.weight}kg"