 // example -> EGG: ADD
 func isIsomorphic(_ s: String, _ t: String) -> Bool {
  
  guard s.count == t.count else {
    return false
  }
  
  var sMap: [Character: Character] = [:]
  var tMap: [Character: Character] = [:]
  let sArr = Array(s)
  let tArr = Array(t)
  
  for index in 0..<s.count {
    let sChar = sArr[index]
    let tChar = tArr[index]
    
    if sMap.keys.contains(sChar) {
      if sMap[sChar] != tChar {
        return false
      }
    }
    
    if tMap.keys.contains(tChar) {
      if tMap[tChar] != sChar {
        return false
      }
    }
    
    sMap[sChar] = tChar
    tMap[tChar] = sChar
    
  }
  return true
 }
 isIsomorphic("ab", "a")
