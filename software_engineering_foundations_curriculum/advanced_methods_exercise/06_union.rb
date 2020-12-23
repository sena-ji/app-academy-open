# Write a method, union, that accepts any number of arrays as arguments.
# The method should return an array containing all elements of the given arrays.

# "accepts any number of arrays" = splat operator
# decided to use single parameter with splat operator to combine all arrays into multi-dimensional array from the start
def union(*arr)
    arr.flatten
end

p union(["a", "b"], [1, 2, 3]) # => ["a", "b", 1, 2, 3]
p union(["x", "y"], [true, false], [20, 21, 23]) # => ["x", "y", true, false, 20, 21, 23]
