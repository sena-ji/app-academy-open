class Employee
    # getters
    attr_reader :name, :title

    # initializer
    def initialize(name, title)
        @name = name
        @title = title
        @earnings = 0
    end

    # instance methods
    def pay(amount)
        @earnings += amount
    end
end
