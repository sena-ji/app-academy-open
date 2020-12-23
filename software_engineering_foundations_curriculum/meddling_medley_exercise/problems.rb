def duos(string)
  count = 0 

  string.each_char.with_index do |char, idx|
    if string[idx] == string[idx + 1]
      count += 1
    end
  end

  count
end

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

def sentence_swap(sentence, hash)
  new_words = sentence.split(" ").map do |word|
    if hash.has_key?(word)
      hash[word]
    else
      word
    end
  end

  new_words.join(" ")
end

# p sentence_swap('anything you can do I can do',
#   'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#   'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#   'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

def hash_mapped(hash, prc1, &prc2)
  mapped = {}

  hash.each do |key, val|
    mapped[prc2.call(key)] = prc1.call(val)
  end

  mapped
end

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

def counted_characters(string)
  count = Hash.new(0)

  string.each_char do |char|
    count[char] += 1
  end

  multiple = count.select { |k, v| v > 2 }

  multiple.keys
end

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

def triplet_true(string)
  count = Hash.new(0)

  string.each_char { |char| count[char] += 1 }

  consecutive = count.select { |k, v| v >= 3 }

  !consecutive.empty?
end

# p triplet_true('caaabb')        # true
# p triplet_true('terrrrrible')   # true
# p triplet_true('runninggg')     # true
# p triplet_true('bootcamp')      # false
# p triplet_true('e')             # false

def energetic_encoding(string, hash)
  new_string = ""

  string.each_char do |char|
    if char == ' '
      new_string += ' '
    elsif hash.has_key?(char)
      new_string += hash[char]
    else
      new_string += '?'
    end
  end

  new_string
end

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

def uncompress(string)
  nums = "1234567890"
  new_string = ""

  (0...string.length).each do |idx|
    if nums.include?(string[idx])
      new_string += string[idx - 1] * string[idx].to_i
    end
  end

  new_string
end

# puts uncompress('a2b4c1') # 'aabbbbc'
# puts uncompress('b1o2t1') # 'boot'
# puts uncompress('x3y1x2z4') # 'xxxyxxzzzz'

def conjunct_select(array, *prcs)
  true_prcs = []

  array.each do |elem|
    true_prcs << elem if prcs.all? { |prc| prc.call (elem) }
  end

  true_prcs
end

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def convert_pig_latin(sentence)
  words = sentence.split(' ')
  new_words = []

  words.each do |word|
    if word.length < 3
      new_words << word
    elsif word == word.capitalize
      new_word = pig_latin(word)
      new_words << new_word.capitalize
    else
      new_words << pig_latin(word)
    end
  end

  new_words.join(' ')
end

def pig_latin(word)
  vowels = "aeiou"

  word.each_char.with_index do |char, idx|
    if vowels.include?(word[0].downcase)
      return word + "yay"
    elsif vowels.include?(char)
      return word[idx..-1] + word[0...idx] + "ay"
    end
  end
end

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

def reverberate(sentence)
  words = sentence.split(' ')

  new_words = words.map do |word|
    word.length < 3 ? word : reverb(word)
  end

  new_words.join(' ')
end

def reverb(word)
  vowels = "aeiou"

  return word + word.downcase if vowels.include?(word[-1])

  i = word.length - 1
  while i >= 0
    if vowels.include?(word[i])
      return word + word[i..-1]
    end
    i -= 1
  end
end

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

def disjunct_select(array, *prcs)
  array.select do |elem|
    elem if prcs.any? { |prc| prc.call(elem) }
  end
end

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

def alternating_vowel(sentence)
  words = sentence.split(' ')
  voweless_words = []

  words.each_with_index do |word, idx|
    if idx % 2 == 0
      voweless_words << remove_first_vowel(word)
    else
      voweless_words << remove_last_vowel(word)
    end
  end

  voweless_words.join(' ')
end

def remove_first_vowel(word)
  vowels = "aeiou"

  word.each_char.with_index do |char, idx|
    if vowels.include?(char)
      return word[0...idx] + word[idx+1..-1]
    end
  end

  word
end

def remove_last_vowel(word)
  vowels = "aeiou"
  i = word.length - 1

  while i >= 0
    if vowels.include?(word[i])
      return word[0...i] + word[i+1..-1]
    end
    i -= 1
  end

  word
end

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

def silly_talk(sentence)
  words = sentence.split(' ')
  vowels = "aeiou"

  new_words = words.map do |word|
    vowels.include?(word[-1]) ? word + word[-1] : followed_b(word)
  end

  new_words.join(' ')
end

def followed_b(word)
  vowels = "aeiouAEIOU"
  new_word = ""

  word.each_char do |char|
    if vowels.include?(char)
      new_word += char + 'b' + char.downcase
    else
      new_word += char
    end
  end

  new_word
end

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

def compress(string)
  compressed = ""
  i = 0

  while i < string.length
    char = string[i]
    count = 1
    i += 1
    while char == string[i]
        count += 1
        i += 1
    end

    if count > 1
        compressed += char + count.to_s
    else
        compressed += char
    end
  end

  compressed
end

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"