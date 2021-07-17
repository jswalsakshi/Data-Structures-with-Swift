
  func triangleNumber(_ nums: [Int]) -> Int { // [2,2,3,4]
    var ans = 0
    guard nums.count > 3 else { return 0 }
    var arr = nums
    arr.sort()
    
    for j in 2..<arr.count {
      var l = 0
      var r = j - 1
      
      while l < r {
        if (arr[l] + arr[r] > arr[j]) {
          ans += (r - l)
          r -= 1
        }
        else {
          l += 1
        }
      }
    }
    return ans
  }

triangleNumber([2,2,3,4])
