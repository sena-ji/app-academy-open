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

if __FILE__ == $PROGRAM_NAME
  puts second_anagram?("rated", "trade") # true
  puts second_anagram?("car", "rat") # false
  puts second_anagram?("spread", "drapes") # true
  puts second_anagram?("emigrants", "streaming") # true
  puts second_anagram?("dose", "sope") # false
end