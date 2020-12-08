class GuessingGame
    # initializer
    def initialize(min, max)
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end

    # getters
    def num_attempts
        @num_attempts
    end

    def game_over?
        @game_over
    end

    # instance methods
    def check_num(num)
        @num_attempts += 1

        if num > @secret_num
            puts "Too big..."
        elsif num < @secret_num
            puts "Too small..."
        else
            @game_over = true 
            puts "You win!"
        end
    end

    def ask_user
        print "Enter a number: "
        num = gets.chomp.to_i
        check_num(num)
    end
end
