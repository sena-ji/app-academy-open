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

if __FILE__ == $PROGRAM_NAME
  puts third_anagram?("rated", "trade") # true
  puts third_anagram?("car", "rat") # false
  puts third_anagram?("spread", "drapes") # true
  puts third_anagram?("emigrants", "streaming") # true
  puts third_anagram?("dose", "sope") # false
end