class Solution {
  func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    
    var map:[Int: Int] = [:]
    
    var stack:[Int] = []
    
    var nextGreaterNumber:[Int] = Array(repeating: -1, count: nums1.count)
    
    for num in nums2 {
      while (stack.last != nil),
            num > stack.last! {
        map[stack.last!] = num
        stack.removeLast()
      }
      stack.append(num)
    }
    
    for (i,num) in nums1.enumerated() {
      if let value = map[num] {
        nextGreaterNumber[i] = value
      }
    }
    return nextGreaterNumber
  }
}

