
func reverseWords(_ s: String) -> String {
  
  var sArr = Array(s)
  var l = 0
  var r = 0
  
  //      var i = 0
  //      var j = 0
  
  while l < sArr.count {
    while (r < sArr.count && sArr[r] != " ") {
      r += 1
    }
    print(l)
    reverseChar(word: &sArr)
    l = r + 1
    r = l
  }
  return String(sArr)
}

private func reverseChar(word: inout [Character]) {
  
  var startIndex = 0
  var endIndex = word.count - 1
  
  
  while startIndex < endIndex {
    word.swapAt(endIndex, startIndex)
    startIndex += 1
    endIndex -= 1
  }
  
}

reverseWords("God Ding")
