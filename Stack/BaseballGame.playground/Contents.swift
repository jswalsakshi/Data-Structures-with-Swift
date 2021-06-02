
struct Stack {
  
  var arr:[Int] = []
  
  var isEmpty: Bool {
    return arr.isEmpty
  }
  
  mutating func pop() -> Int? {
    if isEmpty {
      return nil
    }
     return arr.removeLast()
  }
  
  mutating func push(num: Int) {
    arr.append(num)
  }
  
  func peek() -> Int? {
    return arr.last
  }
}


class Solution {
    func calPoints(_ ops: [String]) -> Int {
      var stack = Stack()
      
      for ch in ops {
        if ch == "C" {
          stack.pop()
        }
        else if ch == "D" {
          stack.push(num: (2 * stack.peek()!))
        }
        else if ch == "+" {
          stack.push(num: stack.peek()! + stack.arr.dropLast().last!)
        }
        else {
          stack.push(num: Int(ch)!)
        }
      }
      
      return stack.arr.reduce(0, +)
    }
}
