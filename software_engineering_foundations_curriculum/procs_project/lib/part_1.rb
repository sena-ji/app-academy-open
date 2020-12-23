def my_map(array, &prc)
    new_arr = []
    array.each { |elem| new_arr << prc.call(elem) }
    new_arr
end

def my_select(array, &prc)
    new_arr = []
    array.each { |elem| new_arr << elem if prc.call(elem) }
    new_arr
end

def my_count(array, &prc)
    count = 0
    array.each { |elem| count += 1 if prc.call(elem) }
    count
end

def my_any?(array, &prc)
    array.each { |elem| return true if prc.call(elem) }
    false
end

def my_all?(array, &prc)
    array.each { |elem| return false if !(prc.call(elem)) }
    true
end

def my_none?(array, &prc)
    array.each { |elem| return false if prc.call(elem) }
    true
end