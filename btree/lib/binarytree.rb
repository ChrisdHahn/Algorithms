class BinaryTree
  attr_accessor :payload, :left, :right

  def initialize(payload, left, right)
    @payload = payload
    @left = left
    @right = right
  end

end


class BTreeSort

  def self.build(array)
    #array = [7, 4, 9, 1, 6, 14, 10]
    first = array[0] 
    rest = array.last(array.length - 1)
    tree = BinaryTree.new(first, nil, nil)
   

    #1). Loop through rest array
    rest.each do |value|
      current_node = tree
      node = BinaryTree.new(value, nil, nil)
      #find where each node belongs in the tree (left or right)
      while current_node != node
        current_node = next_node_for(current_node, node, value)
      end
    end
    return tree
  end

  def self.order (node, sorted_array)

    return "Finished" if node == nil

    self.order(node.left, sorted_array)
    sorted_array << node.payload
    self.order(node.right, sorted_array)

    return sorted_array
  
  end

  def self.sort(array)
    tree = self.build(array)
    sorted_array = []

    return self.order(tree, sorted_array)
  end
end

private
 def next_node_for(current, new_node, value)
    if value < current.payload
      current.left ||= new_node
    else
      current.right ||= new_node
    end
 end

array = [7, 4, 9, 1, 6, 14, 10]

p BTreeSort.sort(array)
