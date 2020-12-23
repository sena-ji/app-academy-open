def strange_sums(array)
  count = 0

  array.each_with_index do |elem1, idx1|
    array.each_with_index do |elem2, idx2|
      if (elem1 + elem2 == 0) && (idx1 < idx2)
        count += 1
      end
    end
  end

  count
end

# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0

def pair_product(array, product)
  array.each_with_index do |elem1, idx1|
    array.each_with_index do |elem2, idx2|
      if (elem1 * elem2 == product) && (idx1 < idx2)
        return true 
      end   
    end
  end

  false
end

# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

def rampant_repeats(string, hash)
  new_word = ""

  string.each_char do |char|
    if hash.has_key?(char)
      new_word += char * hash[char]
    else
      new_word += char
    end
  end

  new_word
end

# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

def perfect_square?(number)
  (0..number).each do |num|
    if num * num == number
      return true
    end
  end

  false
end

# p perfect_square?(1)     # true
# p perfect_square?(4)     # true
# p perfect_square?(64)    # true
# p perfect_square?(100)   # true
# p perfect_square?(169)   # true
# p perfect_square?(2)     # false
# p perfect_square?(40)    # false
# p perfect_square?(32)    # false
# p perfect_square?(50)    # false

def anti_prime?(number)
  (1...number).each do |num|
    return false if count_divisors(num) > count_divisors(number)
  end

  true
end

def count_divisors(number)
  count = 0

  (1..number).each do |num|
    count += 1 if number % num == 0
  end

  count
end

# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false

def matrix_addition(matrix1, matrix2)
  new_matrix = Array.new(matrix1.length) { Array.new(matrix1[0].length) }

  # initially did this with matrix1.each
  # realized that if I do that for cols, it is picking the wrong elem
  # will pick the elems in respect to rows
  (0...matrix1.length).each do |row|
    (0...matrix1[0].length).each do |col|
      new_matrix[row][col] = matrix1[row][col] + matrix2[row][col]
    end
  end

  new_matrix
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def mutual_factors(*numbers)
  # the & method returns the intersection between arrays
  numbers.map { |n| find_factors(n) }.inject(:&)
end

def find_factors(number)
  (1..number).select { |num| number % num == 0 }
end

# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

def tribonacci_number(n)
  return 1 if n == 1 || n == 2
  return 2 if n == 3

  tribonacci_number(n-3) + tribonacci_number(n-2) + tribonacci_number(n-1)
end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274

def matrix_addition_reloaded(*matrices)
  first_matrix = matrices.first
  height = first_matrix.length
  width = first_matrix[0].length

  matrices.inject do |m1, m2|
    # compare height and length to the first matrix, if not equal, then return nil
    return nil if m2.length != height or m2[0].length != width
    # add both matrices and store in acc
    matrix_addition(m1, m2)
  end
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

def squarocol?(grid)
  # Array#any? goes through each row -> okay to use on 2D arrays
  return true if grid.any? { |row| row.uniq.length == 1 }
  return true if grid.transpose.any? { |col| col.uniq.length == 1 }
  
  false
end

# p squarocol?([
#     [:a, :x , :d],
#     [:b, :x , :e],
#     [:c, :x , :f],
# ]) # true

# p squarocol?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) # true

# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false

def squaragonal?(grid)
  down_diagonal = (0...grid.length).collect { |idx| grid[idx][idx] }
  return true if down_diagonal.uniq.length == 1

  width = grid.length - 1
  up_diagonal = []
  (0...grid.length).each do |row|
    up_diagonal << grid[row][width]
    width -= 1
  end

  return true if up_diagonal.uniq.length == 1

  false
end

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :x, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :o, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 7],
#     [1, 1, 6, 7],
#     [0, 5, 1, 7],
#     [4, 2, 9, 1],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 5],
#     [1, 6, 5, 0],
#     [0, 2, 2, 7],
#     [5, 2, 9, 7],
# ]) # false

def pascals_triangle(n)
  # initialize the first row
  triangle = [[1]]

  # while we haven't reached the nth row
  while triangle.length < n
    # get the above row
    level_above = triangle.last
    # initialize the next row
    next_level = [1]
    # paste the adjacent sums from previous row to next row
    next_level += adjacent_sum(level_above)
    # add the end 1
    next_level << 1
    # shovel that thang
    triangle << next_level
  end

  triangle
end

def adjacent_sum(arr)
  sums = []
  # add the adjacent numbers for the middle part of the triangle
  (0...arr.length-1).each do |i|
      sums << arr[i] + arr[i + 1]
  end
  sums
end

# p pascals_triangle(5)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]

# p pascals_triangle(7)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]

def mersenne_prime(n)
  count = 0
  x = 0

  while count < n
    x += 1
    candidate = 2**x - 1
    count += 1 if is_prime?(candidate)
  end

  2**x - 1
end

def is_prime?(num)
  return false if num < 2

  (2...num).none? { |n| num % n == 0 }
end

# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071

def triangular_word?(word)
  word_code = word_encoding(word)
  sequence = triangular_sequence(word_code)

  sequence.include?(word_code)
end

def triangular_sequence(n)
  seq = []
  i = 1

  while i <= n
      seq << (i * (i + 1)) / 2
      i += 1
  end

  seq
end

def word_encoding(word)
  alphabet = ('a'..'z').to_a
  sum = 0

  word.each_char { |char| sum += (alphabet.index(char) + 1) }

  sum
end

# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # false

def consecutive_collapse(numbers)
  # reassign numbers with the collpased numbers for however many times the length of the array is
  numbers.length.times { numbers = collapse(numbers) }
  numbers
end

def collapse(nums)
  # return the array with the elements removed if they are consecutive
  (0...nums.length - 1).each do |i|
      if nums[i] + 1 == nums[i + 1] || nums[i] == nums[i + 1] + 1
          return nums[0...i] + nums[i + 2..-1]
      end
  end

  nums
end

# p consecutive_collapse([3, 4, 1])                     # [1]
# p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
# p consecutive_collapse([9, 8, 2])                     # [2]
# p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
# p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
# p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
# p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
# p consecutive_collapse([13, 11, 12, 12])              # []

def pretentious_primes(array, n)
  new_array = []

  array.each do |num|
    new_array << next_prime(num, n)
  end

  new_array
end

def next_prime(number, i)
  step = 1
  # if n is negative
  if i < 0
      # make i positive
      i = -(i)
      # step will be negative 1
      step = -(step)
  end

  prime_count = 0
  while prime_count < i
      return nil if number < 0
      number += step
      prime_count += 1 if is_prime?(number)
  end
  number
end

# p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
# p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
# p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
# p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
# p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
# p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
# p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
# p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
# p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
# p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]