# Write a function sum_to(n) that uses recursion to calculate the sum from 1 
# to n (inclusive of n).
def sum_to(n)
  return nil if n < 0
  return 0 if n == 0

  n + sum_to(n-1)
end

# Test Cases
# puts sum_to(5)  # => returns 15
# puts sum_to(1)  # => returns 1
# puts sum_to(9)  # => returns 45
# puts sum_to(-8)  # => returns nil
# puts sum_to(0)  # => returns 0

# Write a function add_numbers(nums_array) that takes in an array of 
# Integers and returns the sum of those numbers. Write this method recursively.
def add_numbers(nums_array)
  return nums_array[0] if nums_array.length <= 1

  nums_array[0] + add_numbers(nums_array[1..-1])
end

# Test Cases
# p add_numbers([1,2,3,4]) # => returns 10
# p add_numbers([3]) # => returns 3
# p add_numbers([-80,34,7]) # => returns -39
# p add_numbers([]) # => returns nil

# Let's write a method that will solve 
# Gamma Function recursively. The Gamma Function is defined Γ(n) = (n-1)!.
def gamma_fnc(n)
  return nil if n < 1
  return 1 if n == 1

  (n-1) * gamma_fnc(n-1)
end

# Test Cases
# puts gamma_fnc(0)  # => returns nil
# puts gamma_fnc(1)  # => returns 1
# puts gamma_fnc(4)  # => returns 6
# puts gamma_fnc(8)  # => returns 5040

# Write a function ice_cream_shop(flavors, favorite) that takes in an 
# array of ice cream flavors available at the ice cream shop, as well 
# as the user's favorite ice cream flavor. Recursively find out whether 
# or not the shop offers their favorite flavor.
def ice_cream_shop(flavors, favorite)
  return false if flavors == []
  return true if flavors[0] == favorite
    
  ice_cream_shop(flavors[1..-1], favorite)
end

# Test Cases
# p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
# p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
# p ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
# p ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
# p ice_cream_shop([], 'honey lavender')  # => returns false

# Write a function reverse(string) that takes in a string and returns it reversed.
def reverse(string)
  return string if string.length <= 1

  reverse(string[1..-1]) + string[0]
end

# Test Cases
puts reverse("house") # => "esuoh"
puts reverse("dog") # => "god"
puts reverse("atom") # => "mota"
puts reverse("q") # => "q"
puts reverse("id") # => "di"
puts reverse("") # => ""