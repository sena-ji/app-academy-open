def partition(array, number)
    partition = [[], []]

    array.each do |elem|
        if elem < number
            partition[0] << elem
        else
            partition[1] << elem
        end
    end

    partition
end

def merge(h1, h2)
    h1.merge(h2)
end

def censor(sentence, curse_words)
    words = sentence.split
    new_words = []

    words.each do |word|
        lowercase_word = word.downcase
        if curse_words.include?(lowercase_word)
            new_words << censor_word(word)
        else
            new_words << word
        end
    end

    new_words.join(" ")
end

def censor_word(word)
    vowels = "aeiouAEIOU"
    new_word = ""

    word.each_char do |char|
        if vowels.include?(char)
            new_word << "*"
        else
            new_word << char
        end
    end

    new_word
end

puts censor_word("DOOR")

def power_of_two?(num)
    while (num % 2 == 0 and num != 0)
        num /= 2
    end

    num == 1
end