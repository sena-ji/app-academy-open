class Passenger
  # getters
  attr_reader :name

  # initializer
  def initialize(name)
    @name = name
    @flight_numbers = []
  end

  # instance methods
  def has_flight?(flight_number)
    @flight_numbers.include?(flight_number.upcase)
  end

  def add_flight(flight_number)
    @flight_numbers << flight_number.upcase if !has_flight?(flight_number)
  end
end