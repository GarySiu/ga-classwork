require_relative '../lib/bike'
describe Bike do

  it 'should not be broken after we create it' do
    bike = Bike.new # instantiate a new bike
    expect(bike.broken?).to be false
  end

  it 'should be able to break' do
    bike = Bike.new
    bike.break
    expect(bike.broken?).to be true
  end

  it 'should be able to be fixed' do
    bike = Bike.new
    bike.break
    bike.fix
    expect(bike.broken?).to be false
  end

end
