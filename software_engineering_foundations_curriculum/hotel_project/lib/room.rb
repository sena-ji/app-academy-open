class Room
    # initializer
    def initialize(num)
        @capacity = num
        @occupants = []
    end

    # getter
    def capacity
        @capacity
    end

    def occupants
        @occupants
    end

    # instance methods
    def full?
        if @occupants.length == @capacity
            return true
        end

        false
    end

    def available_space
        @capacity - @occupants.length
    end

    def add_occupant(name)
        if self.full?
            return false
        end

        @occupants << name
        true
    end
end
