# Write a method, grid(n, m), that accepts two numbers as args.
# The method should return a 2D array with n rows and m columns (this means that there are n subarrays, each of length m).

def grid(n, m)
    # note: if code was written like grid = Array.new(n, Array.new(m))
    # this is distributing the same array made by Array.new(m) to each column
    # mutating a value in one sub array will affect ALL arrays
    # writing Array.new(m) in {} allows a new array to be created after each block iteration
    grid = Array.new(n) { Array.new(m) }

    grid
end

result_1 = grid(2, 3)
p result_1              # => [[nil, nil, nil], [nil, nil, nil]]
result_1[0][0] = "X"
p result_1              # => [["X", nil, nil], [nil, nil, nil]]


result_2 = grid(4, 2)
p result_2              # => [[nil, nil], [nil, nil], [nil, nil], [nil, nil]]
result_2[0][0] = "Q"
p result_2              # => [["Q", nil], [nil, nil], [nil, nil], [nil, nil]]
