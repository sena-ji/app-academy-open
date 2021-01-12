require_relative 'my_stack'

class StackQueue
  def initialize
    @instore = MyStack.new
    @outstore = MyStack.new
  end

  def size
    instore.size + outstore.size
  end

  def empty?
    instore.empty? && outstore.empty?
  end

  def enqueue(elem)
    @instore.push(elem)
  end

  def dequeue
    if @outstore.empty?
      @outstore.push(@inbox.pop) until @inbox.empty?
    end
    
    @outstore.pop
  end
end