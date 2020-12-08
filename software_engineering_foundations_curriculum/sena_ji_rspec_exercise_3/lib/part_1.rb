def is_prime?(num)
    return false if num < 2

    (2...num).each do |factor|
        return false if num % factor == 0
    end

    true
end

def nth_prime(num)
    # track current number
    i = 0
    # track prime count
    count = 0

    while true
        # if the current number is prime, count += 1
        if is_prime?(i) 
            count += 1
            # check if count == nth prime
            if count == num
                return i
            else 
                # if count is not the num we want, we iterate to next number
                i += 1
            end
        else
            # if not prime and not the nth prime we want, we iterate to next number
            i += 1
        end
    end
end

def prime_range(min, max)
    prime_array = []

    (min..max).each do |num|
        prime_array << num if is_prime?(num)
    end

    prime_array
end