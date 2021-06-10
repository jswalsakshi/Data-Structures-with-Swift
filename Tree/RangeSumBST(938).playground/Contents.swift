

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
  func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
    var sum = 0
    dfs(root, low, high, sum: &sum)
    return sum
  }
  
  func dfs(_ node: TreeNode?, _ low: Int, _ high: Int, sum: inout Int) -> Int {
    if node != nil {
      if (low <= node!.val && node!.val <= high) {
        sum += node!.val;
      }
      if low < node!.val {
        dfs(node?.left, low, high, sum: &sum)
      }
      if high > node!.val {
        dfs(node?.right, low, high, sum: &sum)
      }
    }
    return sum
  }
}
