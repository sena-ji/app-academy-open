class Flight
  # getters
  attr_reader :passengers

  # initializer
  def initialize(flight_number, capacity)
    @flight_number = flight_number
    @capacity = capacity
    @passengers = []
  end

  # instance methods
  def full?
    if @passengers.length == @capacity
      return true
    end

    false
  end

  def board_passenger(passenger)
    if passenger.has_flight?(@flight_number) && !self.full?
      @passengers << passenger
    end
  end

  def list_passengers
    @passengers.map { |passenger| passenger.name }
  end

  def [](idx)
    @passengers[idx]
  end

  def <<(passenger)
    self.board_passenger(passenger)
  end
end