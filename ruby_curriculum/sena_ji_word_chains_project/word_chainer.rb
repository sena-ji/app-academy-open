require 'set'

class WordChainer
  attr_accessor :dictionary, :current_words, :all_seen_words

  # Read in the dictionary file. 
  # Store the array of dictionary words in an instance variable.
  def initialize(dictionary_file_name)
    @dictionary = Set.new(File.open(dictionary_file_name).readlines.map(&:chomp))
    @current_words = []
    @all_seen_words = {}
  end

  # Return all words in the dictionary one letter different than the current word.
  def adjacent_words(word)
    same_length = @dictionary.select { |dict_word| dict_word.length == word.length }

    adj_words = []

    word.each_char.with_index do |char, idx|
      same_length.each do |length_word|
        if length_word[0...idx] + length_word[idx+1..-1] == word[0...idx] + word[idx+1..-1]
          adj_words << length_word
        end
      end
    end

    adj_words
  end

  def run(source, target)
    @current_words << source
    @all_seen_words = { source => nil }

    until @current_words.empty?
      new_current_words = []

      explore_current_words(new_current_words)

      @current_words = new_current_words
    end

    path = build_path(target).reject { |el| el.nil? }
    path.reverse + [target]
  end

  def explore_current_words(new_current_words)
    @current_words.each do |current_word|
      adjacent_words(current_word).each do |adj_word|
        unless @all_seen_words.include?(adj_word)
          new_current_words << adj_word
          @all_seen_words[adj_word] = current_word
        end
      end
    end

    new_current_words.each do |new_word|
      p new_word
      p @all_seen_words[new_word]
    end
  end

  def build_path(target)
    path = []

    until target.nil?
      path << @all_seen_words[target]
      target = @all_seen_words[target]
    end
    
    path
  end
end