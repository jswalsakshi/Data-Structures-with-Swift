class RecentCounter {
  var queue:[Int] = [Int]()
  
  init() {
    
  }
  
  func ping(_ t: Int) -> Int {
    queue.append(t)
    
    while t - queue[0] > 3000 {
      queue.remove(at: 0)
    }
    
    return queue.count
  }
}


var recentCounter: RecentCounter = RecentCounter()

recentCounter.ping(1)
recentCounter.ping(100)
recentCounter.ping(3001)
recentCounter.ping(3002)
recentCounter.ping(6001)
/**
 * Your RecentCounter object will be instantiated and called as such:
 * let obj = RecentCounter()
 * let ret_1: Int = obj.ping(t)
 */


