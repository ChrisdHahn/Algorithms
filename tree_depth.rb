require 'minitest/autorun'


class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end




  def depth_first(node_to_find, node = nil)

    node ||= self

    if node.payload == node_to_find
      return node.payload
    else
      node.children.each do |child|
        payload = depth_first(node_to_find, child)
        return payload if payload == node_to_find
      end
    end
  end

  def breadth_first(node_to_find)
    queue = MyQueue.new

    self.children.each { |child| queue.enqueue(child) }

    payload = breadth_traversal(queue, node_to_find) until payload == node_to_find

    return payload
  end
  

  private


    def breadth_traversal(queue, node_to_find)
      current_node = queue.dequeue

      return current_node.payload if current_node.payload == node_to_find

      if current_node.children
        current_node.children.each { |current_node_child| queue.enqueue current_node_child }
      end

    end

end    

class MyQueue
  def initialize
    @queue = []
  end

  def enqueue(item)
    @queue.push(item)
  end

  def dequeue
    @queue.shift
  end
end




class TreeTest < MiniTest::Test

    
   def setup
      # The "leaves" of a tree, elements that have no children
        node_5  = Tree.new 5,  []
        node_11 = Tree.new 11, []
        node_4  = Tree.new 4,  []
        
      # The "branches" of the tree
        node_6 = Tree.new 6, [node_5, node_11]
        node_7 = Tree.new 7, [node_6]
        node_9 = Tree.new 9, [node_4]
        node_5 = Tree.new 5, [node_9]
        
      # The "trunk" of the tree
        @trunk = Tree.new 2, [node_7, node_5]
    end



  def test_depth_first

    assert_equal 11, @trunk.depth_first(11)

  end


  def test_breadth_first

    assert_equal 11, @trunk.breadth_first(11)
  
  end
end
