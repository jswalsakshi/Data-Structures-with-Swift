
// Definition for a binary tree node.
public class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  public init() { self.val = 0; self.left = nil; self.right = nil; }
  public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
  public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
    self.val = val
    self.left = left
    self.right = right
  }
}

class Solution {
  func inorderTraversal(_ root: TreeNode?) -> [Int] {
    
    guard root != nil else {
      return []
    }
    
    var inorderList:[Int] = [Int]()
    
    traverseTheTree(root!, &inorderList)
    
    return inorderList
  }
  
  func traverseTheTree(_ node: TreeNode, _ inorderList: inout[Int]) {
    
    //traversing left node till end
    
    if let leftNode = node.left {
      traverseTheTree(leftNode, &inorderList)
    }
    
    inorderList.append(node.val)
    
    //traversing right node till end
    
    if let rightNode = node.right {
      traverseTheTree(rightNode, &inorderList)
    }
    
  }
}

class Solution2 {
  func postorderTraversal(_ root: TreeNode?) -> [Int] {
    
    guard root != nil else {
      return []
    }
    
    var postOrderList:[Int] = [Int]()
    
    traverse(root!, &postOrderList)
    
    return postOrderList
  }
  
  func traverse(_ node: TreeNode, _ postOrderList: inout[Int]) {
    
    if let leftNode = node.left {
      traverse(leftNode, &postOrderList)
    }
    
    if let rightNode = node.right {
      traverse(rightNode, &postOrderList)
    }
    
    postOrderList.append(node.val)
  }
  
  
  //another recursive method
  
  func postorderTraversal2(_ root: TreeNode?) -> [Int] {
    guard let r = root else { return [] }

    return postorderTraversal(r.left) + postorderTraversal(r.right) + [r.val]
  }
}

class Solution3 {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let r = root else {return []}
        
        return [r.val] + preorderTraversal(r.right) + preorderTraversal(r.left)
    }
}


