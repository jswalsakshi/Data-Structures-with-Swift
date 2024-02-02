import Foundation
//         0    1   2   3   4   5   6
let arr = [100, 80, 60, 70, 60, 75, 85]

// 1. for anyday, number of stock price which are smaller including the day itself
// next larger to left, Stack problem
// to compare we are using array's num but to get the ans we have to index, becoz we cant use count for every element
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

// index being used here becoz, we want to get length of valid paren

let s1 = "()(()))"

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

let s11 = "()(()))"
print(longestValidParentheses1(s1))



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

//func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//    guard let l1 = l1 else {
//        return l2
//    }
//
//    guard let l2 = l2 else {
//        return l1
//    }
//
//    if l1.val < l2.val {
//        l1.next = mergeTwoLists(l1.next, l2)
//        return l1
//    } else {
//        l2.next = mergeTwoLists(l1, l2.next)
//        return l2
//    }
//}
//
//func findnthSeq(n: Int) -> Int {
//    var seq = [1]
//
//    var nextNum = seq.last! + 1
//    var product = seq.last! * nextNum
//
//    for _ in 0..<n {
//        seq.append(product)
//        nextNum += 1
//        product *= nextNum
//    }
//
//    return seq[n-1]
//}
//
//func nthSmallestNumber(_ n: Int) -> Int {
//    var sequence = [2]  // Initialize the sequence with the first number (2)
//    var currentNumber = 3  // Start checking from the next number (3)
//
//    while sequence.count < n {
//        var isProduct = false
//
//        // Check if the current number is a product of consecutive numbers
//        for i in 2...currentNumber {
//            if currentNumber % i == 0 && currentNumber / i == (i - 1) {
//                isProduct = true
//                break
//            }
//        }
//
//        // If the current number is a product, add it to the sequence
//        if isProduct {
//            sequence.append(currentNumber)
//        }
//
//        currentNumber += 1
//    }
//
//    return sequence.last!
//}
//
//// Example usage:
//let nthNumber = nthSmallestNumber(10)
//print("The 5th smallest number in the sequence is: \(nthNumber)")
//
//
//// Sliding window where ws is the ptr.count
//// where que talks about substring and k is given
//
//func findAnagram(s: String, ptr: String) -> Int {
//    var arrStr = Array(s)
//    var mp = [Character: Int]()
//    var count = 0
//    var j = 0
//    var i = 0
//    var ans = 0
//
//    for ch in ptr {
//        if mp.keys.contains(ch) {
//            mp[ch] = mp[ch]! + 1
//        } else {
//            mp[ch] = 1
//            count += 1
//        }
//    }
//
//    while j < arrStr.count {
//        if mp.keys.contains(arrStr[j]) {
//            mp[arrStr[j]]! -= 1
//
//            if mp[arrStr[j]]! == 0 {
//                count -= 1
//            }
//        }
//
//        if j - i + 1 < ptr.count {
//            j += 1
//        }
//        else if j - i + 1 == ptr.count {
//            if count == 0 {
//                ans += 1
//            }
//
//            if mp.keys.contains(arrStr[i]) {
//                mp[arrStr[i]]! += 1
//
//                if mp[arrStr[i]]! > 0 {
//                    count += 1
//                }
//            }
//
//            i += 1
//            j += 1
//        }
//    }
//
//    return ans
//}
//
//// Example usage:
//let result = findAnagram(s: "aabaaabaa", ptr: "aaba")
//print(result)
//
//// Sliding window where ws is the the map.count
//// where que talks about substring and k is given
//
//func logestSubstringNoRepeatChar(s: String) -> Int {
//
//    var arrStr = Array(s)
//    var i = 0
//    var j = 0
//    var mp = [Character: Int]()
//    var mx = 0
//
//    while j < arrStr.count {
//
//        // calculation
//
//        if mp.keys.contains(arrStr[j]) {
//            mp[arrStr[j]]! += 1
//        } else {
//            mp[arrStr[j]] = 1
//        }
//
//        if mp.count > j-i+1 {
//            j += 1
//        } else if mp.count == j-i+1 {
//            mx = max(mx, j-i+1)
//            j += 1
//        } else {
//            while(mp.count < j-i+1) {
//                if mp.keys.contains(arrStr[i]) {
//                    mp[arrStr[i]]! -= 1
//                    if mp[arrStr[i]]! == 0 {
//                        mp.removeValue(forKey: arrStr[i])
//                    }
//                }
//                i += 1
//            }
//            j += 1
//        }
//    }
//    return mx
//}
//
//let s2 = "pwwkew"
//
//logestSubstringNoRepeatChar(s: s2)
//
//// Shortest Path in Binary Matrix
////BFS
//
//func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
//    let n = grid.count
//
//    if grid[0][0] == 1 && grid[n-1][n-1] == 1 {
//        return -1
//    }
//
//    let moves = [(-1, 0), (0, 1), (-1, 1), (1, 1),
//                 (0, -1), (1, 0), (1, -1), (-1, -1)]
//
//    var grid = grid
//    var queue = [(0,0)]
//    grid[0][0] = 1
//
//    while !queue.isEmpty {
//        let node = queue.removeFirst()
//        guard node != (n-1, n-1) else { return grid[n-1][n-1] }
//
//        for move in moves {
//            let possibleNext = (node.0 + move.0, node.1 + move.1)
//            guard possibleNext.0 >= 0, possibleNext.0 < n,
//                  possibleNext.1 >= 0, possibleNext.1 < n,
//                  grid[possibleNext.0][possibleNext.1] == 0  else { continue }
//            queue.append(possibleNext)
//            grid[possibleNext.0][possibleNext.1] = grid[node.0][node.1] + 1
//        }
//    }
//    return -1
//}
//
//let grid1 = [[0,0,0],[1,1,0],[1,1,0]]
//print(shortestPathBinaryMatrix(grid1))
//
//class MinStack {
//    var stack: [Int]
//
//    init() {
//        stack = [Int]()
//    }
//
//    func push(_ val: Int) {
//        self.stack.append(val)
//    }
//
//    func pop() {
//        self.stack.removeLast()
//    }
//
//    func top() -> Int {
//        return self.stack.last!
//    }
//
//    func getMin() -> Int {
//        return self.stack.min()!
//    }
//
//}
//
//var minStack = MinStack();
//minStack.push(-2);
//minStack.push(0);
//minStack.push(-3);
//minStack.getMin(); // return -3
//minStack.pop();
//minStack.top();    // return 0
//minStack.getMin(); // return -2
//
//
////class ListNode {
////    var val: Int
////    var next: ListNode?
////
////    init(_ val: Int) {
////        self.val = val
////        self.next = nil
////    }
////}
//
////func oddEvenList(_ head: ListNode?) -> ListNode? {
////    guard head != nil else {
////        return nil
////    }
////
////
////}
//
//func insertionSortList(_ head: ListNode?) -> ListNode? {
//    guard head != nil else {
//        return nil
//    }
//
//    let dummy = ListNode(0)
//    var curr = head
//
//    while curr != nil {
//        let next = curr?.next
//
//        // Find the correct position to insert
//        var prev = dummy
//        while prev.next != nil && prev.next!.val < curr!.val {
//            prev = prev.next!
//        }
//
//        // Insert the current node at the correct position
//        curr?.next = prev.next
//        prev.next = curr
//
//        // Move to the next node in the unsorted part of the list
//        curr = next
//    }
//
//    return dummy.next
//}
//
//// Example usage:
//let list1 = ListNode(4)
//list1.next = ListNode(2)
//list1.next?.next = ListNode(1)
//list1.next?.next?.next = ListNode(3)
//
//let sortedList1 = insertionSortList(list1)
//printList(sortedList1) // Output: 1 -> 2 -> 3 -> 4
//
//let list2 = ListNode(-1)
//list2.next = ListNode(5)
//list2.next?.next = ListNode(3)
//list2.next?.next?.next = ListNode(4)
//list2.next?.next?.next?.next = ListNode(0)
//
//let sortedList2 = insertionSortList(list2)
//printList(sortedList2) // Output: -1 -> 0 -> 3 -> 4 -> 5
//
//// Helper function to print the linked list
//func printList(_ head: ListNode?) {
//    var current = head
//    while let node = current {
//        print("\(node.val) -> ", terminator: "")
//        current = node.next
//    }
//    print("nil")
//}
//
////func predictTheWinner(_ nums: [Int]) -> Bool {
////
////    let n = nums.count
////    var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
////
////    for i in 0..<n {
////        dp[i][i] = nums[i]
////    }
////
////}
//
//let nums = [3,2,4], target = 6
//
//print(twoSum(nums, target))
//
//func fizzBuzz(n: Int) -> Void {
//    for i in 1...n {
//        if i%3 == 0 && i%5 == 0 {
//            print("FizzBuzz")
//        }else if i%3 == 0 {
//            print("Fizz")
//        }else if i%5 == 0 {
//            print("Buzz")
//        }else {
//            print(i)
//        }
//    }
//}
//
//fizzBuzz(n: 15)
//
//
//func findMinPrice(prices: [Int], m: Int) -> Int {
//    var sum = prices.reduce(0) { partialResult, price in
//        partialResult + price
//    }
//
//    var mn = Int.max
//
//    for price in prices {
//        let discount = price/2^m
//        mn = min(mn, sum - price + discount)
//    }
//
//    return mn
//}
//
//let prices = [2, 4, 12], m = 3
//
//print(findMinPrice(prices: prices, m: 2))
//
//
//// 75 Questions to practice
//// 1. 2 Sum
//
//func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//    var toggle = false
//    var result = [Int]()
//
//    if toggle == false {
//        for i in 0..<nums.count {
//            for j in (i+1)..<nums.count {
//                if nums[j] == target - nums[i] {
//                    result.append(i)
//                    result.append(j)
//                    toggle = true
//                    break
//                }
//            }
//        }
//    }
//    return result
//}
//
//let nums3 = [3,2,4], target3 = 6
//
//print(twoSum(nums3, target3))
//
//// 2.  Valid Parentheses
//
//func isValidPractice(_ s: String) -> Bool {
//    guard !s.isEmpty else { return false }
//
//    var data = [Character]()
//
//    for char in s {
//        if (char == "(" || char == "{" || char == "[") {
//            data.append(char)
//        } else {
//            if data.isEmpty {
//                return false
//            } else {
//                let top = data.removeLast()
//
//                switch char {
//                case ")":
//                    if top != "(" {
//                        return false
//                    }
//                case "]":
//                    if top != "[" {
//                        return false
//                    }
//                case "}":
//                    if top != "{" {
//                        return false
//                    }
//                default:
//                    return false
//                }
//            }
//        }
//    }
//    return data.isEmpty
//}
//
//let s4 = ""
//isValidPractice(s)
//
//// 3. Merge Two Sorted Lists
//
//func mergeTwoListsPractice(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
//    guard var list1 = list1  else { return list2 }
//    guard var list2 = list2 else { return list1 }
//
//    if list1.val > list2.val {
//        list2.next = mergeTwoListsPractice(list1.next, list2)
//        return list2
//    } else {
//        list1.next = mergeTwoListsPractice(list1, list2.next)
//        return list1
//    }
//}
//
////let list8 = [1,2,4], list9 = [1,3,4]
//
////4. Best Time to Buy and Sell Stock
//
//class Solution {
//    func maxProfit(_ prices: [Int]) -> Int {
//        var salePrice = -1
//        var ans = 0
//
//        for price in prices.reversed() {
//            if price >= salePrice { salePrice = price  }
//            else {
//                ans = max(ans, (salePrice - price))
//            }
//        }
//
//        return ans
//    }
//}
//
//// 5. Valid Palindrome
//
//func isPalindrome(_ s: String) -> Bool {
//    guard !s.isEmpty else { return true }
//
//    var inputString = s.replacingOccurrences(of: "[^a-zA-Z0-9]", with: "", options: .regularExpression)
//        .lowercased()
//
//
//    var outputString = String(inputString.reversed())
//
//    return inputString == outputString
//}
//
//let s0 = "A man, a plan, a canal: Panama"
//
//isPalindrome(s0)
//
//func isPalindromeOptimised(_ s: String) -> Bool {
//    let sArray = Array(s);
//    var left: Int = 0;
//    var right: Int = sArray.count - 1;
//
//    while left < right {
//        var leftChar: Character = sArray[left];
//        var rightChar: Character = sArray[right];
//
//        if !leftChar.isLetter && !leftChar.isNumber {
//            left += 1;
//            continue;
//        }
//
//        if !rightChar.isLetter && !rightChar.isNumber {
//            right -= 1;
//            continue;
//        }
//
//        if leftChar.lowercased() != rightChar.lowercased() {
//            return false;
//        }
//
//        left += 1;
//        right -= 1;
//    }
//
//    return true;
//}
//
//isPalindromeOptimised(s0)
//
//
////6. Invert Binary Tree
//
////Definition for a binary tree node.
//
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
//
//func invertTree(_ root: TreeNode?) -> TreeNode? {
//    guard let root = root else { return nil }
//
//    // Recursively invert the left and right subtrees
//    let left = invertTree(root.left)
//    let right = invertTree(root.right)
//
//    // Swap the left and right subtrees
//    root.left = right
//    root.right = left
//
//    return root
//}
//
//
////root = [4,2,7,1,3,6,9]
//
//let root = TreeNode(2, TreeNode(1), TreeNode(3))
//
//print(invertTree(root)!)
//
//
////7.  Valid Anagram
//
//func isAnagram(_ s: String, _ t: String) -> Bool {
//
//    guard s.count == t.count else { return false }
//
//    var map = [Character: Int]()
//
//    for char in s {
//        if let mapChar = map[char] {
//            map[char]! += 1
//        } else {
//            map[char] = 1
//        }
//    }
//
//    for ch in t {
//        if map.keys.contains(ch) {
//            map[ch]! -= 1
//        }
//        if map[ch] == 0 {
//            map.removeValue(forKey: ch)
//        }
//    }
//
//    return map.isEmpty && (s.count == t.count)
//}
//
//let s12 = "anagram", t12 = "nagaramx"
//
//isAnagram(s12, t12)
//
////8. Binary Search
//
//func search(_ nums: [Int], _ target: Int) -> Int {
//    var start = 0
//    var end = nums.count - 1
//
//    while start <= end {
//        var mid = start + (end-start)/2
//
//        if target == nums[mid] {
//            return mid
//        } else if target < nums[mid] {
//            end = mid - 1
//        } else {
//            start = mid + 1
//        }
//    }
//    return -1
//}
//
//let nums13 = [-1,0,3,5,9,12], target13 = 9
//
//search(nums13, target13)
//
//// 9. Flood Fill
//
//func floodFill(_ image: inout [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
//    let originalColor = image[sr][sc]
//    if originalColor == newColor {
//        return image
//    }
//    dfs(&image, sr, sc, originalColor, newColor)
//    return image
//}
//
//func dfs(_ image: inout [[Int]], _ r: Int, _ c: Int, _ originalColor: Int, _ newColor: Int) {
//    let rows = image.count
//    let cols = image[0].count
//
//    if r < 0 || r >= rows || c < 0 || c >= cols || image[r][c] != originalColor {
//        return
//    }
//
//    image[r][c] = newColor
//
//    dfs(&image, r + 1, c, originalColor, newColor)
//    dfs(&image, r - 1, c, originalColor, newColor)
//    dfs(&image, r, c + 1, originalColor, newColor)
//    dfs(&image, r, c - 1, originalColor, newColor)
//}
//
//// Example usage:
//var image1 = [[1,1,1],[1,1,0],[1,0,1]]
//let sr1 = 1
//let sc1 = 1
//let color1 = 2
//
//print(floodFill(&image1, sr1, sc1, color1)) // Output: [[2,2,2],[2,2,0],[2,0,1]]
//
//var image2 = [[0,0,0],[0,0,0]]
//let sr2 = 0
//let sc2 = 0
//let color2 = 0
//
//print(floodFill(&image2, sr2, sc2, color2)) // Output: [[0,0,0],[0,0,0]]
//
//
//// 10.  Lowest Common Ancestor of a Binary Search Tree
//
//// 11. Balanced Binary Tree
//
//func isBalanced(_ root: TreeNode?) -> Bool {
//    return checkHeight(root) != -1
//}
//
//func checkHeight(_ node: TreeNode?) -> Int {
//    guard let node = node else { return 0 } //BC
//
//    let leftHeight = checkHeight(node.left) //Hypothesis
//    let rightHeight = checkHeight(node.right)// hypothesis
//
//    if leftHeight == -1 || rightHeight == -1 || abs(leftHeight - rightHeight) > 1 { //induction
//        return -1
//    }
//
//    return 1 + max(leftHeight, rightHeight)
//}
//
//// Example usage:
//let root1 = TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))
//print(isBalanced(root1)) // Output: true
//
let root2 = TreeNode(1, TreeNode(2, TreeNode(3, TreeNode(4), TreeNode(4)), TreeNode(3)), TreeNode(2))
//print(isBalanced(root2)) // Output: false
//
//let root3: TreeNode? = nil
//print(isBalanced(root3)) // Output: true
//
//// 12. Linked List Cycle
//
//func hasCycle(_ head: ListNode?) -> Bool {
//    guard let head = head else { return false }
//
//    var slow = head
//    var fast = head
//
//    while fast.next != nil && fast.next?.next != nil {
//        slow = slow.next!
//        fast = (fast.next?.next)!
//
//        if slow === fast {
//            return true
//        }
//    }
//
//    return false
//}
//
//
//// Example usage:
//let head1 = ListNode(3)
//head1.next = ListNode(2)
//head1.next?.next = ListNode(0)
//head1.next?.next?.next = ListNode(-4)
//head1.next?.next?.next?.next = head1.next // Connects to the 1st node
//
//print(hasCycle(head1)) // Output: true
//
//let head2 = ListNode(1)
//head2.next = ListNode(2)
//head2.next?.next = head2 // Connects to the 0th node
//
//print(hasCycle(head2)) // Output: true
//
//let head3 = ListNode(1)
//
//print(hasCycle(head3))
//
////13. Implement Queue using Stacks
//
//class MyQueue {
//
//    var stack = [Int]()
//
//    init() {
//
//    }
//
//    func push(_ x: Int) {
//        stack.append(x)
//    }
//
//    func pop() -> Int {
//        var element: Int?
//        if !stack.isEmpty {
//            element = stack.removeFirst()
//        }
//        return element!
//    }
//
//    func peek() -> Int {
//        return stack.first!
//    }
//
//    func empty() -> Bool {
//        return stack.isEmpty
//    }
//}
// 14.  First Bad Version

