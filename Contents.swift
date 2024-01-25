import Foundation

let arr = [100, 80, 60, 70, 60, 75, 85]

// 1. for anyday, number of stock price which are smaller

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
//2. valid parenthesis

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

// longest valid parenthesis

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

func longestValidParentheses1(_ s: String) -> Int {
    var stack = [-1] // Initialize the stack with -1 to mark the base
    
    var maxLength = 0
    
    for (index, char) in s.enumerated() {
        if char == "(" {
            stack.append(index)
        } else {
            // Pop the last index from the stack
            stack.removeLast()
            
            if stack.isEmpty {
                // If the stack is empty, push the current index to mark a new base
                stack.append(index)
            } else {
                // Calculate the length of the valid parentheses substring
                maxLength = max(maxLength, index - stack.last!)
            }
        }
    }
    
    return maxLength
}

let s11 = "()(())"
print(longestValidParentheses1(s11)) // Output: 2



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
    var val: Int
    var next: ListNode?
    
    init(_ value: Int) {
        self.val = value
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
    
    if l1.val < l2.val {
        l1.next = mergeTwoLists(l1.next, l2)
        return l1
    } else {
        l2.next = mergeTwoLists(l1, l2.next)
        return l2
    }
}

func findnthSeq(n: Int) -> Int {
    var seq = [1]
    
    var nextNum = seq.last! + 1
    var product = seq.last! * nextNum
    
    for _ in 0..<n {
        seq.append(product)
        nextNum += 1
        product *= nextNum
    }
    
    return seq[n-1]
}

func nthSmallestNumber(_ n: Int) -> Int {
    var sequence = [2]  // Initialize the sequence with the first number (2)
    var currentNumber = 3  // Start checking from the next number (3)
    
    while sequence.count < n {
        var isProduct = false
        
        // Check if the current number is a product of consecutive numbers
        for i in 2...currentNumber {
            if currentNumber % i == 0 && currentNumber / i == (i - 1) {
                isProduct = true
                break
            }
        }
        
        // If the current number is a product, add it to the sequence
        if isProduct {
            sequence.append(currentNumber)
        }
        
        currentNumber += 1
    }
    
    return sequence.last!
}

// Example usage:
let nthNumber = nthSmallestNumber(10)
print("The 5th smallest number in the sequence is: \(nthNumber)")


// Sliding window where ws is the ptr.count
// where que talks about substring and k is given

func findAnagram(s: String, ptr: String) -> Int {
    var arrStr = Array(s)
    var mp = [Character: Int]()
    var count = 0
    var j = 0
    var i = 0
    var ans = 0
    
    for ch in ptr {
        if mp.keys.contains(ch) {
            mp[ch] = mp[ch]! + 1
        } else {
            mp[ch] = 1
            count += 1
        }
    }
    
    while j < arrStr.count {
        if mp.keys.contains(arrStr[j]) {
            mp[arrStr[j]]! -= 1
            
            if mp[arrStr[j]]! == 0 {
                count -= 1
            }
        }
        
        if j - i + 1 < ptr.count {
            j += 1
        }
        else if j - i + 1 == ptr.count {
            if count == 0 {
                ans += 1
            }
            
            if mp.keys.contains(arrStr[i]) {
                mp[arrStr[i]]! += 1
                
                if mp[arrStr[i]]! > 0 {
                    count += 1
                }
            }
            
            i += 1
            j += 1
        }
    }
    
    return ans
}

// Example usage:
let result = findAnagram(s: "aabaaabaa", ptr: "aaba")
print(result)

// Sliding window where ws is the the map.count
// where que talks about substring and k is given

func logestSubstringNoRepeatChar(s: String) -> Int {
    
    var arrStr = Array(s)
    var i = 0
    var j = 0
    var mp = [Character: Int]()
    var mx = 0
    
    while j < arrStr.count {
        
        // calculation
        
        if mp.keys.contains(arrStr[j]) {
            mp[arrStr[j]]! += 1
        } else {
            mp[arrStr[j]] = 1
        }
        
        if mp.count > j-i+1 {
            j += 1
        } else if mp.count == j-i+1 {
            mx = max(mx, j-i+1)
            j += 1
        } else {
            while(mp.count < j-i+1) {
                if mp.keys.contains(arrStr[i]) {
                    mp[arrStr[i]]! -= 1
                    if mp[arrStr[i]]! == 0 {
                        mp.removeValue(forKey: arrStr[i])
                    }
                }
                i += 1
            }
            j += 1
        }
    }
    return mx
}

