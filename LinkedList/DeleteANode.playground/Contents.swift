
//Definition for singly-linked list.
public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init(_ val: Int) {
    self.val = val
    self.next = nil
  }
}


class Solution {
  func deleteNode(_ node: ListNode?) {
    guard let node = node else {
      return
    }
    
    if let temp = node.next {
      node.val = temp.val
    }
    node.next = node.next?.next
  }
}