//func firstBadVersion(_ n: Int) -> Int {
//    var left = 1
//    var right = n
//
//    while left < right {
//        let mid = left + (right - left) / 2
//        if isBadVersion(mid) {
//            right = mid
//        } else {
//            left = mid + 1
//        }
//    }
//
//    return left
//}


// 15. Ransom Note

//func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
//    var ranArr = Array(ransomNote)
//    var magArr = Array(magazine)
//    var mp = [Character: Int]()
//
//    // Construct character frequency map for ransomNote
//    for char in ranArr {
//        mp[char, default: 0] += 1
//    }
//
//    // Subtract frequencies of characters in magazine from ransomNote map
//    for char in magArr {
//        if let count = mp[char] {
//            mp[char] = count - 1
//            if mp[char] == 0 {
//                mp.removeValue(forKey: char)
//            }
//        }
//    }
//
//    return mp.isEmpty
//}
//
//let ransomNote = "aa"
//let magazine = "ab"
//print(canConstruct(ransomNote, magazine)) // Output: false
//
//// 16. Climbing Stairs
//
//func climbStairs(_ n: Int) -> Int {
//    if n <= 1 {
//           return 1
//       } // BC
//
//    var dp = Array(repeating: 0, count: n+1)
//
//    dp[0] = 1
//    dp[1] = 1
//
//    for i in 2...n {
//        dp[i] = dp[i-1] + dp[i-2]
//    }
//    return dp[n]
//}
//
//climbStairs(4)
//
//
//// 17. Longest Palindrome
//
//func longestPalindrome(_ s: String) -> Int {
//    // Create a dictionary to store character frequencies
//    var frequency = [Character: Int]()
//
//    // Count character frequencies
//    for char in s {
//        frequency[char, default: 0] += 1
//    }
//
//    var length = 0
//    var hasOddFrequency = false
//
//    // Calculate the length of the longest palindrome
//    for (_, count) in frequency {
//        length += count
//        if count % 2 != 0 {
//            length -= 1 // Exclude one character with odd frequency
//            hasOddFrequency = true
//        }
//    }
//
//    // If there's at least one character with odd frequency, add one to the length
//    if hasOddFrequency {
//        length += 1
//    }
//
//    return length
//}
//
//// Example usage:
//print(longestPalindrome("abccccdd")) // Output: 7
//print(longestPalindrome("cccc"))        // Output: 1
//
//// 18. Reverse Linked List
//
//func reverseList(_ head: ListNode?) -> ListNode? {
//    guard var head else { return nil }
//    var dummy: ListNode?
//    var current = head
//
//    while head.next != nil {
//        dummy?.next = current
//        current.next = head
//        head = current
//    }
//    return head
//}
//
//func reverseListRecursion(_ head: ListNode?) -> ListNode? {
//    guard let head else { return nil }
//    guard let nextNode = head.next else { return head } // BC
//
//    let reverseList = reverseListRecursion(nextNode) // hypothesis
//
//    nextNode.next = head // Induction
//    head.next = nil  // Induction
//
//    return reverseList
//
//}
//
//let list1 = ListNode(4)
//list1.next = ListNode(2)
//list1.next?.next = ListNode(1)
//list1.next?.next?.next = ListNode(3)
//
//print(reverseList(list1))

