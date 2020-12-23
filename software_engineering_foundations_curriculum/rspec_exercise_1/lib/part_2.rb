# this was a tough problem:
# ruby docs said .reverse returns new reversed string but I am assuming returning word returns orignal string
# since I did not save the new string to a new variable
def hipsterfy(word)
    vowels = "aeiou"

    # reverse the word first and iterate through word with index
    word.reverse.each_char.with_index do |char, idx|
        if vowels.include?(char)
            # when word is returned, original word is returned
            # so reverse the word and concate the string without the index that has the last vowel
            # return the reversed concate string
            return (word.reverse[0...idx] + word.reverse[idx + 1..-1]).reverse
        end
    end
    
    word
end

def vowel_counts(word)
    vowel_hash = Hash.new(0)
    vowels = "aeiou"

    word.downcase.each_char do |char| 
        vowel_hash[char] += 1 if vowels.include?(char)
    end

    vowel_hash
end

def caesar_cipher(msg, n)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    caesar_word = ""

    msg.each_char do |char|
        if alphabet.include?(char)
            index = alphabet.index(char)
            char = alphabet[(index + n) % 26]
            caesar_word << char
        else
            caesar_word << char
        end
    end

    caesar_word
end