import Foundation

class Solution {
  func reductionOperations(_ nums: [Int]) -> Int {
    
    var numberOfOperation:Int = 0
    var map:[Int: Int] = [:]
    
    for (i, num) in nums.enumerated() {
      map[i] = num
      let largest = findLargest(nums)
    }
    map
    return  numberOfOperation
  }
  
  func findLargest(_ nums: [Int]) -> Int {
    var greatest = 0
    for num in nums {
      if num > greatest {
        greatest = num
      }
    }
    return greatest
  }
}