// 19. Majority Element

//func majorityElement(_ nums: [Int]) -> Int {
//
//    var maxVal = 0
//    var frequecy = [Int: Int]()
//
//    for num in nums {
//        frequecy[num, default: 0] += 1
//    }
//
//    for key in frequecy.keys {
//        if frequecy[key] == frequecy.values.max()! {
//            maxVal = key
//        }
//    }
//
//    return maxVal
//}
//
//let nums = [2,2,1,1,1,2,2]
//
//print(majorityElement(nums))
//
//// 20. Add Binary
//
//// 21. Diameter of Binary Tree
//
//func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
//    var diameter = 0
//    calculateDiameter(root, &diameter)
//    return diameter
//}
//
//func calculateDiameter(_ node: TreeNode?, _ diameter: inout Int) -> Int {
//    guard let node = node else { return 0 }
//
//    let leftHeight = calculateDiameter(node.left, &diameter)
//    let rightHeight = calculateDiameter(node.right, &diameter)
//
//    diameter = max(diameter, leftHeight + rightHeight)
//
//    return max(leftHeight, rightHeight) + 1
//}
//
//let root2 = TreeNode(1, TreeNode(2, TreeNode(3, TreeNode(4), TreeNode(4)), TreeNode(3)), TreeNode(2))
//diameterOfBinaryTree(root2)
//
//// 22. Middle of the Linked List
//
//func middleNode(_ head: ListNode?) -> ListNode? {
//    var slow = head
//    var fast = head
//
//    // Move fast pointer two steps ahead and slow pointer one step ahead
//    while fast != nil && fast?.next != nil {
//        slow = slow?.next
//        fast = fast?.next?.next
//    }
//
//    // When fast pointer reaches the end, slow pointer will be at the middle
//    return slow
//}
//
//let list1 = ListNode(4)
//list1.next = ListNode(2)
//list1.next?.next = ListNode(1)
//list1.next?.next?.next = ListNode(3)
//if let middle1 = middleNode(list1) {
//    print(middle1.val)
//}
//
//// 23. Maximum Depth of Binary Tree
//
//func maxDepth(_ root: TreeNode?) -> Int {
//    var depth = 0
//    calculateDepth(root, currentDepth: 1, maxDepth: &depth)
//    return depth
//}
//
//func calculateDepth(_ node: TreeNode?, currentDepth: Int, maxDepth: inout Int) {
//    guard let node = node else { return }
//
//    // Update maxDepth if currentDepth is greater
//    maxDepth = max(maxDepth, currentDepth)
//
//    // Recursively calculate depth for left and right subtrees
//    calculateDepth(node.left, currentDepth: currentDepth + 1, maxDepth: &maxDepth)
//    calculateDepth(node.right, currentDepth: currentDepth + 1, maxDepth: &maxDepth)
//}
//
//
//maxDepth(root2)
//
//
//// 24. Contains Duplicate
//
//func containsDuplicate(_ nums: [Int]) -> Bool {
//    var map = [Int: Int]()
//
//    for num in nums {
//        map[num, default: 0] += 1
//        if map[num]! > 1 {
//            return true
//        }
//    }
//    return false
//}
//
//let nums33 = [1,1,1,3,3,4,3,2,4,2]
//containsDuplicate(nums33)


