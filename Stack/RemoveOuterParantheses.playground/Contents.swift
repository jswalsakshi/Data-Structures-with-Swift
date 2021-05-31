
class Solution {
  func removeOuterParentheses(_ s: String) -> String {
    
    var finalString = " "
    var count = 0
    
    for ch in s {
      if ch == "(" {
        if count > 0 {
          finalString.append(ch)
        }
        count += 1
      }
      else if ch == ")" {
        count -= 1
        if count > 0 {
          finalString.append(ch)
        }
      }
    }
    return finalString
  }
}
