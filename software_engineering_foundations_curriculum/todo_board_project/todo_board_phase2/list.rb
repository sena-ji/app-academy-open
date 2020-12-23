require './item.rb'

class List
  # print styles
  # copied print styles
  LINE_WIDTH = 49
  INDEX_COL_WIDTH = 5
  ITEM_COL_WIDTH = 20
  DEADLINE_COL_WIDTH = 10
  CHECKMARK = "\u2713".force_encoding('utf-8') # pretty checkmark

  # getters and setters
  attr_accessor :label

  # initializer
  def initialize(label)
    @label = label
    @items = []
  end

  # instance methods
  def add_item(title, deadline, description = "")
    return false if !Item.valid_date?(deadline)

    @items << Item.new(title, deadline, description)
    true
  end

  def size
    @items.length
  end

  def valid_index?(index)
    0 <= index && index < self.size
  end

  def swap(index_1, index_2)
    return false if !valid_index?(index_1) || !valid_index?(index_2)
    
    @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
    true
  end

  # create our own custom [] method to not expose the user from
  # manually manipulating the @items instance variable
  def [](index)
    return nil if !valid_index?(index)

    @items[index]
  end

  def priority
    @items.first
  end

  # created with String#ljust and string interpolation
  # both print methods were taken from examples
  def print
    puts "-" * LINE_WIDTH
    puts " " * 16 + @label.upcase
    puts "-" * LINE_WIDTH
    puts "#{'Index'.ljust(INDEX_COL_WIDTH)} | #{'Item'.ljust(ITEM_COL_WIDTH)} | #{'Deadline'.ljust(DEADLINE_COL_WIDTH)} | Done"
    puts "-" * LINE_WIDTH
    @items.each_with_index do |item, i|
      status = item.done ? CHECKMARK : ' '
      puts "#{i.to_s.ljust(INDEX_COL_WIDTH)} | #{item.title.ljust(ITEM_COL_WIDTH)} | #{item.deadline.ljust(DEADLINE_COL_WIDTH)} | [#{status}]"
    end
    puts "-" * LINE_WIDTH
  end

  def print_full_item(index)
    item = @items[index]
    return if item.nil?
    status = item.done ? CHECKMARK : ' '
    puts "-" * LINE_WIDTH
    puts "#{item.title}".ljust(LINE_WIDTH/2) + "#{item.deadline} [#{status}]".rjust(LINE_WIDTH/2)
    puts item.description
    puts "-" * LINE_WIDTH
  end

  def print_priority
    print_full_item(0)
  end

  def up(index, amount = 1)
    return false if !valid_index?(index)

    while amount > 0 && index != 0
      swap(index, index - 1)
      index -= 1
      amount -= 1
    end
    true
  end

  def down(index, amount = 1)
    return false if !valid_index?(index)

    while amount > 0 && index != self.size-1
      swap(index, index + 1)
      index += 1
      amount -= 1
    end
    true
  end

  def sort_by_date!
    @items.sort_by! { |item| item.deadline }
  end

  def toggle_item(index)
    @items[index].toggle if valid_index?(index)
  end

  def remove_item(index)
    return false if !valid_index?(index)

    @items.delete_at(index)
    true
  end

  def purge
    @items.delete_if(&:done)
  end
end