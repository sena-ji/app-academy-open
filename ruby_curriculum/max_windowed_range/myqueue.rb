class MyQueue
  def initialize
    @store = []
  end

  def peek
    @store[-1]
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def enqueue(elem)
    @store.push(ele)
  end

  def dequeue
    @store.shift
  end
end