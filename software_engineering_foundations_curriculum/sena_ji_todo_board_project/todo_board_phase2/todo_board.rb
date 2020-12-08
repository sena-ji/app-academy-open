require './list.rb'

class TodoBoard
  # initializer
  def initialize
      @lists = {}
  end

  # instance methods
  def get_command
    print "\nEnter a command: "
    cmd, selected, *args = gets.chomp.split(' ')

    case cmd
    when "mklist"
      @lists[selected] = List.new(selected)
    when "ls"
      @lists.keys.each { |label| puts '-' + label }
    when "showall"
      @lists.each_value(&:print)
    when "mktodo"
      @lists[selected].add_item(*args)
    when "up"
      @lists[selected].up(*args.map(&:to_i))
    when "down"
      @lists[selected].down(*args.map(&:to_i))
    when "swap"
      @lists[selected].swap(*args.map(&:to_i))
    when "sort"
      @lists[selected].sort_by_date!
    when "priority"
      @lists[selected].print_priority
    when "print"
      if args.empty?
        @lists[selected].print
      else
        @lists[selected].print_full_item(args[0].to_i)
      end
    when "toggle"
      @lists[selected].toggle_item(args[0].to_i)
    when "rm"
      @lists[selected].remove_item(args[0].to_i)
    when "purge"
      @lists[selected].purge
    when "quit"
      return false
    else
      print "Sorry, that command is not recognized."
    end

    true
  end

  def run
    while true
      return if !get_command
    end
  end
end

my_board = TodoBoard.new
my_board.run