def reverser(string, &prc)
    prc.call(string.reverse)
end

def word_changer(sentence, &prc)
    new_sentence = []

    sentence.split(" ").each { |word| new_sentence << prc.call(word) }

    return new_sentence.join(" ")
end

def greater_proc_value(num, prc_1, prc_2)
    prc1_result = prc_1.call(num)
    prc2_result = prc_2.call(num)

    if prc1_result > prc2_result
        return prc1_result
    else
        return prc2_result
    end
end

def and_selector(array, prc_1, prc_2)
    new_array = []

    array.each { |elem| new_array << elem if prc_1.call(elem) && prc_2.call(elem) }

    new_array
end

def alternating_mapper(array, prc_1, prc_2)
    new_array = []

    array.each_with_index do |elem, idx|
        if idx % 2 == 0
            new_array << prc_1.call(elem)
        else
            new_array << prc_2.call(elem)
        end
    end

    new_array
end