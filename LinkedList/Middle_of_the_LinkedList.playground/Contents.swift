import Foundation

public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


func middleNode(_ head: ListNode?) -> ListNode? {
  var (slow, fast) = (head, head)
  
  while ((fast?.next) != nil) {
    fast = fast?.next?.next
    slow = slow?.next
  }
  return slow?.next
}


//let ln1 = ListNode(1)
//let ln2 = ListNode(2, ln1)
//let ln3 = ListNode(3, ln2)
//let ln4 = ListNode(4, ln3)
//let ln5 = ListNode(5, ln4)
//
//middleNode(ln5)
//