let s2 = "pwwkew"

logestSubstringNoRepeatChar(s: s2)

// Shortest Path in Binary Matrix
//BFS

func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
    let n = grid.count
    
    if grid[0][0] == 1 && grid[n-1][n-1] == 1 {
        return -1
    }
    
    let moves = [(-1, 0), (0, 1), (-1, 1), (1, 1),
                 (0, -1), (1, 0), (1, -1), (-1, -1)]
    
    var grid = grid
    var queue = [(0,0)]
    grid[0][0] = 1
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        guard node != (n-1, n-1) else { return grid[n-1][n-1] }
        
        for move in moves {
            let possibleNext = (node.0 + move.0, node.1 + move.1)
            guard possibleNext.0 >= 0, possibleNext.0 < n,
                  possibleNext.1 >= 0, possibleNext.1 < n,
                  grid[possibleNext.0][possibleNext.1] == 0  else { continue }
            queue.append(possibleNext)
            grid[possibleNext.0][possibleNext.1] = grid[node.0][node.1] + 1
        }
    }
    return -1
}

let grid1 = [[0,0,0],[1,1,0],[1,1,0]]
print(shortestPathBinaryMatrix(grid1))

class MinStack {
    var stack: [Int]
    
    init() {
        stack = [Int]()
    }
    
    func push(_ val: Int) {
        self.stack.append(val)
    }
    
    func pop() {
        self.stack.removeLast()
    }
    
    func top() -> Int {
        return self.stack.last!
    }
    
    func getMin() -> Int {
        return self.stack.min()!
    }
    
}

var minStack = MinStack();
minStack.push(-2);
minStack.push(0);
minStack.push(-3);
minStack.getMin(); // return -3
minStack.pop();
minStack.top();    // return 0
minStack.getMin(); // return -2


//class ListNode {
//    var val: Int
//    var next: ListNode?
//
//    init(_ val: Int) {
//        self.val = val
//        self.next = nil
//    }
//}

//func oddEvenList(_ head: ListNode?) -> ListNode? {
//    guard head != nil else {
//        return nil
//    }
//
//
//}

func insertionSortList(_ head: ListNode?) -> ListNode? {
    guard head != nil else {
        return nil
    }
    
    let dummy = ListNode(0)
    var curr = head
    
    while curr != nil {
        let next = curr?.next
        
        // Find the correct position to insert
        var prev = dummy
        while prev.next != nil && prev.next!.val < curr!.val {
            prev = prev.next!
        }
        
        // Insert the current node at the correct position
        curr?.next = prev.next
        prev.next = curr
        
        // Move to the next node in the unsorted part of the list
        curr = next
    }
    
    return dummy.next
}

// Example usage:
let list1 = ListNode(4)
list1.next = ListNode(2)
list1.next?.next = ListNode(1)
list1.next?.next?.next = ListNode(3)

let sortedList1 = insertionSortList(list1)
printList(sortedList1) // Output: 1 -> 2 -> 3 -> 4

let list2 = ListNode(-1)
list2.next = ListNode(5)
list2.next?.next = ListNode(3)
list2.next?.next?.next = ListNode(4)
list2.next?.next?.next?.next = ListNode(0)

let sortedList2 = insertionSortList(list2)
printList(sortedList2) // Output: -1 -> 0 -> 3 -> 4 -> 5

// Helper function to print the linked list
func printList(_ head: ListNode?) {
    var current = head
    while let node = current {
        print("\(node.val) -> ", terminator: "")
        current = node.next
    }
    print("nil")
}

//func predictTheWinner(_ nums: [Int]) -> Bool {
//
//    let n = nums.count
//    var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
//
//    for i in 0..<n {
//        dp[i][i] = nums[i]
//    }
//
//}

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var result = [Int]()
    
    for i in 0..<nums.count {
       let secondNum = target - nums[i]
        if (nums.contains(secondNum)) {
            result.append(i)
            result.append(nums.firstIndex(of: secondNum)!)
            break
        }
        
    }
    
    return result
}

let nums = [3,2,4], target = 6

print(twoSum(nums, target))

func fizzBuzz(n: Int) -> Void {
    for i in 1...n {
        if i%3 == 0 && i%5 == 0 {
            print("FizzBuzz")
        }else if i%3 == 0 {
            print("Fizz")
        }else if i%5 == 0 {
            print("Buzz")
        }else {
            print(i)
        }
    }
}

fizzBuzz(n: 15)
