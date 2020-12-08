# Write a method, adult_in_group?(people), that accepts an array containing people.
# The method should return true if there is at least 1 person with an age of 18 or greater.
# The method should return false otherwise.

def adult_in_group?(people)
    count = 0

    # iterate through every array and increase count
    # if age key's value is greater or equal to 18
    people.map do |ele|
        count += 1 if ele[:age] >= 18
    end
    
    # return true if count is greater or equal to 1
    return count >= 1
end

people_1 = [
    {name: "Jack", age: 17},
    {name: "Jill", age: 21},
    {name: "Alice", age: 15},
    {name: "Bob", age: 16}
]
p adult_in_group?(people_1)    # => true

people_2 = [
    {name: "Jane", age: 12},
    {name: "John", age: 13},
    {name: "Ashley", age: 10},
    {name: "Bill", age: 16}
]
p adult_in_group?(people_2)    # => false
