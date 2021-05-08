import Foundation


// Easy Solution but not recommended

    func removeDuplicates(_ nums: inout [Int]) -> Int {
      guard !nums.isEmpty else { return 0 }
      
      nums = Array(Set(nums)).sorted()
      
      return nums.count
    }

var nums = [1,8,9,15]

removeDuplicates(&nums)



//Time Complexity is O(n)
//Space Complexity is O(1)
func removeDuplicatesFromSortedArray(_ nums: inout [Int]) -> Int {
  guard nums.count != 0 else {
    return 0
  }
  
  var count: Int = 0
  
  for index in 1..<nums.count {
    if nums[index] != nums[count] {
      count+=1
      nums[count] = nums[index]
    }
  }
  return count + 1
}

removeDuplicatesFromSortedArray(&nums)
