class Solution {
    func tribonacci(_ n: Int) -> Int {
      
      guard (n >= 0 && n <= 37) else { return 0 }
      
      var(n0, n1, n2) = (0, 1, 1)
      
      if (n == 1 || n == 2) {
        return n1
      }
      
      for _ in 3...n {
        let temp = n0 + n1 + n2
        n0 = n1
        n1 = n2
        n2 = temp
      }
      
      return n2
      
    }
}
