
class Solution {
  func dietPlanPerformance(_ calories: [Int], _ k: Int, _ lower: Int, _ upper: Int) -> Int {
    var totalPoints = 0
    var currentCalCount = 0
    
    for i in 0..<calories.count {
      
      currentCalCount += calories[i]
      
      if i > k-1 {
        if currentCalCount > upper {
          totalPoints += 1
        }
        else if currentCalCount < lower {
          totalPoints -= 1
        }
      }
      currentCalCount = currentCalCount - calories[i - (k-1)]
    }
    return totalPoints
  }
}
