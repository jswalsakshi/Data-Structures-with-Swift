
func maxSumSubmatrix(_ matrix: [Int], _ k: Int) -> Bool {
  
  let numCount = matrix.count
  
  var dp = Array(repeating: Array(repeating: false, count: k + 1), count: numCount + 1)
  
  dp[0][0] = true
  
  for i in 1...numCount {
    let curr = matrix[i - 1]
    for j in 0...k {
      if curr <= j {
        dp[i][j] = (dp[i-1][j - curr]) || dp[i-1][j]
      }
      else {
        dp[i][j] = dp[i-1][j]
      }
    }
  }
  return dp[numCount][k]
}

maxSumSubmatrix([1, 0, 1], 2)

