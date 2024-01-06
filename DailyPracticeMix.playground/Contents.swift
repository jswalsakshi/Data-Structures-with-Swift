import Foundation

//func lengthOfLongestSubstring(_ s: String) -> Int {
//    
//    var start = 0
//    var end = s.count - 1
//    var map = [Character: Int]()
//    var sArr = Array(s)
//    var mx = Int.min
//    
//    let ws = end - start + 1
//    
//    while start < end {
//        if map.count < ws {
//            while map.count < ws {
//                
//            }
//        } else if map.count == ws {
//            
//        } else {
//            
//        }
//    }
//    
//}

let s = "aab"
let s1 = "pwwkew"

//print(lengthOfLongestSubstring(s))


//func eggDropping1(e: Int, f: Int) -> Int {
//
//    var mn = Int.max
//    var temp = 0
//
//    if e == 0 || e == 1 {
//        return f
//    }
//
//    if f == 0 || f == 1 {
//        return f
//    }
//
//    for k in 1...f {
//       temp = 1 + max(eggDropping(e: e-1, f: k-1), eggDropping(e: e, f: k-f))
//        mn = min(mn, temp)
//    }
//
//    return mn
//}

//eggDropping1(e: 3, f: 5)

func eggDropping(e: Int, f: Int) -> Int {
    var mn = Int.max
    var temp = 0
    
    if e == 0 || e == 1 {
        return f
    }
    
    if f == 0 || f == 1 {
        return f
    }
    
    for k in 1...f {
        temp = 1 + max(eggDropping(e: e-1, f: k-1), eggDropping(e: e, f: f-k))
        mn = min(mn, temp)
    }
    
    return mn
}

let result = eggDropping(e: 3, f: 5)
print(result)


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
    }
}
//func maxPathSum(_ root: TreeNode?) -> Int {
//    
//    var left = Int.min
//    var right = Int.min
//    var res = Int.min
//    
//    if root == nil {
//        return 0
//    }
//    
//    left = solve(root?.left, res: &res)
//    right = solve(root?.right, res: &res)
//    
//     func solve(_ root: TreeNode?, res: inout Int) -> Int {
//        
//        var temp = Int.min
//        var ans = Int.min
//        
//         temp = max(max(left, right) + root!.val, root!.val)
//         ans = max(temp, left + right + root!.val)
//         
//         res = max(res, ans)
//         
//         return res
//    }
//    
//    return res
//}
//
//let root = TreeNode(1, TreeNode(2), TreeNode(3))
//
//maxPathSum(root)


func maxPathSum(_ root: TreeNode?) -> Int {
    
    var res = Int.min
    
    func solve(_ root: TreeNode?, res: inout Int) -> Int {
        if root == nil {
            return 0
        }
        
        let left = max(0, solve(root?.left, res: &res))
        let right = max(0, solve(root?.right, res: &res))
        
        let temp = max(left, right) + root!.val
        let ans = max(temp, left + right + root!.val)
        
        res = max(res, ans)
        
        return temp
    }
    
    _ = solve(root, res: &res)
    
    return res
}

let root1 = TreeNode(1, TreeNode(2), TreeNode(3))

let result1 = maxPathSum(root1)
print(result1)





