# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
    vowels = ["a", "e", "i", "o", "u"]
    pairs = []

    words.each_with_index do |elem1, idx1|
        words.each_with_index do |elem2, idx2|
            # concat the pair of words before we check
            pair = elem1 + " " + elem2
            # if elem1 comes before elem2 AND all vowels are included in the pair
            # shovel the pair into the array of pairs
            if (idx2 > idx1) && (vowels.all? { |vowel| pair.include?(vowel) })
                pairs << pair
            end
        end
    end

    pairs
end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    (2...num).each { |factor| return true if num % factor == 0 }
    false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    bigrams.select { |bigram| str.include?(bigram) }
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        # if a proc is passed, we use that
        # if the proc is nil, it is false so we use the default one
        prc ||= Proc.new { |k, v| k == v }
        new_hash = {}

        # self == a hash
        self.each do |k, v|
            new_hash[k] = v if prc.call(k, v)
        end

        new_hash
    end
end


class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    # note on parameter: if an argument is given, it will use that argument as the value of length
    # if an argument is not given, it will use the default value, which is in the parameter
    def substrings(length = nil)
        sub_strings = []

        # we start at idx1 for the second loop to include single character substrings
        (0...self.length).each do |idx1|
            (idx1...self.length).each do |idx2|
                sub_strings << self[idx1..idx2]
            end
        end

        if length.nil?
            sub_strings
        else
            sub_strings.select { |str| str.length == length }
        end
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        alphabet = "abcdefghijklmnopqrstuvwxyz"
        caesar = ""

        self.each_char do |char|
            index = alphabet.index(char)
            new_char = alphabet[(index + num) % 26] 
            caesar += new_char
        end

        caesar
    end
end
