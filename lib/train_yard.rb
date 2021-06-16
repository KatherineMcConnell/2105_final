class TrainYard
  attr_reader :location,
              :trains

  def initialize(yard_info)
    @location = yard_info[:location]
    @trains = []
  end

  def add_train(train)
    @trains << train
  end

  def types_of_trains
    @trains.flat_map do |train|
      train.type
    end.uniq.sort
  end

  def trains_containing(car)
    @trains.find_all do |train|
      train.cargo.include?(car)
    end
  end

  def sorted_cargo_list
    result = []
    @trains.each do |train|
      train.cargo.each do |car, num_of_cars|
        result << car.type
      end
    end
    result.uniq.sort
  end

  def total_inventory
    result = {}
    @trains.each do |train|
      train.cargo.each do |car, num_of_cars|
        if result[car].nil?
          result[car] = num_of_cars
        else
          result[car] += num_of_cars
        end
      end
    end
    result
  end

  def overflow_cars
    if total_inventory[car] > 10 && 

  end
end
