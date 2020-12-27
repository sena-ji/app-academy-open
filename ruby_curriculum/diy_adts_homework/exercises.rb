class Stack
  attr_accessor :stack

  def initialize
    # create ivar to store stack here!
    @stack = []
  end

  def push(el)
    # adds an element to the stack
    @stack << el
  end

  def pop
    # removes one element from the stack
    @stack.pop
  end

  def peek
    # returns, but doesn't remove, the top element in the stack
    @stack.first
  end
end

class Queue
  attr_accessor :queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def peek
    @queue.first
  end
end

class Map
  attr_accessor :map

  def initialize
    @map = []
  end

  def set(key, value)
    @map.each do |pair|
      if pair[0] == key
        return pair[1] = value
      end
    end

    @map << [key, value]
  end

  def get(key)
    @map.each do |pair|
      return pair if pair[0] == key
    end
  end

  def delete(key)
    @map.each do |pair|
      @map.delete(pair) if pair[0] == key
    end
  end

  def show
    @map
  end
end