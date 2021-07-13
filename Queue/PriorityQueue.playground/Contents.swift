
struct PriorityQueue<Element: Equatable>: Queue { //Equitable because we need to compare the element
  
  mutating func enqueue(_ element: Element) -> Bool {
    <#code#>
  }
  
  mutating func dequeue() -> Element? {
    <#code#>
  }
  
  var isEmpty: Bool
  
  var peek: Element?
  
  
}
