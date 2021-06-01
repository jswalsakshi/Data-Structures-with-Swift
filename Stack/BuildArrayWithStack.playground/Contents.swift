
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
