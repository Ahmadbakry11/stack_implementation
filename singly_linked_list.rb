require_relative 'node'

class SinglyLinkedList
  attr_accessor :head, :size

  def initialize
    @head = nil
    @size = 0
  end

  def prepend(data)
    current_node = @head 
    @head = Node.new(data, current_node)
    @size += 1
    data
  end

  def shift
    current_node = @head
    if current_node
      @head = current_node.next_node
      @size -= 1
      return current_node.data
    end
    nil
  end

  def is_empty?
    @head.nil?
  end
end