
//Definition for a binary tree node.
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
  func bstToGst(_ root: TreeNode?) -> TreeNode? {
    var sum = 0
    let node = root
    func converting(_ node: TreeNode?) {
      if node?.right != nil {
        converting(node?.right)
      }
      node?.val += sum
      sum = node!.val
      
      if node?.left != nil {
        converting(node?.left)
      }
    }
    converting(node)
    return node
  }
}

