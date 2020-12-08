def element_count(array)
    counts = Hash.new(0)

    array.each do |elem|
        counts[elem] += 1
    end

    counts
end

def char_replace!(str, hash)
    str.each_char.with_index do |char, idx|
        if hash.has_key?(char)
            str[idx] = hash[char]
        end
    end

    str
end

def product_inject(array)
    array.inject { |acc, num| acc * num }
end