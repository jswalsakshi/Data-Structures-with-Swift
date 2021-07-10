import Foundation

  func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
    let n = matrix.count
    var low = matrix[0][0]
    var high = matrix[n-1][n-1]
    
    while low < high {
      let mid = low + (high - low)/2
      let count = findNum(matrix, mid)
      if count < k {
        low = mid + 1
      }
      else {
        high = mid
      }
    }
   
    return low
  }
  
  func findNum(_ updatedMatrix: [[Int]], _ target: Int) -> Int {
    var cnt = 0
    let n = updatedMatrix.count
    var i = n - 1
    var j = 0
    
    while i >= 0 && j < n {
      if updatedMatrix[i][j] > target {
        i -= 1
      }
      else {
        cnt = cnt + i + 1
        j += 1
      }
    }
    
    return cnt
  }
  
  func print1() {
    let current = Thread.current
    print(current, current.stackSize)
    
    let t = Thread()
    t.name = "secondary"
    print(t, t.stackSize)
  }

print(Thread.isMainThread)
print1()


