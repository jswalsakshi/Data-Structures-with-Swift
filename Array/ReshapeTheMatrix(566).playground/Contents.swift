
  func matrixReshape(_ mat: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
    
    if mat.count * mat[0].count != r * c {
      return mat
    }
    
    var reshapedArray = Array(repeating: Array(repeating: 0, count: c), count: r)
    
    var sr = 0
    var sc = 0
    
    for i in 0..<mat.count {
      for j in 0..<mat[0].count {
        if sc == c {
          sr += 1
          sc = 0
        }
        reshapedArray[sr][sc] = mat[i][j]
        print(reshapedArray)
        sc += 1
      }
    }
    return reshapedArray
  }


matrixReshape([[1,2],[3,4]], 1, 4)
