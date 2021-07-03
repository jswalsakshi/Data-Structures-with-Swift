class Solution {
  func grayCode(_ n: Int) -> [Int] {
    
    var list = [Int]()
    list.append(0)
    
    if(n==0) {return list}
    
    list.append(1)
    
    var curr = 1
    
    if n > 1 {
      for _ in 2...n {
        curr = curr * 2
        let count = list.count - 1
        for j in stride(from: count, through: 0, by: -1) {
          list.append(curr + list[j])
        }
      }
    }
    
    return list
  }
}
