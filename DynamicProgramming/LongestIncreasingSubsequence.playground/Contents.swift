class Solution {
  func lengthOfLIS(_ nums: [Int]) -> Int {
    
    var dp = Array(repeating: 0, count: nums.count + 1)
    
    for i in 0..<nums.count {
      dp[i] = 1
      for j in 0..<i {
        if nums[j] < nums[i] {
          dp[i] = max(dp[i], dp[j] + 1)
        }
      }
    }
    return dp.max() ?? 1
  }
}
