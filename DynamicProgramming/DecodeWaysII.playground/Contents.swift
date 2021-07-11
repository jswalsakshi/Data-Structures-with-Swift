
  
  func numDecodings(_ s: String) -> Int {
    
    var dp = Array(repeating: 0, count: s.count + 1)
    
    dp[0] = 1
    dp[1] = decodeSingleChar(c: s.first!)
    
    if s.count >= 2 {
      for i in 2...s.count {
        let prevChar = s[s.index(s.startIndex, offsetBy: i-2)]
        let currChar = s[s.index(s.startIndex, offsetBy: i-1)]
        
        dp[i] += dp[i-1] * decodeSingleChar(c: currChar)
        print(i)
        print(dp[i])
        dp[i] += dp[i-2] * decodeTwoChar(first: prevChar, second: currChar)
        print(dp[i])
        dp[i] = dp[i] % 1000000007
      }
    }
    return dp[s.count]
  }
  
  private func decodeSingleChar(c: Character) -> Int {
    if (c == "*") {
      return 9
    }
    else if (c == "0") {
      return 0
    }
    else {
      return 1
    }
  }
  
  private func decodeTwoChar(first: Character, second: Character) -> Int {
    switch first {
    case "*":
      if second == "*" {
        return 15
      }
      else if (second >= "0" && second <= "6") {
        return 2
      }
      else {
        return 1
      }
    case "1":
      if second == "*" {
        return 9
      }
      else {
        return 1
      }
    case "2":
      if second == "*" {
        return 6
      }
      else if (second >= "0" && second <= "6") {
        return 1
      }
      else {
        return 0
      }
    default:
      return 0
    }
  }

numDecodings("2*")
