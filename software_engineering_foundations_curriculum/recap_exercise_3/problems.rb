def no_dupes?(array)
    array.select { |elem| array.one?(elem) }
end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(array)
    (0...array.length-1).each do |idx|
        return false if array[idx] == array[idx+1]
    end

    true
end

# puts no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# puts no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# puts no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# puts no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# puts no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    indices = Hash.new { |h, k| h[k] = Array.new}

    str.each_char.with_index do |char, idx|
        indices[char] << idx
    end

    indices
end

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# puts
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
    current = ""
    longest = ""

    (0...str.length).each do |idx|
        if str[idx] == str[idx-1] || idx == 0 
            current += str[idx]
        else
            current = str[idx]
        end

        if current.length >= longest.length
            longest = current
        end
    end

    longest
end

# puts longest_streak('a')           # => 'a'
# puts longest_streak('accccbbb')    # => 'cccc'
# puts longest_streak('aaaxyyyyyzz') # => 'yyyyy
# puts longest_streak('aaabbb')      # => 'bbb'
# puts longest_streak('abc')         # => 'c'

def bi_prime?(num)
    factors = []

    (2...num).each do |factor|
        factors << factor if num % factor == 0 
    end

    return false if factors.length > 2
    
    factors.each do |number|
        (2...number).each do |factor|
            return false if number % factor == 0
        end
    end

    true
end

# puts bi_prime?(14)   # => true
# puts bi_prime?(22)   # => true
# puts bi_prime?(25)   # => true
# puts bi_prime?(94)   # => true
# puts bi_prime?(24)   # => false
# puts bi_prime?(64)   # => false

def vigenere_cipher(message, keys)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    vigenere = ""

    message.each_char.with_index do |char, i|
        index = alphabet.index(char)
        key = keys[i % keys.length].to_i
        new_char = alphabet[(index + key) % 26] 
        vigenere += new_char
    end

    vigenere
end

# puts vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# puts vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# puts vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# puts vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# puts vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)
    vowels = "aeiou"
    str_vowels = (0...str.length).select { |i| vowels.include?(str[i]) }
    new_string = str[0..-1]
    new_str_vowels = str_vowels.rotate(-1)

    str_vowels.each_with_index do |vowel_idx, i|
        new_vowel = str[new_str_vowels[i]]
        new_string[vowel_idx] = new_vowel
    end

    new_string
end

# puts vowel_rotate('computer')      # => "cempotur"
# puts vowel_rotate('oranges')       # => "erongas"
# puts vowel_rotate('headphones')    # => "heedphanos"
# puts vowel_rotate('bootcamp')      # => "baotcomp"
# puts vowel_rotate('awesome')       # => "ewasemo"

class String 
    def select(&prc)
        return "" if prc.nil?

        new_str = ""

        self.each_char do |char|
            if prc.call(char)
                new_str += char
            end
        end

        new_str
    end

    def map!(&prc)
        self.each_char.with_index do |char, idx|
            self[idx] = prc.call(char, idx)
        end
    end
end

# puts "HELLOworld".select          # => ""
# puts "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# puts "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"

# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"

def multiply(a, b)
    return a if b == 1

    if b < 0
        -(a + multiply(a, b.abs-1))
    else
        a + multiply(a, b-1)
    end
end

# puts multiply(3, 5)        # => 15
# puts multiply(5, 3)        # => 15
# puts multiply(2, 4)        # => 8
# puts multiply(0, 10)       # => 0
# puts multiply(-3, -6)      # => 18
# puts multiply(3, -6)       # => -18
# puts multiply(-3, 6)       # => -18

def lucas_sequence(length)
    return [] if length == 0
    return [2] if length == 1
    return [2, 1] if length == 2

    seq = lucas_sequence(length - 1)
    next_part = seq[-1] + seq[-2]
    seq << next_part
    seq
end

# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def prime_factorization(num)
    (2...num).each do |factor|
        if num % factor == 0
            other = num / factor
            return prime_factorization(factor).concat(prime_factorization(other))
        end
    end

    [num]
end

# p prime_factorization(12)     # => [2, 2, 3]
# p prime_factorization(24)     # => [2, 2, 2, 3]
# p prime_factorization(25)     # => [5, 5]
# p prime_factorization(60)     # => [2, 2, 3, 5]
# p prime_factorization(7)      # => [7]
# p prime_factorization(11)     # => [11]
# p prime_factorization(2017)   # => [2017]