class MinMaxStack
  def initialize
    @store = []
    @minmax_store = []
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

  def max
    @minmax_store[-1]
  end

  def min
    @minmax_store[0]
  end

  def pop
    @store.pop
    @minmax_store.pop
  end

  def push(elem)
    max = elem

    if (!@minmax_store.empty? && max < @minmax_store[-1])
      max = @minmax_store[-1]
    end

    @store.push(elem)
    @minmax_store.push(max)
  end
end