import Foundation
//  Definition for a binary tree node.
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
    var last:Int? = nil
    var minVal = Int.max
    
    func minDiffInBST(_ root: TreeNode?) -> Int {
        inorder(root)
        return minVal
    }
    
    func inorder(_ root: TreeNode?){
        guard let node = root else {
            return
        }
        inorder(node.left)
        if last != nil {
            minVal = min(minVal, node.val-last!)
        }
        last = node.val
        inorder(node.right)
        
    }
}
