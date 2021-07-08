class Solution {
  func countBits(_ n: Int) -> [Int] {
    var ansArray = [n + 1]
    
    for i in 0...n {
      ansArray[i] = popCount(i)
    }
    return ansArray
  }
  
  func popCount(_ n: Int) -> Int {
    var n = n
    var count = 0
    
    for _ in stride(from: n, through: 0, by: -1) {
      count += 1
      n = n & (n-1)
    }
    return count
  }
}
