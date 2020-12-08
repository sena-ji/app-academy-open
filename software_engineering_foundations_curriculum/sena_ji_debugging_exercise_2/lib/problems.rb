# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
    prime_factors = []
    (2..num).each do |n|
        prime_factors << n if prime?(n) && num % n == 0
    end
    prime_factors[-1]
end

def prime?(num)
    (2...num).each do |n|
        return false if num % n == 0
    end
    true
end

def unique_chars?(string)
    chars = string.split("")
    unique_chars = chars.uniq
    chars == unique_chars
end

def dupe_indices(array)
    dupe_hash = Hash.new{ |h, k| h[k] = [] }
    array.each_with_index do |elem, idx|
        dupe_hash[elem].push(idx)
    end

    dupe_hash.delete_if { |k, v| v.length < 2 }

    dupe_hash
end

def ana_array(arr_1, arr_2)
    bubble_sort(arr_1) == bubble_sort(arr_2)
end

def bubble_sort(arr)
    sorted = false
    
    while !sorted
        sorted = true
        (0...arr.length - 1).each do |i|
            if arr[i] > arr[i + 1]
                arr[i], arr[i + 1] = arr[i + 1], arr[i]
                sorted = false
            end
        end
    end

    arr
end