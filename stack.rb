require_relative 'singly_linked_list'

class Stack
  OverflowError = Class.new(StandardError)
  UnderflowError = Class.new(StandardError)

  attr_accessor :list, :max_tracking_list, :max_size, :sum

  def initialize(max_size)
    @list = SinglyLinkedList.new
    @max_tracking_list = SinglyLinkedList.new
    @max_size = max_size   #Only valid positive integers
    @sum = 0
  end

  def size 
    @list.size
  end

  def push(data)
    raise OverflowError if is_full?
    @list.prepend(data)
    @sum += data
    update_tracking_list(data)
  end

  def pop
    raise UnderflowError if is_empty?
    data = @list.shift
    @max_tracking_list.shift
    @sum -= data
    data
  end

  def max
    @max_tracking_list.head.data
  end

  def is_empty?
    @list.is_empty?
  end

  def is_full?
    size == max_size
  end

  def avg
    return 0 if is_empty?
    sum.fdiv(size).round(2)
  end

  def peek
    raise UnderflowError if is_empty?
    @list.head.data
  end

  private

  def update_tracking_list(data)
    if @max_tracking_list.is_empty?
      @max_tracking_list.prepend(data)
    else
      @max_tracking_list.prepend([data, max].max)
    end
  end
end
