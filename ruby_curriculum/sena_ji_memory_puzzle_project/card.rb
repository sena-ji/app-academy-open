class Card
  # constants
  ALPHABET = ('A'..'Z').to_a.shuffle

  # class methods
  def self.shuffled_pairs(num_pairs)
    values = ALPHABET

    while num_pairs > values.length
      values = values + values
    end

    picked_values = values.take(num_pairs) * 2
    picked_values.shuffle!
    picked_values.map { |val| self.new(val) }
  end

  # getters and setters
  attr_reader :face_value, :face_up

  # initializer
  def initialize(face_value, face_up = false)
    @face_value = face_value
    @face_up = face_up
  end

  # instance methods
  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def to_s
    @face_up ? @face_value.to_s : " "
  end

  def ==(card)
    card.is_a?(self.class) && card.value == value
  end
end