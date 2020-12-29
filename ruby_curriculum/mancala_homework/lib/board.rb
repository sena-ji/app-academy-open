class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1, @player2 = name1, name2
    @cups = Array.new(14) { Array.new }

    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, idx|
      if idx != 13 && idx != 6
        4.times { cup << :stone }
      end
    end
  end

  def valid_move?(start_pos)
    unless (start_pos.between?(0,5) || start_pos.between?(7,12))
      raise "Invalid starting cup"
    end

    if @cups[start_pos].empty?
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    start_cup = @cups[start_pos]
    @cups[start_pos] = []
    temp_pos = start_pos

    until start_cup.empty?
      temp_pos += 1
      temp_pos = 0 if temp_pos > 13
      
      if current_player_name == @player1 && temp_pos == 6
        @cups[temp_pos] << start_cup.pop
      elsif current_player_name == @player2 && temp_pos == 13
        @cups[temp_pos] << start_cup.pop
      elsif temp_pos != 6 && temp_pos != 13
        @cups[temp_pos] << start_cup.pop
      end
    end

    self.render
    next_turn(temp_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    # switched up order of two first if statements
    # if ending_cup_idx is at a store and has one stone, it will return the wrong value
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    return :switch if @cups[ending_cup_idx].length == 1
    ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
