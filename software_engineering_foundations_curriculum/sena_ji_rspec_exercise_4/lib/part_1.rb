def my_reject(array, &prc)
    rejected = []

    array.each do |elem|
        rejected << elem if !(prc.call(elem))
    end

    rejected
end

def my_one?(array, &prc)
    counts = 0

    array.each do |elem|
        counts += 1 if prc.call(elem)
    end

    if counts != 1
        return false
    else
        true
    end
end

def hash_select(hash, &prc)
    new_hash = {}

    hash.each do |k, v|
        if prc.call(k, v)
            new_hash[k] = v
        end
    end

    new_hash
end

def xor_select(array, prc1, prc2)
    xor_array = []

    array.each do |elem|
        if (prc1.call(elem) || prc2.call(elem)) && !(prc1.call(elem) && prc2.call(elem))
            xor_array << elem
        end
    end

    xor_array
end

def proc_count(value, prc_array)
    counts = 0

    prc_array.each do |prc|
        if prc.call(value)
            counts += 1
        end
    end

    counts 
end