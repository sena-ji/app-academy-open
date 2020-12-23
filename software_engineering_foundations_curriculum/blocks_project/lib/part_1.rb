def select_even_nums(array)
    array.select(&:even?)
end

def reject_puppies(array)
    array.reject { |dog| dog["age"] <= 2}
end

def count_positive_subarrays(array)
    array.count { |sub| sub.sum > 0}
end

def aba_translate(word)
    vowels = "aeiou"
    aba_word = ""

    word.each_char do |char|
        if vowels.include?(char)
            aba_word += char + "b" + char
        else
            aba_word += char
        end
    end

    aba_word
end

def aba_array(array)
    array.map { |word| aba_translate(word) }
end