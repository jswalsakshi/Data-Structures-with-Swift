
// Definition for singly-linked list.
public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
  func isPalindrome(_ head: ListNode?) -> Bool {
    var temp = head
    
    var list = [Int]()
    
    while temp != nil {
      if let value = temp?.val {
        list.append(value)
      }
      temp = temp?.next
    }
    
    var startIndex = 0
    var endIndex = list.count - 1
    
    while startIndex < endIndex {
      if list[startIndex] != list[endIndex] {
        return false
      }
      startIndex += 1
      endIndex -= 1
    }
    
    return true
  }
}
