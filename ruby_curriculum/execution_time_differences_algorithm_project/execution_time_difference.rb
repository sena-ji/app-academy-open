# given a list of integers, find the smallest number in the list
# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# my_min(list)  # =>  -5

# phase 1
def my_min1(int_list)
  int_list.each do |int1|
    return int1 if int_list.all? { |int2| int2 >= int1 }
  end
end
# what is the time complexity? O(n^2)

# phase 2
def my_min2(int_list)
  min = 0

  int_list.each do |int|
    min = int if int < min
  end

  min
end
# what is the time complexity? O(n)

# find the sums of all contiguous sub-arrays and return the max
# list = [5, 3, -7]
# largest_contiguous_subsum(list) # => 8

# list = [2, 3, -6, 7, -6, 7]
# largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

# list = [-5, -1, -3]
# largest_contiguous_subsum(list) # => -1 (from [-1])

# phase 1
def largest_contiguous_subsum1(int_list)
  sub_arrays = []

  (0...int_list.length).each do |idx1|
    (idx1...int_list.length).each do |idx2|
      sub_arrays << int_list[idx1..idx2]
    end
  end

  sub_arrays.each_with_index do |arr, idx|
    sum_arr = arr.sum
    sub_arrays[idx] = sum_arr
  end

  sub_arrays.max
end

# what is the time complexity? O(n^2 + n)
# I think the time complexity is O(n^2 + n) because there are 2 nested loops for the first loop
# then there is another loop after the nested loop to find the sum of the sub arrays within the array