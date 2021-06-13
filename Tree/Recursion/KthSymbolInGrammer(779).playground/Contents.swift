
import Darwin

class Solution {
  func kthGrammar(_ n: Int, _ k: Int) -> Int {
    
    let mid = pow(2.0, Double(n-1)) / 2
    
    if (n == 1 && k == 1) {
      return 0
    }
    
    else if k <= Int(mid) {
      return kthGrammar(n-1, k)
    }
    
    else {
      let value = kthGrammar(n-1, k-Int(mid))
      if value == 0 {
        return 1
      }
      else {
        return 0
      }
    }
  }
}
