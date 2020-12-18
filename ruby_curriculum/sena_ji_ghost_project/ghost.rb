require 'set'
require_relative "player.rb"

class GhostGame
  # getters and setters
  attr_reader :dictionary, :players
  attr_accessor :fragment, :losses

  ALPHABET = Set.new('a'..'z')
  MAX_LOSS_COUNT = 5

  # initializer
  def initialize(*players)
    @players = players.flatten
    @dictionary = Set.new(File.open('dictionary.txt').readlines.map(&:chomp))
    @fragment = ""
    @losses = Hash.new(0)
  end

  def run
    until win?
      play_round
    end

    display_winner
  end

  def play_round
    @fragment = ""
    display_standings

    until round_over?
      take_turn(self.current_player)
      next_player!
    end

    losses(self.previous_player)

    eliminate_player(self.previous_player) if lose?(self.previous_player)
  end

  def current_player
    @players.first
  end

  def previous_player
    @players.last
  end

  def next_player!
    @players.rotate!
  end

  def take_turn(player)
    letter = player.guess

    until valid_play?(letter)
      player.alert_invalid_guess
      letter = player.guess
    end

    update_fragment(letter)
    display_fragment unless round_over?
  end

  def valid_play?(letter)
    return false unless ALPHABET.include?(letter)

    temporary_fragment = @fragment + letter
    form_word?(temporary_fragment)
  end

  def form_word?(fragment)
    @dictionary.any? { |word| word.start_with?(fragment) }
  end

  def update_fragment(letter)
    @fragment << letter
  end

  def display_fragment
    puts "Fragment: #{@fragment}"
  end

  def round_over?
    @dictionary.include?(@fragment)
  end

  def losses(player)
    @losses[player] += 1
  end

  def record(player)
    loss_count = @losses[player]
    "GHOST".slice(0...loss_count)
  end

  def lose?(player)
    @losses[player] == 5
  end

  def win?
    @players.length == 1
  end

  def eliminate_player(player)
    player_idx = @players.index(player)
    @players = @players[0...player_idx] + @players[player_idx+1..-1]
    puts "#{player.name} has been eliminated."
  end

  def display_standings
    @players.each { |player| puts "#{player.name}: #{record(player)}"}
  end

  def display_winner
    puts "#{self.current_player.name} has won!"
  end
end