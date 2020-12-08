class Player
  def get_move
    print "enter a position with coordinates separated with a space like '4 7': "
    position = gets.chomp.split(" ")
    row, col = position
    [row.to_i, col.to_i]
    # another way to do this:
    # gets.chomp.split(" ").map(&:to_i)
  end
end
