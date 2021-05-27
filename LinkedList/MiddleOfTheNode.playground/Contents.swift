

// Definition for singly-linked list.
public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
  func middleNode(_ head: ListNode?) -> ListNode? {
    var lastVal: Int?
    var temp: ListNode? = head
    var middle: ListNode? = head
    
    while (temp?.next != nil) {
      temp = temp?.next
      lastVal = temp?.val
    }
    
    let middleValue: Double = Double((head!.val + lastVal!)/2)
    let val = Int(middleValue.rounded(.up))
    
    while (middle?.val != val) {
      middle = middle?.next
    }
    return middle
  }
}
