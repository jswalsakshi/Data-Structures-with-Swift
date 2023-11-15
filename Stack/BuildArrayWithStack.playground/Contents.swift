
  func buildArray(_ target: [Int], _ n: Int) -> [String] {
    
    var stackArray: [Int] = target
    var stringArray: [String] = []
    
    for i in 1...n {
      if i == stackArray.first {
        stringArray
          .append("Push")
        stackArray.removeFirst()
        if stackArray.isEmpty {
          return stringArray
        }
      }
      else {
        stringArray.append("Push")
        stringArray.append("Pop")
      }
    }
    return stringArray
  }

buildArray([1,2], 4)


// min stack without extra space

var stack: [Int] = [Int]()
var sStack: [Int] = [Int]()

func getMin() -> Int {
    
    if (sStack.isEmpty) {
        return -1
    } else {
        return sStack.last!
    }
    
}



func push(element: Int) {
    stack.append(element)
    
    if(sStack.isEmpty) || (sStack.last! >= element) {
        sStack.append(element)
        return
    }
}

func pop() -> Int {
    if(sStack.isEmpty) {
        return -1
    }
    
    let ans = stack.last!
    stack.removeLast()
    
    if(sStack.last! == ans) {
        sStack.removeLast()
    }
    
    return ans
}


let arr = [18, 19, 29, 15, 16]


