import Foundation

func MCM(arr: [Int], i: Int, j: Int) -> Int {
    
    if(i>=j) {
        return 0
    }
    
    var tempAns: Int
    var mn = Int.max
    
    for k in i...j-1 {
      tempAns = (MCM(arr: arr, i: i, j: k) +
                MCM(arr: arr, i: k+1, j: j) +
                arr[i-1] * arr[k] * arr[j])
        
        if tempAns < mn {
            mn = tempAns
        }
    }
    return mn
}

let arr = [40, 20, 30, 10, 30]

print(MCM(arr: arr, i: 1, j: arr.count - 1))


func minNumOfPartition(s: String, i: Int, j: Int) -> Int {
    if(i>=j) {
        return 0
    }
    
    var tempAns: Int
    var mn = Int.max
    var dp = Array(repeating: Array(repeating: -1, count: s.count + 1), count: s.count + 1)
    
    for k in i...j {
        var left: Int
        var right: Int
        
        if (dp[i][k] != -1) {
            left = dp[i][k]
        } else {
            left = minNumOfPartition(s: s, i: i, j: k)
        }
        
        if (dp[k+1][j] != -1) {
            right = dp[k+1][j]
        } else {
            right = minNumOfPartition(s: s, i: k+1, j: j)
        }
        
        tempAns = (left + right + 1)
        
        if tempAns < mn {
            mn = tempAns
        }
    }
    
    return mn
}

let s = "nitik"

print(minNumOfPartition(s: s, i: 0, j: s.count - 1))
