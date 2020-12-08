# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    compressed = ""

    i = 0
    # iterate through the whole string
    while i < str.length
        char = str[i]

        count = 0
        # keep iterating i and count if consecutive chars are found
        # i will be iterated here and will keep its place for the outer while loop too
        while char == str[i]
            count += 1
            i += 1
        end
        
        # don't want the 1 in front of single lone chars
        if count == 1
            compressed += char
        else
            compressed += count.to_s + char
        end
    end
    
    compressed
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
