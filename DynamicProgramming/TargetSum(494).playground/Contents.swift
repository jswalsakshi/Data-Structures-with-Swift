
  func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
    
    let numsCount = nums.count
    
    let sum = nums.reduce(0, +)
    
    let sumofSubset = (sum - target)/2
    
    var dp = Array(repeating: Array(repeating: 0, count: sumofSubset + 1), count: numsCount + 1)
    
    dp[0][0] = 1
    
    for i in 1...numsCount {
      let num = nums[i-1]
      for j in 0...sumofSubset {
        dp[i][j] += dp[i-1][j]
        if j >= num {
          dp[i][j] += dp[i-1][j-num]
        }
      }
    }
    return dp[numsCount][sumofSubset]
  }

findTargetSumWays([1,1,1,1,1], 3)

