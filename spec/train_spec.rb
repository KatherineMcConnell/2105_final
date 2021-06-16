require './lib/car'
require './lib/train'

RSpec.describe Train do
  context 'Iteration_1_&_2' do
    before(:each) do
      @car1 = Car.new({type: 'Mail', weight: 5})
      @car2 = Car.new({type: 'Passengers', weight: 1})
      @train1 = Train.new({name: 'Thomas', type: 'Tank'})
    end

    it 'exists' do

      expect(@train1).to be_an_instance_of(Train)
    end

    it 'has attributes' do

      expect(@train1.name).to eq('Thomas')
      expect(@train1.type).to eq('Tank')
      expect(@train1.cargo).to eq({})
    end

    it 'can count_cars pulling values from cargo hash given key obj' do

      expect(@train1.count_cars(@car1)).to eq(0)
      @train1.add_cars(@car1, 2)

      expect(@train1.count_cars(@car1)).to eq(2)
      @train1.add_cars(@car1, 3)

      expect(@train1.count_cars(@car1)).to eq(5)
    end

    it 'can add_cars, adjusting values of cargo hash' do
      @train1.add_cars(@car1, 2)

      expect(@train1.cargo).to eq({@car1 => 2})
      @train1.add_cars(@car1, 3)

      expect(@train1.cargo).to eq(@car1 => 5)
      @train1.add_cars(@car2, 10)

      expect(@train1.cargo).to eq({@car1 => 5, @car2 => 10})
    end


    it 'can calculate its weight via sum_of_all_cars * weight' do
      @train1.add_cars(@car1, 5)
      @train1.add_cars(@car2, 2)

      expect(@train1.weight).to eq(27)
    end
  end
end
