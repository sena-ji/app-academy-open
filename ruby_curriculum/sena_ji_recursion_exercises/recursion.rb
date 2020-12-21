require 'byebug'

# warmup
# Write a recursive method, range, that takes a start and an end and returns
# an array of all numbers in that range, exclusive.
def range(start, stop)
  return [] if stop < start
  return [stop] if start == stop

  [start] + range(start+1, stop)
end

# p range(0, 5)
# p range(-3, 1)
# p range(3, 1)

# Write both a recursive and iterative version of sum of an array.
# recursive
def sum_array_recur(array)
  return nil if array.empty?
  return array[0] if array.length == 1

  array[0] + sum_array_recur(array[1..-1])
end

# puts sum_array_recur([1, 2, 3])
# puts sum_array_recur([11, 0, -3])
# puts sum_array_recur([])

# iterative
def sum_array_iter(array)
  return nil if array.empty?
  sum = 0

  array.each do |el|
    sum += el
  end

  sum
end

# puts sum_array_iter([1, 2, 3])
# puts sum_array_iter([11, 0, -3])
# puts sum_array_iter([])

# exponentiation
# Write two versions of exponent that use two different recursions.
# recursion 1
def exp_1(base, exp)
  return 1 if exp == 0

  base * exp_1(base, exp-1)
end

# puts exp_1(3, 0)
# puts exp_1(3, 3)
# puts exp_1(3, 5)

# recursion 2
def exp_2(base, exp)
  return 1 if exp == 0
  return base if exp == 1

  if exp % 2 == 0
    even = exp_2(base, exp / 2)
    even * even
  else
    odd = exp_2(base, (exp - 1) / 2)
    base * odd * odd
  end
end

# puts exp_2(3, 0)
# puts exp_2(3, 1)
# puts exp_2(3, 2)
# puts exp_2(3, 3)
# puts exp_2(3, 4)
# puts exp_2(3, 5)

# deep dup
# Using recursion and the is_a? method, write an Array#deep_dup 
# method that will perform a "deep" duplication of the interior arrays.
class Array
  def deep_dup
    new_array = []

    self.each do |el|
      if el.is_a?(Array)
        new_array << el.deep_dup
      else
        new_array << el
      end
    end

    new_array
  end
end

# a = [1, [2], [3, [4]]]
# b = a.deep_dup

# b[1] << 3 
# p b # => b = [1, [2, 3], [3, [4]]]
# p a # => a = [1, [2], [3, [4]]]

# b[2] << [1, 0]
# p b # => b = [1, [2, 3], [3, [4], [1, 0]]]
# p a # => a = [1, [2], [3, [4]]]

# fibonacci
# Write a recursive and an iterative Fibonacci method. The method should take 
# in an integer n and return the first n Fibonacci numbers in an array.
# recursive
def fibonacci_recur(n)
  return 0 if n == 1
  return 1 if n == 2

  fibonacci_recur(n - 1) + fibonacci_recur(n - 2)
end

# puts fibonacci_recur(5)
# puts fibonacci_recur(7)
# puts fibonacci_recur(9)

def fibonacci_iter(n)
  first_prev = 1
  second_prev = 0
  fib_num = 0

  (n-2).times do 
    fib_num = first_prev + second_prev
    second_prev = first_prev
    first_prev = fib_num
  end

  fib_num
end

# puts fibonacci_iter(5)
# puts fibonacci_iter(7)
# puts fibonacci_iter(9)

def bsearch(array, target)
  return nil if array == []

  mid_idx = array.length / 2

  case array[mid_idx] <=> target
  when -1
    right_idx = bsearch(array[mid_idx+1..-1], target)
    mid_idx + right_idx + 1 unless right_idx == nil
  when 0
    mid_idx
  when 1
    bsearch(array[0...mid_idx], target)
  end
end

# puts bsearch([1, 2, 3], 1) # => 0
# puts bsearch([2, 3, 4, 5], 3) # => 1
# puts bsearch([2, 4, 6, 8, 10], 6) # => 2
# puts bsearch([1, 3, 4, 5, 9], 5) # => 3
# puts bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# puts bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# puts bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

# merge sort
# Implement a method merge_sort that sorts an Array.
def merge_sort(array)
  return array if array.length <= 1

  mid_idx = (array.length/2)
  left_side = array[0...mid_idx]
  right_side = array[mid_idx..-1]

  sort_left = merge_sort(left_side)
  sort_right = merge_sort(right_side)

  merge_halves(sort_left, sort_right)
end

def merge_halves(left, right)
  new_array = []
  left_idx, right_idx = 0, 0

  while left_idx < left.length && right_idx < right.length
    case left[left_idx] <=> right[right_idx]
    when -1
      new_array << left[left_idx]
      left_idx += 1
    when 0
      new_array << left[left_idx]
      left_idx += 1
    when 1
      new_array << right[right_idx]
      right_idx += 1
    end
  end

  while left_idx < left.length
    new_array << left[left_idx]
    left_idx += 1
  end

  while right_idx < right.length
    new_array << right[right_idx]
    right_idx += 1
  end

  new_array
end

# p merge_sort([38, 27, 43, 3, 9, 82, 10])

# array subsets
# Write a method subsets that will return all subsets of an array.
def subsets(array)
  return [[]] if array == []

  sets = subsets(array[0...-1])
  sets + sets.map { |el| el += [array.last] }
end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]