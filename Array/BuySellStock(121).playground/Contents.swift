class Solution {
  func maxProfit(_ prices: [Int]) -> Int {
    if prices.count < 2 { return 0 }
    
    var min = Int.max
    var maxProfit = 0
    
    for i in 0..<prices.count {
      if prices[i] < min {
        min = prices[i]
      }
      if (prices[i] - min) > maxProfit {
        maxProfit = prices[i] - min
      }
    }
    
    return maxProfit
  }
}
