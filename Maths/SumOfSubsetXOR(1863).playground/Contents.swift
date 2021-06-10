

  func subsetXORSum(_ nums: [Int]) -> Int {
    
    let count = nums.count
    var res:Int = 0
    
    func calculateXOR(_ xor: Int, _ start: Int) {
      guard start < count else { return }
      
      let nextXor = xor ^ nums[start]
      res += nextXor
      
      calculateXOR(xor, start+1)
      calculateXOR(nextXor, start+1)
    }
    
    calculateXOR(0, 0)
    
    return res
  }

subsetXORSum([5,1,6])
