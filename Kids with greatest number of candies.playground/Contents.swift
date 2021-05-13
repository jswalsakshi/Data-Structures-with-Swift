
var greatestCandies = 0

func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
  
  findGreatest(candies)
  var resultantArray = [Bool]()
  
  for (_ , num) in candies.enumerated() {
    if num == greatestCandies {
      resultantArray.append(true)
    }
    
    else {
      let candyRequested = greatestCandies - num
      if candyRequested > extraCandies {
        resultantArray.append(false)
      }
      else {
        resultantArray.append(true)
      }
    }
  }
  
  return resultantArray
}

private func findGreatest(_ candies: [Int]) -> Int {
  
  for (_ , num) in candies.enumerated() {
    if num > greatestCandies {
      greatestCandies = num
    }
  }
  return greatestCandies
}

kidsWithCandies([4,2,1,1,2], 1)

func kidsWithCandies2(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
  let requiredCount = (candies.max() ?? 0) - extraCandies
  
  return candies.map({ $0 >= requiredCount })
}

kidsWithCandies2([4,2,1,1,3], 1)