// 25. Maximum Subarray

//func maxSubArray(_ nums: [Int]) -> Int {
//    var maxEndingHere = nums[0]
//    var maxSoFar = nums[0]
//
//    for i in 1..<nums.count {
//        maxEndingHere = max(nums[i], maxEndingHere + nums[i])
//        maxSoFar = max(maxSoFar, maxEndingHere)
//    }
//
//    return maxSoFar
//}
//
//// Example usage:
//print(maxSubArray([-2,1,-3,4,-1,2,1,-5,4])) // Output: 6
//print(maxSubArray([1]))                     // Output: 1
//print(maxSubArray([5,4,-1,7,8]))            // Output: 23
//
//// 26.  Insert Interval
//
//func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
//    var result = [[Int]]()
//    var i = 0
//
//    // Add intervals that are strictly before the new interval
//    while i < intervals.count && intervals[i][1] < newInterval[0] {
//        result.append(intervals[i])
//        i += 1
//    }
//
//    // Merge overlapping intervals with the new interval
//    var mergedInterval = newInterval
//    while i < intervals.count && intervals[i][0] <= mergedInterval[1] {
//        mergedInterval[0] = min(mergedInterval[0], intervals[i][0])
//        mergedInterval[1] = max(mergedInterval[1], intervals[i][1])
//        i += 1
//    }
//    result.append(mergedInterval)
//
//    // Add intervals that are strictly after the new interval
//    while i < intervals.count {
//        result.append(intervals[i])
//        i += 1
//    }
//
//    return result
//}
//
//func insertOptimised(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
//    var l = [[Int]](), r = [[Int]]()
//    var newInterval = newInterval
//
//    for interval in intervals {
//        if interval[1] < newInterval[0] {
//            l.append(interval)
//        } else if interval[0] > newInterval[1] {
//            r.append(interval)
//        } else {
//            newInterval = [min(interval[0], newInterval[0]), max(interval[1], newInterval[1])]
//        }
//    }
//    return l + [newInterval] + r
//}
//
//
//// Example usage:
//print(insert([[1,3],[6,9]], [2,5]))                     // Output: [[1,5],[6,9]]
//print(insertOptimised([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,8])) // Output: [[1,2],[3,10],[12,16]]
//
//
//// 27. 01 Matrix
//
//func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
//    guard !mat.isEmpty else { return [] } // Handle empty input matrix
//    let row = mat.count
//    let col = mat[0].count
//
//    var result = Array(repeating: Array(repeating: 0, count: col), count: row)
//
//    for i in 0..<row {
//        for j in 0..<col {
//            result[i][j] = mat[i][j] // Initialize result with values from mat
//        }
//    }
//
//    for i in 0..<row {
//        for j in 0..<col {
//            if result[i][j] != 0 {
//                result[i][j] = min(i > 0 ? result[i - 1][j] + 1 : Int.max / 2, j > 0 ? result[i][j - 1] + 1 : Int.max / 2)
//            }
//        }
//    }
//
//    for i in (0..<row).reversed() {
//        for j in (0..<col).reversed() {
//            if result[i][j] != 0 {
//                result[i][j] = min(result[i][j], i < row - 1 ? result[i + 1][j] + 1 : Int.max / 2, j < col - 1 ? result[i][j + 1] + 1 : Int.max / 2)
//            }
//        }
//    }
//
//    return result
//}
//
//// Example usage:
//let mat = [[0,0,0],[0,1,0],[1,1,1]]
//print(updateMatrix(mat))
//
//// 28.
//
//// 29. Longest Substring Without Repeating Characters
//
//func lengthOfLongestSubstring(_ s: String) -> Int {
//    var map = [Character: Int]()
//    var i = 0
//    var j = 0
//    var arrStr = Array(s)
//    var mx = 0
//
//    while (j < arrStr.count) {
//        map[arrStr[j], default: 0] += 1
//        if map.count > j - i + 1 {
//            j += 1
//        } else if ( map.count == j - i + 1 ) {
//            mx = max(mx, j - i + 1)
//            j += 1
//        } else {
//            while(map.count < j - i + 1) {
//                if map.keys.contains(arrStr[i]) {
//                    map[arrStr[i]]! -= 1
//                    if map[arrStr[i]]! == 0 {
//                        map.removeValue(forKey: arrStr[i])
//                    }
//                }
//                i += 1
//            }
//            j += 1
//        }
//    }
//    return mx
//}
//
//let s = "abcabcbb"
//lengthOfLongestSubstring(s)


