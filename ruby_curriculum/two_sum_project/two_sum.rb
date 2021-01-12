# time complexity is O(n^2)
def bad_two_sum?(arr, target_sum)
  (0...arr.length).each do |idx1|
    (idx1+1...arr.length).each do |idx2|
      return true if arr[idx1] + arr[idx2] == target_sum
    end
  end

  false
end

# time complexity is O(n) as indicated in this stackoverflow thread:
# https://stackoverflow.com/questions/8334981/find-pair-of-numbers-in-array-that-add-to-given-sum
def okay_two_sum?(arr, target_sum)
  sorted_arr = arr.sort
  left_pointer = 0
  right_pointer = arr.length - 1

  while left_pointer < right_pointer
    return true if arr[left_pointer] + arr[right_pointer] == target_sum
    left_pointer += 1 if arr[left_pointer] + arr[right_pointer] < target_sum
    right_pointer -= 1 if arr[left_pointer] + arr[right_pointer] > target_sum
  end

  false
end

if __FILE__ == $PROGRAM_NAME
  arr = [0, 1, 5, 7]
  puts okay_two_sum?(arr, 6) # => should be true
  puts okay_two_sum?(arr, 10) # => should be false
end