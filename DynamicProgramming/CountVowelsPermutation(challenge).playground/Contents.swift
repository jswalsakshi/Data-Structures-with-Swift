class Solution {
  
  var dict = [String: Int]()
  let MOD = 1000000007
  
    func countVowelPermutation(_ n: Int) -> Int {
      var total = 0
      let charArr = ["a", "e", "i", "o", "u"]
      for char in charArr {
        total = (total + helper(remainingChar: n-1, prevChar: char)) % MOD
      }
      return total
    }
  
  func helper(remainingChar: Int, prevChar: String) -> Int {
    if remainingChar == 0 {return 1}
    let key: String = "" + String(remainingChar) + prevChar
    if dict.keys.contains(key) { return dict[key] ?? 1}
    
    var total = 0
    
    switch(prevChar) {
    case "a":
      total = (helper(remainingChar: remainingChar - 1, prevChar: "e")) % MOD
      break
    case "e":
      total = (helper(remainingChar: remainingChar - 1, prevChar: "a")
       + helper(remainingChar: remainingChar - 1, prevChar: "i") ) % MOD
    case "i":
      total = (helper(remainingChar: remainingChar - 1, prevChar: "a")
       + helper(remainingChar: remainingChar - 1, prevChar: "e")
       + helper(remainingChar: remainingChar - 1, prevChar: "o")
       + helper(remainingChar: remainingChar - 1, prevChar: "u")) % MOD
    case "o":
      total = (helper(remainingChar: remainingChar - 1, prevChar: "i")
       + helper(remainingChar: remainingChar - 1, prevChar: "u")) % MOD
    case "u":
      total = (helper(remainingChar: remainingChar - 1, prevChar: "a")) % MOD
      
    default:
      return total
    }
    dict[key] = total
    return total
  }
}