// 30. 3Sum

func threeSum(_ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()
    let nums = nums.sorted() // Sort the array
    
    for i in 0..<nums.count {
        // Skip duplicates to avoid duplicate triplets
        if i > 0, nums[i] == nums[i - 1] {
            continue
        }
        
        var left = i + 1
        var right = nums.count - 1
        
        while left < right {
            let sum = nums[i] + nums[left] + nums[right]
            
            if sum == 0 {
                result.append([nums[i], nums[left], nums[right]])
                // Skip duplicates
                while left < right && nums[left] == nums[left + 1] {
                    left += 1
                }
                while left < right && nums[right] == nums[right - 1] {
                    right -= 1
                }
                left += 1
                right -= 1
            } else if sum < 0 {
                left += 1
            } else {
                right -= 1
            }
        }
    }
    
    return result
}

// Example usage:
let nums = [-1,0,1,2,-1,-4] // -4, -1, -1, 0, 1, 2
print(threeSum(nums)) // Output: [[-1,-1,2],[-1,0,1]]


// 31. Binary Tree Level Order Traversal

// For level order, we need to use queue

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else { return [] }
    
    var result = [[Int]]()
    var queue = [TreeNode]()
    queue.append(root)
    
    while !queue.isEmpty {
        var levelArr = [Int]()
        let levelSize = queue.count
        
        for _ in 0..<levelSize {
            let node = queue.removeFirst()
            levelArr.append(node.val)
            
            if let left = node.left {
                queue.append(left)
            }
            
            if let right = node.right {
                queue.append(right)
            }
        }
        
        result.append(levelArr)
    }
    
    return result
}


