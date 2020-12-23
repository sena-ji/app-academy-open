def zip(*arrays)
    single_arr = arrays[0].length
    multi_arr = arrays.length
    new_array = Array.new(single_arr) { Array.new(multi_arr) }
    
    (0...multi_arr).each do |row|
        (0...single_arr).each do |col|
            new_array[col][row] = arrays[row][col]
        end
    end

    new_array
end

def prizz_proc(arr, prc1, prc2)
    one_true_arr = []

    (0...arr.length).each do |idx|
        if (prc1.call(arr[idx]) || prc2.call(arr[idx])) && !(prc1.call(arr[idx]) && prc2.call(arr[idx]))
            one_true_arr << arr[idx]
        end
    end

    one_true_arr
end

def zany_zip(*arrays)
    single_arr = arrays.map(&:size).max
    multi_arr = arrays.length
    new_array = Array.new(single_arr) { Array.new(multi_arr) }
    
    (0...multi_arr).each do |row|
        (0...single_arr).each do |col|
            new_array[col][row] = arrays[row][col]
        end
    end

    new_array
end

def maximum(arr, &prc)
    return nil if arr == []

    array = []

    arr.each do |elem|
        array << prc.call(elem)
    end

    max_value = array.max
    max_index = array.reverse.index(max_value)
    arr.reverse[max_index]
end

def my_group_by(arr, &prc)
    group_hash = Hash.new { |h, k| h[k] = [] }

    arr.each do |elem|
        group_hash[prc.call(elem)] << elem
    end

    group_hash
end

def max_tie_breaker(arr, prc1, &prc2)
    # struggled with this problem a bit
    # comments are for myself
    return nil if arr == []
    max = arr.first
    arr.each do |el|
        # keep iterating through the array and compare the next result with current max
        # if the next one if greater, swap with max
        result_el = prc2.call(el)
        result_max = prc2.call(max)
        if result_el > result_max
            max = el
        # if there is a tie with the current max and the next element is greater from prc call
        # swap the current max and return
        elsif result_el == result_max && prc1.call(el) > prc1.call(max)
            max = el
        end
    end
    max

end

def silly_syllables(sentence)
    words = sentence.split(" ")

    voweless_words = words.map do |word|
        v_indices = vowel_indices(word)

        if v_indices.length < 2
            word
        else
            word[v_indices.first..v_indices.last]
        end
    end

    voweless_words.join(" ")
end

def vowel_indices(word)
    vowels = "aeiou"
    indices = []

    word.each_char.with_index do |char, idx|
        indices << idx if vowels.include?(char)
    end

    indices
end