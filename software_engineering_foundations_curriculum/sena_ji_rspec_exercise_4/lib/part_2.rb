def proper_factors(num)
    factors = []

    (1...num).each do |factor|
        if num % factor == 0 && factor < num
            factors << factor
        end
    end

    factors
end

def aliquot_sum(num)
    proper_facts = proper_factors(num)

    proper_facts.inject { |acc, elem| acc + elem }
end

def perfect_number?(num)
    aliquot_result = aliquot_sum(num)

    if num == aliquot_result
        return true
    else
        return false
    end
end

def ideal_numbers(num)
    perfect_nums = []
    count = 0
    i = 0

    while count < num
        if perfect_number?(i)
            perfect_nums << i
            count += 1
            i += 1
        else
            i += 1
        end
    end

    perfect_nums
end