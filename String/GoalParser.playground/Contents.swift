
class Solution {
    func arrayStringsAreEqual(_ word1: [String], _ word2: [String]) -> Bool {
      let x = word1.joined(separator: "")
      let y = word2.joined(separator: "")
      
      return x == y ? true : false
    }
}

class Solution2 {
    func arrayStringsAreEqual(_ word1: [String], _ word2: [String]) -> Bool {
      return word1.reduce("", +) == word2.reduce("", +)
    }
}
