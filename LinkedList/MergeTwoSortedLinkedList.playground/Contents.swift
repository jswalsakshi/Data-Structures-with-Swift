

//Definition for singly-linked list.
public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
  func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var list1 = l1
    var list2 = l2
    var sortedList = ListNode()
    var headNode = ListNode()
    if (list1 == nil && list2 == nil) {
      return nil
    }
    else if (list1 != nil && list2 == nil) {
      return list1
    }
    else if (list1 == nil && list2 != nil) {
      return list2
    }
    
    if ((list1 != nil) && (list2 != nil)) {
      
      if (list1!.val < list2!.val) {
        sortedList = list1!
        list1 = sortedList.next
      }
      else {
        sortedList = list2!
        list2 = sortedList.next
      }
      
      headNode = sortedList
    }
    
    while (list1 != nil) && (list2 != nil) {
      if list1!.val < list2!.val {
        sortedList.next = list1
        list1 = sortedList.next
      }
      else {
        sortedList.next = list2
        list2 = sortedList.next
      }
    }
    
    if list1 == nil {
      sortedList.next = list2
    }
    else if list2 == nil {
      sortedList.next = list1
    }
    
    return headNode
  }
}
