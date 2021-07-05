class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        
      var bestSum = 0
      var currSum = 0
      
      
      for num in nums {
        currSum = max(0, currSum + num)
        bestSum = max(currSum, bestSum)
      }
      
      return bestSum
    }
}
