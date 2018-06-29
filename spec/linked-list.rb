
#linked list crud 
class Node
  attr_accessor :next, :value
  def initialize(value)
    @value = value
    @next = nil
  end
end

class LinkedList
  def initialize
    @head = nil
  end

#add ele to the list Start
  def append(value)
    if @head
      find_tail.next = Node.new(value)
    else
      @head = Node.new(value)
    end
  end

  def find_tail
    node = @head
    return node if !node.next
    return node if !node.next while (node = node.next) 
 end
#add ele to the list END

#finding an elelment in list start
def find(value)
    node = @head
    return false if !node.next
    return node if node.value == value
    while (node = node.next) 
      return node if node.value == value
    end
 end
#finding an elelment in list  END

#append_after a specidic node Start
def append_after(target, value)
    node = find(target)
    return unless node
    old_next = node.next
    node.next = Node.new(value)
    node.next.next = old_next
  end
 def find_before(value)
    node = @head
    return false if !node.next
    return node if node.next.value == value
    while (node = node.next)
      return node if node.next.value == value
    end
 end
#append_after a specidic node END

#delete a node Start
def delete(value)
    if @head.value == value
      @head = @head.next
      return
    end
    node = find_before(value)
    node.next = node.next.next
 end
#delete a node Start
end

list = LinkedList.new
list.append(10)
list.append(20)
list.append(30)
list.append_after(10, 15)
list.append_after(20, 25)
list.delete(20)
