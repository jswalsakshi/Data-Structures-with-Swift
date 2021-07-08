
func minSetSize(_ arr: [Int]) -> Int {
  
  let arrCount = arr.count
  
  var dict: [Int: Int] = [ : ]//[element: freq]
  
  for num in arr {
    if dict[num] == nil {
      dict[num] = 1
    }
    else {
      dict[num]! += 1
    }
  }
  
  let values = dict.values.sorted { (first, second) -> Bool in
    return second < first
  }
  
  var count = 0
  var total = arrCount
  var i = 0
  
  while total > arrCount/2 {
    total = total - values[i]
    
    i += 1
    count += 1
  }
  return count
}

minSetSize([3,3,3,3,5,5,5,7,7,2])
