

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
  
  
  func increasingBST(_ root: TreeNode?) -> TreeNode? {
    
    var arr = [Int]()
    
    inorderTraversal(root, arr: &arr)
    
    var output = TreeNode(-1)
    var resTree:TreeNode? = output
  
    
    for element in arr {
      let node = TreeNode(element)
      resTree?.right = node
      resTree = resTree?.right
    }
    
    return output.right
  }
  
  func inorderTraversal(_ node: TreeNode?, arr: inout [Int]) {
    guard node != nil else { return }
      inorderTraversal(node?.left, arr: &arr)
      arr.append(node!.val)
      inorderTraversal(node?.right, arr: &arr)
    
  }

}

final class Solution1 {
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        var arr = [Int]()
        helper(root, &arr)
        var output = TreeNode(-1)
        var head: TreeNode? = output
        for element in arr {
            let node = TreeNode(element)
            head?.right = node
            head = head?.right
        }
        return output.right
    }
    
    func helper(_ root: TreeNode?, _ arr: inout [Int]) {
        if root == nil {
            return
        }
        helper(root!.left, &arr)
        arr.append(root!.val)
        helper(root!.right, &arr)
    }
}
