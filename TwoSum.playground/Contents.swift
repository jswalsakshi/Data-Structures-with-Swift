import Foundation

// Brute Force

/*Time complexity : O(n^2) For each element, we try to find its complement by looping through the rest of array which takes O(n)O(n) time. Therefore, the time complexity is O(n^2)

 Space complexity : O(1) */

var output: [Int] = []

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
  let n = nums.count
  var toggle = false
  for i in 0 ..< n {
    for j in i + 1 ..< n {
      if toggle == false {
        if nums[i] + nums[j] == target {
          toggle = true
          output.append(i)
          output.append(j)
          break
        }
      }
    }
  }
  return output
}

twoSum([3, 2, 4], 6)


func twoSumUsingDict(_ nums: [Int], _ target: Int) -> [Int] {
  
  var dict = [Int: Int]()
  
  for(firstIndex, firstNum) in nums.enumerated() {
    let secondNum = target - firstNum
    if let secondIndex = dict[secondNum] {
      return[secondIndex, firstIndex]
    }
    
    dict[firstNum] = firstIndex
  }
  fatalError("No valid output")
}

twoSumUsingDict([3, 3, 2, 8, 0], 8)
