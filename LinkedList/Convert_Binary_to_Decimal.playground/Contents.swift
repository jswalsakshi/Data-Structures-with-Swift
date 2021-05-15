


//Definition for singly-linked list.
public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


func getDecimalValue(_ head: ListNode?) -> Int {
  var num = head?.val
  var temp = head
  while ((temp?.next) != nil) {
    num = (num! * 2) + (temp?.next!.val)!
    temp = temp?.next
  }
  
  return num!
}

let testListNode = ListNode(1)
let test2ListNode = ListNode(1, testListNode)

getDecimalValue(test2ListNode)
