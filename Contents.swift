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


func findMinPrice(prices: [Int], m: Int) -> Int {
    var sum = prices.reduce(0) { partialResult, price in
        partialResult + price
    }
    
    var mn = Int.max
    
    for price in prices {
        let discount = price/2^m
        mn = min(mn, sum - price + discount)
    }
    
    return mn
}

let prices = [2, 4, 12], m = 3

print(findMinPrice(prices: prices, m: 2))


// 75 Questions to practice
// 1. 2 Sum

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var toggle = false
    var result = [Int]()
    
    if toggle == false {
        for i in 0..<nums.count {
            for j in (i+1)..<nums.count {
                if nums[j] == target - nums[i] {
                    result.append(i)
                    result.append(j)
                    toggle = true
                    break
                }
            }
        }
    }
    return result
}

let nums3 = [3,2,4], target3 = 6

print(twoSum(nums3, target3))

// 2.  Valid Parentheses

func isValidPractice(_ s: String) -> Bool {
    guard !s.isEmpty else { return false }
    
    var data = [Character]()
    
    for char in s {
        if (char == "(" || char == "{" || char == "[") {
            data.append(char)
        } else {
            if data.isEmpty {
                return false
            } else {
                let top = data.removeLast()
                
                switch char {
                case ")":
                    if top != "(" {
                        return false
                    }
                case "]":
                    if top != "[" {
                        return false
                    }
                case "}":
                    if top != "{" {
                        return false
                    }
                default:
                    return false
                }
            }
        }
    }
    return data.isEmpty
}

let s4 = ""
isValidPractice(s)

// 3. Merge Two Sorted Lists

func mergeTwoListsPractice(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    guard var list1 = list1  else { return list2 }
    guard var list2 = list2 else { return list1 }
    
    if list1.val > list2.val {
        list2.next = mergeTwoListsPractice(list1.next, list2)
        return list2
    } else {
        list1.next = mergeTwoListsPractice(list1, list2.next)
        return list1
    }
}

//let list8 = [1,2,4], list9 = [1,3,4]

//4. Best Time to Buy and Sell Stock

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var salePrice = -1
        var ans = 0
        
        for price in prices.reversed() {
            if price >= salePrice { salePrice = price  }
            else {
                ans = max(ans, (salePrice - price))
            }
        }
        
        return ans
    }
}

// 5. Valid Palindrome

func isPalindrome(_ s: String) -> Bool {
    guard !s.isEmpty else { return true }
    
    var inputString = s.replacingOccurrences(of: "[^a-zA-Z0-9]", with: "", options: .regularExpression)
        .lowercased()
    
    
    var outputString = String(inputString.reversed())
    
    return inputString == outputString
}

let s0 = "A man, a plan, a canal: Panama"

isPalindrome(s0)

func isPalindromeOptimised(_ s: String) -> Bool {
    let sArray = Array(s);
    var left: Int = 0;
    var right: Int = sArray.count - 1;
    
    while left < right {
        var leftChar: Character = sArray[left];
        var rightChar: Character = sArray[right];
        
        if !leftChar.isLetter && !leftChar.isNumber {
            left += 1;
            continue;
        }
        
        if !rightChar.isLetter && !rightChar.isNumber {
            right -= 1;
            continue;
        }
        
        if leftChar.lowercased() != rightChar.lowercased() {
            return false;
        }
        
        left += 1;
        right -= 1;
    }
    
    return true;
}

isPalindromeOptimised(s0)


//6. Invert Binary Tree

//Definition for a binary tree node.

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }}

func invertTree(_ root: TreeNode?) -> TreeNode? {
    guard let root = root else { return nil }
    
    // Recursively invert the left and right subtrees
    let left = invertTree(root.left)
    let right = invertTree(root.right)
    
    // Swap the left and right subtrees
    root.left = right
    root.right = left
    
    return root
}


//root = [4,2,7,1,3,6,9]

let root = TreeNode(2, TreeNode(1), TreeNode(3))

print(invertTree(root)!)


//7.  Valid Anagram

