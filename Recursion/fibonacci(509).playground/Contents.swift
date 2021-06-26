import Foundation

//Recursion

class Solution {
  
  var memorizeArray = Array(repeating: -1, count: 31)
  
  func fib(_ n: Int) -> Int {
    
    memorizeArray[0] = 0
    memorizeArray[1] = 1
    
    if memorizeArray[n] != -1 {
      return memorizeArray[n]
    }
    else {
      memorizeArray[n] = fib(n-1) + fib(n-2)
      return memorizeArray[n]
      
    }
  }
}