print(levelOrder(root2))


/* Depth-First Search (DFS) and Breadth-First Search (BFS) are two fundamental graph traversal algorithms used to explore or search a graph or tree data structure. Let's define each algorithm and provide a Swift implementation for both.
 
 Depth-First Search (DFS):
 DFS explores a graph by recursively visiting each vertex and its neighbors in depth-first manner, meaning it explores as far as possible along each branch before backtracking. */

// Define a graph as an adjacency list
typealias Graph = [Int: [Int]]

// Depth-First Search (DFS) implementation
func dfs(_ graph: Graph, _ start: Int, visited: inout Set<Int>) {
    
    guard !visited.contains(start) else { return }
    
    // Mark the current node as visited
    visited.insert(start)
    print("Visited node: \(start)")
    
    // Recursively visit neighbors
    if let neighbors = graph[start] {
        for neighbor in neighbors {
            dfs(graph, neighbor, visited: &visited)
        }
    }
}

// Example usage:
let graph: Graph = [
    0: [1, 2],
    1: [3, 4],
    2: [5],
    3: [],
    4: [],
    5: []
]

var visited = Set<Int>()
dfs(graph, 0, visited: &visited)

/* Breadth-First Search (BFS):
 BFS explores a graph by visiting all the neighbors of a vertex before moving on to the next level of vertices. */