func isAnagram(_ s: String, _ t: String) -> Bool {
    
    guard s.count == t.count else { return false }
    
    var map = [Character: Int]()
    
    for char in s {
        if let mapChar = map[char] {
            map[char]! += 1
        } else {
            map[char] = 1
        }
    }
    
    for ch in t {
        if map.keys.contains(ch) {
            map[ch]! -= 1
        }
        if map[ch] == 0 {
            map.removeValue(forKey: ch)
        }
    }
    
    return map.isEmpty && (s.count == t.count)
}

let s12 = "anagram", t12 = "nagaramx"

isAnagram(s12, t12)

//8. Binary Search

func search(_ nums: [Int], _ target: Int) -> Int {
    var start = 0
    var end = nums.count - 1
    
    while start <= end {
        var mid = start + (end-start)/2
        
        if target == nums[mid] {
            return mid
        } else if target < nums[mid] {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    return -1
}

let nums13 = [-1,0,3,5,9,12], target13 = 9

search(nums13, target13)

// 9. Flood Fill

func floodFill(_ image: inout [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
    let originalColor = image[sr][sc]
    if originalColor == newColor {
        return image
    }
    dfs(&image, sr, sc, originalColor, newColor)
    return image
}

func dfs(_ image: inout [[Int]], _ r: Int, _ c: Int, _ originalColor: Int, _ newColor: Int) {
    let rows = image.count
    let cols = image[0].count
    
    if r < 0 || r >= rows || c < 0 || c >= cols || image[r][c] != originalColor {
        return
    }
    
    image[r][c] = newColor
    
    dfs(&image, r + 1, c, originalColor, newColor)
    dfs(&image, r - 1, c, originalColor, newColor)
    dfs(&image, r, c + 1, originalColor, newColor)
    dfs(&image, r, c - 1, originalColor, newColor)
}

// Example usage:
var image1 = [[1,1,1],[1,1,0],[1,0,1]]
let sr1 = 1
let sc1 = 1
let color1 = 2

print(floodFill(&image1, sr1, sc1, color1)) // Output: [[2,2,2],[2,2,0],[2,0,1]]

var image2 = [[0,0,0],[0,0,0]]
let sr2 = 0
let sc2 = 0
let color2 = 0

print(floodFill(&image2, sr2, sc2, color2)) // Output: [[0,0,0],[0,0,0]]


// 10.  Lowest Common Ancestor of a Binary Search Tree

// 11. Balanced Binary Tree

func isBalanced(_ root: TreeNode?) -> Bool {
    return checkHeight(root) != -1
}

func checkHeight(_ node: TreeNode?) -> Int {
    guard let node = node else { return 0 } //BC
    
    let leftHeight = checkHeight(node.left) //Hypothesis
    let rightHeight = checkHeight(node.right)// hypothesis
    
    if leftHeight == -1 || rightHeight == -1 || abs(leftHeight - rightHeight) > 1 { //induction
        return -1
    }
    
    return 1 + max(leftHeight, rightHeight)
}

// Example usage:
let root1 = TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))
print(isBalanced(root1)) // Output: true

let root2 = TreeNode(1, TreeNode(2, TreeNode(3, TreeNode(4), TreeNode(4)), TreeNode(3)), TreeNode(2))
print(isBalanced(root2)) // Output: false

let root3: TreeNode? = nil
print(isBalanced(root3)) // Output: true

// 12. Linked List Cycle

func hasCycle(_ head: ListNode?) -> Bool {
    if head?.next == nil { return false }
    
    var next = hasCycle(head?.next)
    
    return next
}


// Example usage:
let head1 = ListNode(3)
head1.next = ListNode(2)
head1.next?.next = ListNode(0)
head1.next?.next?.next = ListNode(-4)
head1.next?.next?.next?.next = head1.next // Connects to the 1st node

print(hasCycle(head1)) // Output: true

let head2 = ListNode(1)
head2.next = ListNode(2)
head2.next?.next = head2 // Connects to the 0th node

print(hasCycle(head2)) // Output: true

let head3 = ListNode(1)

print(hasCycle(head3)) 
