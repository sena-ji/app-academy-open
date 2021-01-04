# given a list of integers, find the smallest number in the list
# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# my_min(list)  # =>  -5

# phase 1
# write a function that compares each element to every other element of the list.
# return the element if all other elements in the array are larger
def my_min1(int_list)

end

# phase 2
# rewrite the function to iterate through the list just once while keeping track of the minimum
def my_min2(int_list)
  min = 0

  int_list.each do |int|
    min = int if int < min
  end

  min
end
# what is the time complexity? O(n)