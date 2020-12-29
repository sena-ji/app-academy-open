# PHASE 2
def convert_to_int(str)
  Integer(str)
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

  # App Academy's exception post did not go through a lot of the parts on how to properly write them.
  # found this blog post that I found useful:
  # https://www.honeybadger.io/blog/a-beginner-s-guide-to-exceptions-in-ruby/
  # also this stackoverflow question's answer said that "raise already sets the message so you don't have to pass it to the constructor":
  # https://stackoverflow.com/questions/16106645/ruby-custom-error-classes-inheritance-of-the-message-attribute
  # but I did it anyways so it's easier to read

class CoffeeError < StandardError
  def initialize(message)
    super(message)
  end
end

class InvalidFruitError < StandardError
  def initialize(message)
    super(message)
  end
end

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit.downcase == "coffee"
    raise CoffeeError.new("OMG, thanks so much for the coffee! I LOVE COFFEE! Give me another one :)")
  else
    raise InvalidFruitError.new("Bad fruit! I cannot eat this :(")
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue CoffeeError => e
    puts e.message
    retry
  rescue InvalidFruitError => e
    puts e.message
  end
end  

# PHASE 4
class InvalidYearError < ArgumentError
  def initialize(message)
    super(message)
  end
end

class InvalidNameError < ArgumentError
  def initialize(message)
    super(message)
  end
end

class InvalidPastimeError < ArgumentError
  def initialize(message)
    super(message)
  end
end

class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    if yrs_known < 5
      raise InvalidYearError.new("A bestie friendship must be more than at least 5 years!")
    else
      @yrs_known = yrs_known
    end

    if name.length <= 0
      raise InvalidNameError.new("You must know your bestie's name!")
    else
      @name = name
    end

    if fav_pastime.length <= 0
      raise InvalidPastimeError.new("You must know a favorite pastime with your bestie!")
    else
      @fav_pastime = fav_pastime
    end
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


