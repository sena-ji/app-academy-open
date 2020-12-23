def average(num_1, num_2)
    (num_1 + num_2) / 2.0
end

def average_array(array)
    array.inject(0.0) { |sum, elem| sum + elem } / array.length
end

def repeat(str, num)
    str * num
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(sentence)
    new_words = []
    sentence.split.each_with_index do |word, idx|
        if idx % 2 == 0
            new_words << word.upcase
        else
            new_words << word.downcase
        end
    end

    new_words.join(" ")
end