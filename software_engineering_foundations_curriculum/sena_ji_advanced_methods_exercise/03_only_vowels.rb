# Write a method, `only_vowels?(str)`, that accepts a string as an arg.
# The method should return true if the string contains only vowels.
# The method should return false otherwise.

def only_vowels?(str)
    vowels = "aeiou"

    # as soon as you encounter a non-vowel, return false
    # if loop does not break from false and finishes, return true
    str.each_char do |char|
        return false if !(vowels.include?(char))
    end

    return true
end

p only_vowels?("aaoeee")  # => true
p only_vowels?("iou")     # => true
p only_vowels?("cat")     # => false
p only_vowels?("over")    # => false


