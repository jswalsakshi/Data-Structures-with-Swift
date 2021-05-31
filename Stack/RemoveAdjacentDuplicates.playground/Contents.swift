class Solution {
  func removeDuplicates(_ S: String) -> String {
    var stack: String = ""
    for c in S {
      if let top = stack.last {
        if top == c {
          stack.popLast()
        }
        else {
          stack += String(c)
        }
      }
      else {
        stack += String(c)
      }
    }
    return stack
  }
}
