class Item
  # class methods
  def self.valid_date?(date_string)
    date_parts = date_string.split("-").map(&:to_i)
    year, month, day = date_parts

    return false if date_parts.length != 3
    return false if !(1..12).include?(month)
    return false if !(1..31).include?(day)

    true
  end

  # getters and setters
  attr_accessor :title, :description, :done
  # reason why we only do reader for @deadline even though we want to set
  # the item's deadline is because if the new deadline is not a valid date,
  # then we don't want to change the deadline and raise an error instead
  attr_reader :deadline

  # initializer
  def initialize(title, deadline, description)
    raise "invalid date" if !Item.valid_date?(deadline)
    @title = title
    @deadline = deadline
    @description = description
    @done = false
  end

  # setter
  def deadline=(new_deadline)
    raise "invalid date" if !Item.valid_date?(new_deadline)
    @deadline = new_deadline
  end

  # instance methods
  def toggle
    @done = !@done
  end
end