# time complexity is O(n^2)
def bad_two_sum?(arr, target_sum)
  (0...arr.length).each do |idx1|
    (idx1+1...arr.length).each do |idx2|
      return true if arr[idx1] + arr[idx2] == target_sum
    end
  end

  false
end



if __FILE__ == $PROGRAM_NAME
  arr = [0, 1, 5, 7]
  puts bad_two_sum?(arr, 6) # => should be true
  puts bad_two_sum?(arr, 10) # => should be false
end