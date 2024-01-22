import Foundation

let arr = [100, 80, 60, 70, 60, 75, 85]

// for anyday, number of stock price which are smaller

func stockSpan(arr: [Int]) -> [Int] {
    
    var stack: [(Int, Int)] = [(Int, Int)]()
    var output: [Int] = [Int]()
    var result = [Int](repeating: 0, count: arr.count)
    
    for i in 0..<arr.count {
        if stack.isEmpty {
            output.append(-1)
        } else if (!stack.isEmpty && stack.last!.0 >= arr[i]) {
            output.append(stack.last!.1)
        } else {
            while (!stack.isEmpty && stack.last!.0 < arr[i]) {
                stack.removeLast()
            }
            if stack.isEmpty {
                output.append(-1)
            } else {
                output.append(stack.last!.1)
            }
            
        }
        stack.append((arr[i], i))
    }
    
    for i in 0..<arr.count {
        result[i] = i - output[i]
    }
    
    return result
}

print(stockSpan(arr: arr))

//'(', ')', '{', '}', '[' and ']'

func isValid(_ s: String) -> Bool {
    
    var stack = [Character]()
    
    if s.isEmpty {
        return false
    }
    
    for char in s {
        if (char == "(" || char == "{" || char == "[") {
            stack.append(char)
        } else {
            
            if stack.isEmpty {
                return false
            }
            
            let top = stack.removeLast()
            
            switch char {
            case ")":
                if top != "(" {
                    return false
                }
            case "}":
                if top != "{" {
                    return false
                }
            case "]":
                if top != "[" {
                    return false
                }
            default:
                return false
            }
        }
    }
    return stack.isEmpty
}

let s = "["
print(isValid(s))


func longestValidParentheses(_ s: String) -> Int {
    
    var stack = [Character]()
    var result = [Character]()
    
    if s.isEmpty {
        return 0
    }
    
    for char in s {
        if char == "(" {
            stack.append(char)
        } else {
            if stack.isEmpty {
                continue
            }
            
            let top = stack.removeLast()
            
            if char == ")" {
                result.append(top)
                result.append(char)
            }
            
            
        }
    }
    return result.count
}

let s1 = "()(()"
print(longestValidParentheses(s1))


func numIslands(_ grid: [[String]]) -> Int {
    
    var grid = grid
    var numofIslands = 0
    
    for row in 0..<grid.count {
        for col in 0..<grid[0].count {
            if grid[row][col] == "1" {
                dfs(&grid, row, col)
                numofIslands += 1
            }
        }
    }
    
    return numofIslands
    
}

private func dfs(_ grid: inout [[String]], _ row: Int, _ col: Int) {
    if row < 0 || row >= grid.count || col < 0 || col >= grid[0].count { return }
    
    if grid[row][col] != "1" { return }
    grid[row][col] = "0"
    
    dfs(&grid, row-1, col)
    dfs(&grid, row+1, col)
    dfs(&grid, row, col+1)
    dfs(&grid, row, col-1)
}

let  grid = [
    ["1","1","0","0","0"],
    ["1","1","0","0","0"],
    ["0","0","1","0","0"],
    ["0","0","0","1","1"]
  ]
print(numIslands(grid))


// code priority queue
struct PriorityQueuePractice<T: Comparable> {
    
    private var heap = [T]()
    
    var isEmpty: Bool {
        return heap.isEmpty
    }
    
    var count: Int {
        return heap.count
    }
    
    mutating func enqueue(_ element: T) {
        heap.append(element)
        heapifyUp()
    }
    
    mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }
        
        if heap.count == 1 {
            return heap.removeLast()
        }
        
        let root = heap[0]
        heap[0] = heap.removeLast()
        heapifyDown()
        
        return root
    }
    
    private mutating func heapifyUp() {
        
    }
    
    private mutating func heapifyDown() {
        
    }
}


struct PriorityQueue<T: Comparable> {
    private var heap = [T]()

    var isEmpty: Bool {
        return heap.isEmpty
    }

    var count: Int {
        return heap.count
    }

    mutating func enqueue(_ element: T) {
        heap.append(element)
        heapifyUp()
    }

    mutating func dequeue() -> T? {
        guard !isEmpty else {
            return nil
        }

        if heap.count == 1 {
            return heap.removeFirst()
        }

        let root = heap[0]
        heap[0] = heap.removeLast()
        heapifyDown()

        return root
    }

    private mutating func heapifyUp() {
        var currentIndex = heap.count - 1

        while currentIndex > 0 {
            let parentIndex = (currentIndex - 1) / 2

            if heap[currentIndex] < heap[parentIndex] {
                heap.swapAt(currentIndex, parentIndex)
                currentIndex = parentIndex
            } else {
                break
            }
        }
    }

    private mutating func heapifyDown() {
        var currentIndex = 0

        while true {
            let leftChildIndex = 2 * currentIndex + 1
            let rightChildIndex = 2 * currentIndex + 2

            var minIndex = currentIndex

            if leftChildIndex < heap.count && heap[leftChildIndex] < heap[minIndex] {
                minIndex = leftChildIndex
            }

            if rightChildIndex < heap.count && heap[rightChildIndex] < heap[minIndex] {
                minIndex = rightChildIndex
            }

            if minIndex == currentIndex {
                break
            }

            heap.swapAt(currentIndex, minIndex)
            currentIndex = minIndex
        }
    }
}

// Example usage:
var priorityQueue = PriorityQueue<Int>()
priorityQueue.enqueue(3)
priorityQueue.enqueue(1)
priorityQueue.enqueue(4)
priorityQueue.enqueue(1)
priorityQueue.enqueue(5)

while !priorityQueue.isEmpty {
    if let element = priorityQueue.dequeue() {
        print(element)
    }
}

// merge sorted linkedin

class ListNode {
    var value: Int
    var next: ListNode?
    
    init(_ value: Int) {
        self.value = value
        self.next = nil
    }
}

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    guard let l1 = l1 else {
        return l2
    }
    
    guard let l2 = l2 else {
        return l1
    }
    
    if l1.value < l2.value {
        l1.next = mergeTwoLists(l1.next, l2)
        return l1
    } else {
        l2.next = mergeTwoLists(l1, l2.next)
        return l2
    }
}
