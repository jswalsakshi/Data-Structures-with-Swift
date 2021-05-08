
func runningSum(_ nums: [Int]) -> [Int] {
  
  guard nums.count > 1 else {
    return nums
  }
  var updatedArray = nums
  
  for i in 0..<nums.count - 1 {
    updatedArray[i+1] = updatedArray[i] + updatedArray[i+1]
  }
  return updatedArray
}

runningSum([1,10,2])


func runningSumApproachTwo(_ nums: [Int]) -> [Int] {
  guard nums.count > 1 else {
    return nums
  }
  
  var arr:[Int] = []
  
  var sum = 0
  
  for n in nums {
    sum += n
    arr.append(sum)
  }
  return arr
}

runningSumApproachTwo([1,4,2])


func runningSumOtherApproach(_ nums: [Int]) -> [Int] {
  var sum = 0
  
  return nums.map { (sum += $0, sum).1 }
  
}

runningSumOtherApproach([1,5,4,1])

