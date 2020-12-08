def palindrome?(string)
    reversed = ""
    i = string.length - 1

    while i >= 0
        reversed << string[i]
        i -= 1
    end

    string == reversed
end

def substrings(string)
    i = 0
    array = []

    while i < string.length
        array << string[i]
        j = i + 1
        while j < string.length
            array << string[i..j]
            j += 1
        end
        i += 1
    end

    array.uniq
end

def palindrome_substrings(string)
    sub_array = substrings(string)
    palindrome_array = []

    sub_array.each do |elem|
        palindrome_array << elem if palindrome?(elem) && elem.length > 1
    end

    palindrome_array
end