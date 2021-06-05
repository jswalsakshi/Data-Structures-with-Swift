
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
    
    var resultList:[Int] = [Int]()
    
    traverseTheTree(root!, &resultList)
    
    return resultList
  }
  
  func traverseTheTree(_ node: TreeNode, _ resultList: inout[Int]) {
    
    //traversing left node till end
    
    if let leftNode = node.left {
      traverseTheTree(leftNode, &resultList)
    }
    
    resultList.append(node.val)
    
    //traversing right node till end
    
    if let rightNode = node.right {
      traverseTheTree(rightNode, &resultList)
    }
    
  }
}


