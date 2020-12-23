# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

def coprime?(num_1, num_2)
    arr = []

    # pass in the smaller value first
    # any factors past the smaller value will not matter since it won't be divisible by both
    # could have called factors() twice to get two arrays containing factors of both numbers and compare
    # this method would have taken longer since I would have to write another iteration to compare both arrays
    if num_1 < num_2
        arr = factors(num_1, num_2)
    else
        arr = factors(num_2, num_1)
    end

    arr.all? { |el| el == 1 }
end

# helper function to find factors of both numbers
# neater than including this in main function
def factors(num1, num2)
    arr = []

    (1..num1).each do |ele|
        # compare if ele is divisible for both numbers
        arr << ele if num1 % ele == 0 && num2 % ele == 0
    end
    
    return arr
end

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
