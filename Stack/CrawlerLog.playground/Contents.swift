
    public func minOperations(_ logs: [String]) -> Int {
        
      var resCount:Int = 0
      
      for ch in logs {
        
        switch ch {
        case "../" :
          if resCount != 0 {
            resCount -= 1
          }
        case "./":
          // DO nothing
        continue
        default:
          resCount += 1
        }
      }
      return resCount
    }
minOperations(["d1/","d2/","../","d21/","./"])
