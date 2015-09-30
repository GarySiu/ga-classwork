class Robot
  attr_writer :name
  attr_accessor :instruction_count

  def initialize
    self.reset
    self.increment_count
  end

  def reset
    self.name = (('A'..'Z').to_a.sample(2) + (0..9).to_a.sample(3)).join
  end

  def name
    self.increment_count
    @name
  end

  def increment_count
    self.instruction_count == nil ? self.instruction_count = 1 : self.instruction_count += 1
  end

end

# robot1 = Robot.new
# robot2 = Robot.new
# puts 'robot1 :' + robot1.name
# puts 'robot1 :' + robot1.name
# puts 'robot1 :' + robot1.name
# puts 'robot2 :' + robot2.name
# puts 'Resetting to factory settings'
# robot2.reset
# puts 'robot2 :' + robot2.name
# puts 'robot2 :' + robot2.name

puts "Robot 3: "
robot3 = Robot.new
puts robot3.name
puts robot3.name
puts "Resetting to factory settings."
robot3.reset
puts robot3.name
puts robot3.name
puts robot3.instruction_count # => 5