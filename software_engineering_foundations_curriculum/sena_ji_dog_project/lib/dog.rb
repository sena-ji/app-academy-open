class Dog
    #initializer
    def initialize(name, breed, age, bark, favorite_foods)
        @name = name
        @breed = breed
        @age = age
        @bark = bark
        @favorite_foods = favorite_foods
    end

    # getter methods
    def name
        @name
    end

    def breed
        @breed
    end

    def age
        @age
    end

    def favorite_foods
        @favorite_foods
    end

    # setter methods
    def age=(num)
        @age = num
    end

    # instance methods
    def bark
        if @age > 3
            return @bark.upcase
        else
            return @bark.downcase
        end
    end

    def favorite_food?(food)
        @favorite_foods.map(&:downcase).include?(food.downcase)
    end
end