func canPartition(_ nums: [Int]) -> Bool {
  let sum = nums.reduce(0, +)
  
  if sum%2 != 0 { return false }
  
  var cache = [[Bool]](repeating: [Bool](repeating: false, count:(sum/2 + 1)), count: nums.count + 1)
  
  cache[0][0] = true
  let subsetSum = sum/2
  
  for i in 0..<nums.count {
    for j in 0..<subsetSum {
      if i == 0 {
        cache[0][j] = true
      }
      else if j == 0 {
        cache[i][0] = false
      }
    }
  }

  for i in 1..<nums.count {
    let curr = nums[i-1]
    for j in 0..<subsetSum {
      if (j < curr) {
        cache[i][j] = cache[i - 1][j];
      }
      else {
        cache[i][j] = cache[i - 1][j] || (cache[i - 1][j - curr]);
      }
      return cache[i][j];
    }
  }
  return cache[nums.count][subsetSum];
}

canPartition([1,5,11,5,1,1])


func totalSubset(_ arr: [Int]) -> Int {
    let sum = arr.reduce(0, +)
    if sum%2 != 0 { return 0 }
    
    var t = Array(repeating: Array(repeating: 0, count: sum + 1), count: arr.count + 1)
    
    for i in 0..<arr.count {
      for j in 0..<sum {
        if i == 0 {
          t[0][j] = 0
        }
        else if j == 0 {
          t[i][0] = 1
        }
      }
    }
    
    for i in 1..<arr.count {
        for j in 1..<sum {
            if(arr[i - 1] <= j) {
                t[i][j] = t[i - 1][j] + t[i-1][j - arr[i - 1]]
            } else {
                t[i][j] = t[i-1][j]
            }
        }
    }
    return t[arr.count][sum]
}

let arr1 = [2,3,5,6,8,10]
print(totalSubset(arr1))

func canPartition1(_ nums: [Int]) -> Bool {
    let sum = nums.reduce(0, +)
    
    if sum % 2 != 0 {
        return false
    }
    
    let subsetSum = sum / 2
    
    var cache = [Bool](repeating: false, count: subsetSum + 1)
    cache[0] = true
    
    for num in nums {
        for j in stride(from: subsetSum, through: num, by: -1) {
            cache[j] = cache[j] || cache[j - num]
        }
    }
    
    return cache[subsetSum]
}

canPartition1([1,5,11,5,1])

//int totalSum = 0;
//       // find sum of all array elements
//       for (int num : nums) {
//           totalSum += num;
//       }
//       // if totalSum is odd, it cannot be partitioned into equal sum subset
//       if (totalSum % 2 != 0) return false;
//       int subSetSum = totalSum / 2;
//       int n = nums.size();
//       bool dp[n + 1][subSetSum + 1];
//       memset(dp, 0, (n + 1) * (subSetSum + 1) * sizeof(bool));
//       dp[0][0] = true;
//       for (int i = 1; i <= n; i++) {
//           int curr = nums[i - 1];
//           for (int j = 0; j <= subSetSum; j++) {
//               if (j < curr)
//                   dp[i][j] = dp[i - 1][j];
//               else
//                   dp[i][j] = dp[i - 1][j] || (dp[i - 1][j - curr]);
//           }
//       }
//       return dp[n][subSetSum];


func totalSubset1(_ arr: [Int], sum: Int) -> Int {

    var t = Array(repeating: Array(repeating: 0, count: sum + 1), count: arr.count + 1)

    for i in 0...arr.count {
        for j in 0...sum {
            if j == 0 {
                t[i][0] = 1
            } else if i == 0 {
                t[0][j] = 0
            }
        }
    }

    for i in 1...arr.count {
        for j in 1...sum {
            if arr[i - 1] <= j {
                t[i][j] = t[i - 1][j] + t[i - 1][j - arr[i - 1]]
            } else {
                t[i][j] = t[i - 1][j]
            }
        }
    }
    return t[arr.count][sum]
}

// Example usage
let arr2 = [2, 3, 5, 6, 8, 10]
print(totalSubset1(arr2, sum: 10))

func totalSubset2(_ arr: [Int], sum: Int) -> Int {
    var t = Array(repeating: 0, count: sum + 1)
    t[0] = 1

    for i in 0..<arr.count {
        for j in stride(from: sum, through: arr[i], by: -1) {
            t[j] += t[j - arr[i]]
        }
    }

    return t[sum]
}
print(totalSubset2(arr2, sum: 10))

