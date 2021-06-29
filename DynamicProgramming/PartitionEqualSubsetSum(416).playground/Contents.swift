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

canPartition([1,5,11,5])


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
