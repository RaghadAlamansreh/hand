class Node
   attr_accessor :element, :next, :prev

  def initialize(element)
    @element = element
  end
end

class DoubleLinkedList
  attr_accessor :head, :tail

  def add_node(element)
    new_node = Node.new(element)
      if @head == nil
        @head = new_node
        @tail = new_node
        @head.prev = nil
        @tail.next = nil
      elsif @head.next == nil
        @tail = new_node
        @tail.next = new_node
        @tail.prev = @head
        @head.next = @tail
        @tail.next = nil
      else
        new_node.prev = @tail
        @tail.next = new_node
        @tail = new_node
  			@tail.next = nil
    end
  end

  def  find_element(element)
    current = @head
    while current != nil
      break if element.to_s == current.element.to_s
      current = current.next
    end
    return current
  end

  def print
    current = @head
     while current != nil
       puts current.element
       current = current.next
     end
  end
end

def init_cart(double_linked_list)
  double_linked_list.add_node("A")
  double_linked_list.add_node(2)
  double_linked_list.add_node(3)
  double_linked_list.add_node(4)
  double_linked_list.add_node(5)
  double_linked_list.add_node(6)
  double_linked_list.add_node(7)
  double_linked_list.add_node(8)
  double_linked_list.add_node(9)
  double_linked_list.add_node(10)
  double_linked_list.add_node("J")
  double_linked_list.add_node("Q")
  double_linked_list.add_node("K")
  double_linked_list.add_node("A")
end
