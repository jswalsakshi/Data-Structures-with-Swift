class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
      
      var dp = Array(repeating: Array(repeating: -1, count: text1.count + 1), count: text2.count + 1)
      
        let text1Length = text1.count
        let text2Lenght = text2.count
        let char1 = Array(text1)
        let char2 = Array(text2)
      
      if dp[text1Length][text2Lenght] !=  -1 {
        
      }
        
        return lcs(char1, char2, text1Length, text2Lenght)
        
    }
    
  private func lcs(_ char1: [Character], _ char2: [Character], _ m: Int, _ n: Int) -> Int {
        
        if (m == 0 || n == 0) {
            return 0
        }
        else if ( char1[m - 1]) == char2[n - 1] {
            return lcs(char1, char2, m-1, n-1)
        }
        else {
           return max(lcs(char1, char2, m, n-1), lcs(char1, char2, m-1, n))
        }
    }
}