// Breadth-First Search (BFS) implementation
func bfs(_ graph: Graph, _ start: Int) {
    var visited = Set<Int>()
    var queue = [start]
    
    while !queue.isEmpty {
        let current = queue.removeFirst()
        guard !visited.contains(current) else { continue }
        
        // Mark the current node as visited
        visited.insert(current)
        print("Visited node: \(current)")
        
        // Enqueue neighbors for exploration
        if let neighbors = graph[current] {
            queue.append(contentsOf: neighbors.filter { !visited.contains($0) })
        }
    }
}

// Example usage:
bfs(graph, 0)

// 32.

//Definition for a Node.
public class Node {
    public var val: Int
    public var neighbors: [Node?]
    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}

func cloneGraph(_ node: Node?) -> Node? {
    
    guard  let node = node else {
        return nil
    }
    
    var visited = [Int: Node]()
    
    return clone(node: node, visited: &visited)
    
}

private func clone(node: Node, visited: inout [Int: Node]) -> Node? {
    if let clonedNode = visited[node.val] {
        return clonedNode
    }
    
    let clonedNode = Node(node.val)
    visited[node.val] = clonedNode
    
    for neighbor in node.neighbors {
        clonedNode.neighbors.append(clone(node: neighbor!, visited: &visited))
    }
    
    return clonedNode
}

// 33.  Evaluate Reverse Polish Notation

// '+', '-', '*', and '/'.

func evalRPN(_ tokens: [String]) -> Int {
    var stack = [Int]()
    var result = 0
    
    for str in tokens {
        if let strNum = Int(str) {
            stack.append(strNum)
        } else {
            if stack.isEmpty {
                return result
            }
            let temp1 = stack.removeLast()
            let temp2 = stack.removeLast()
            switch str {
            case "+":
                let temp = temp2 + temp1
                stack.append(temp)
            case "-":
                let temp = temp2 - temp1
                stack.append(temp)
            case "*":
                let temp = temp2 * temp1
                stack.append(temp)
            case "/":
                let temp = temp2/temp1
                stack.append(temp)
             default:
                return result
            }
            
        }
        
    }
    
    return stack.last!
}

let tokens = ["4","3","-"]

print(evalRPN(tokens))

// 34. Course Schedule

//func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
//    if prerequisites.count != numCourses - 1 {
//        return false
//    }
//    
//    
//}
