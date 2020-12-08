# Write a method, max_inject(arr), that accepts any amount of numbers arguments and returns
# the largest number. Solve this using the built-in inject.

# "accepts any amount of numbers arguments" -> immediately thought of splat operator
def max_inject(*arr)
    # could have done this with .max if problem premise did not specifically say to use .inject
    max = arr.inject do |acc, elem|
        # I tried to simplify this by: return arr.inject { |acc, elem| elem if elem > acc }
        # I am assuming this did not work because if elem was not greater, the iteration would not have something to return
        if elem > acc
            elem
        else
            acc
        end
    end

    return max
end

p max_inject(1, -4, 0, 7, 5)  # => 7
p max_inject(30, 28, 18)      # => 30
