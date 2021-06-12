import Foundation

// Tree definition


public class TreeNode<T> {
  public var value: T
  public var children: [TreeNode] = []
  
  public init(_ value: T) {
    self.value = value
  }
  
  public func add(_ child: TreeNode) {
    children.append(child)
  }
  
}


extension TreeNode {
  
  // Depth-First Traversal
  public func forEachDepthFirst(visit: (TreeNode) -> Void) {
    visit(self)
    children.forEach {
      $0.forEachDepthFirst(visit: visit)
    }
  }
  
  //Level-order Traversla Or Breadth-First Traversal
  public func forEachLevelOrder(visit: (TreeNode) -> Void) {
    visit(self)
    var queue = [TreeNode]()
    
    children.forEach { queue.append($0) }
    while let node = queue.first {
      queue.removeFirst()
      visit(node)
      node.forEachLevelOrder { queue.append($0) }
      
    }
  }
}

extension TreeNode where T: Equatable {
  
  public func search(_ value: T) -> TreeNode? {
    var result: TreeNode?
    
    forEachLevelOrder { (node) in
      if node.value == value {
        result = node
      }
    }
    return result
  }
}



