class Train
  attr_reader :name,
              :type,
              :cargo
  def initialize(train_info)
    @name = train_info[:name]
    @type = train_info[:type]
    @cargo = Hash.new(0)
  end

  def count_cars(car)
    @cargo[car]
  end

  def add_cars(car, num_of_cars)
    if @cargo[car].nil?
      @cargo[car] = num_of_cars
    else
      @cargo[car] += num_of_cars
    end
  end

  def weight
    result = 0
    @cargo.each do |car, num_of_cars|
      result += num_of_cars * car.weight
    end
    result
  end
end
