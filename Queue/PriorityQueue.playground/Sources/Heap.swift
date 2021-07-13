import Foundation

struct Heap<Element: Equatable>  {
  
  var elements: [Element] = []
  let sort: (Element, Element) -> Bool
  
  init(sort: @escaping (Element, Element) -> Bool) {
    self.sort = sort
  }
  
  var isEmpty: Bool {
    return elements.isEmpty
  }
  
  var count: Int {
    return elements.count
  }
  
  func peek() -> Element? {
    return elements.first
  }
  
  func leftChildIndex(ofParentAt index: Int) -> Int {
    return (2 * index) + 1
  }
  
  func rightChildIndex(ofParentAt index: Int) -> Int {
    return (2 * index) + 2
  }
  
  func parentIndex(ofChildAt index: Int) -> Int {
    return (index - 1) / 2
  }
  
  //Removing from heap
  
  mutating func remove() -> Element? { //TC: O(logn)
    guard !isEmpty else {
      return nil
    }
    elements.swapAt(0, count - 1) //swap the root with last element of the heap //TC: O(1)
    defer {
      siftDown(from: 0) //shift because now it may be not heap(min-max)
    }
    return elements.removeLast()
  }
  
  mutating func siftDown(from index: Int) { //TC: O(logn)
    var parent = index
    
    while true {
      let left = leftChildIndex(ofParentAt: parent)
      let right = rightChildIndex(ofParentAt: parent)
      
      var candidate = parent //which index to swap with parent
      
      if left < count && sort(elements[left], elements[candidate]) {
        candidate = left
      }
      if right < count && sort(elements[right], elements[candidate]) {
        candidate = right
      }
      
      if candidate == parent {
        return
      }
      elements.swapAt(parent, candidate)
      parent = candidate
    }
  }
  
  //Inserting into the heap
  
  mutating func insert(_ element: Element) { //O(logn)
    elements.append(element)
    siftUp(from: elements.count - 1)
  }
  
  mutating func siftUp(from index: Int) {
    var child = index
    
    var parent = parentIndex(ofChildAt: child)
    while child > 0 && sort(elements[child], elements[parent]) {
      elements.swapAt(child, parent)
      child = parent
      parent = parentIndex(ofChildAt: child)
    }
  }
}
