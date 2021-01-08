# O(n!)
def first_anagram?(str1, str2)
  first_anagrams = str1.split("").permutation(str2.length).to_a 
  anagrams = first_anagrams.map { |word| word.join("") } 
  anagrams.include?(str2)
end

# O(n^2)
def second_anagram?(str1, str2)
  str1.each_char do |char|
    idx = str2.index(char)
    return false if idx.nil?
    str2.slice!(idx)
  end

  str2.empty?
end

# O(n log(n))
def third_anagram?(str1, str2)
  sorted_str1 = str1.split("").sort
  sorted_str2 = str2.split("").sort

  sorted_str1 == sorted_str2
end

# O(n)
def fourth_anagram?(str1, str2)
  str1_hash = Hash.new(0)
  str2_hash = Hash.new(0)

  str1.each_char { |char| str1_hash[char] += 1 }
  str2.each_char { |char| str2_hash[char] += 1 }

  str1_hash == str2_hash 
end

if __FILE__ == $PROGRAM_NAME
  puts fourth_anagram?("rated", "trade") # true
  puts fourth_anagram?("car", "rat") # false
  puts fourth_anagram?("spread", "drapes") # true
  puts fourth_anagram?("emigrants", "streaming") # true
  puts fourth_anagram?("dose", "sope") # false
end