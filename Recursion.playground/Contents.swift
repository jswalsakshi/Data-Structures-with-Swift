import Foundation

//func solve(n: Int, k: Int) -> Int {
//    
//    let mid = Int(pow(2, Double(n-1)))
//    
//    if n == 1 && k == 1 {
//        return 0
//    } else if (k <= mid) {
//        return solve(n: n-1, k: k)
//    } else {
//        return solve(n: n-1, k: k-mid)
//    }
//}
//
//func solveAndReturnBinaryOutput(n: Int, k: Int) -> Int {
//    return solve(n: n, k: k) == 0 ? 0 : 1
//}
//
//let result = solveAndReturnBinaryOutput(n: 3, k: 4)
//print(result)
//
//func towerOfHanoi(s: Int, d: Int, h: Int, n: Int) {
//    if (n == 1) {
//        print("Move disk 1 from peg \(s) to peg \(d)")
//        return
//    }
//    
//    towerOfHanoi(s: s, d: h, h: d, n: n-1)
//    print("Move disk \(n) from peg \(s) to peg \(d)")
//    towerOfHanoi(s: h, d: d, h: s, n: n-1)
//}
//
//print(towerOfHanoi(s: 1, d: 2, h: 3, n: 3))


func powerSubsetwSpace(ip: String) {
    
    var arrIp = Array(ip)
    var op: [Character] = []
    
    op.append(arrIp.first!)
    arrIp.removeFirst()
    
    solveTheSet(ip: arrIp, op: op)
    
}

func solveTheSet(ip: [Character], op: [Character]) {
    
    if ip.isEmpty {
        let ans = String(op)
        print(ans)
        return
    }
    
    var op1 = op
    var op2 = op
    var ip = ip
    
    op1.append("_")
    op1.append(ip.first!)
    op2.append(ip.first!)
    ip.removeFirst()
    
    solveTheSet(ip: ip, op: op1)
    solveTheSet(ip: ip, op: op2)
}

//powerSubsetwSpace(ip: "abc")

func powerSubset1(ip: String) {
    var arrIp = Array(ip)
    var op: [Character] = [] // Initialize op as an empty array of characters
    var ans: Set<String> = Set() // Use a Set to store unique subsets
    
    solveTheSet1(ip: arrIp, op: &op, ans: &ans)
    
    ans.sorted { s1, s2 in
        s1 < s2
    }
    print(ans)
}

func solveTheSet1(ip: [Character], op: inout [Character], ans: inout Set<String>) {
    if ip.isEmpty {
        let subset = String(op) // Convert the subset to a String
        ans.insert(subset) // Add the subset to the Set
        return
    }
    
    // Include the first character from ip in the current subset
    var op1 = op
    op1.append(ip.first!)
    var ip1 = ip
    ip1.removeFirst()
    solveTheSet1(ip: ip1, op: &op1, ans: &ans)
    
    // Exclude the first character from ip in the current subset
    var op2 = op
    var ip2 = ip
    ip2.removeFirst()
    solveTheSet1(ip: ip2, op: &op2, ans: &ans)
}

//powerSubset1(ip: "AAB")




func alphaNumeric(ip: String) {
    var arrIp = Array(ip)
    var op: [Character] = [] // Initialize op as an empty array of characters
    var ans: [Character] = []  // Use a Set to store unique subsets
    
    solveAlpha(ip: arrIp, op: &op, ans: &ans)
    
    print(ans)
}

func solveAlpha(ip: [Character], op: inout [Character], ans: inout [Character]) {
    
    if ip.isEmpty {
        let subset = String(op) // Convert the subset to a String
        //ans.append(subset) // Add the subset to the Set
        return
    }
    
    
}


func knapsack(wt: [Int], value: [Int], W: Int, n: Int) -> Int {
    
    var output = 0
    
    if (W == 0 || n == 0) {
        return 0
    }
    if (wt[n-1] > W) {
        output = knapsack(wt: wt, value: value, W: W, n: n-1)
    } else {
        output = max(value[n-1] + knapsack(wt: wt, value: value, W: W - wt[n-1], n: n-1),
                     knapsack(wt: wt, value: value, W: W, n: n-1))
    }
    return output
}

let wt = [1, 3, 4, 5]
let value = [1, 4, 5, 7]
let W = 5

print(knapsack(wt: wt, value: value, W: W, n: wt.count))


func knapSackDP(wt: [Int], value: [Int], W: Int, n: Int) -> Int {
    
    var dp: [[Int]] = Array(repeating: Array(repeating: -1, count: W + 1), count: n + 1)
    
    for i in 0..<(n + 1) {
        for j in 0..<(W + 1) {
            
            if i == 0 || j == 0 {
                dp[i][j] = 0
            } else if wt[i - 1] <= j {
                dp[i][j] = max(value[i-1] + dp[i-1][j - wt[i-1]],
                               dp[i-1][j])
            } else {
                dp[i][j] = dp[i-1][j]
            }
        }
    }
    return dp[n][W]
}



print(knapSackDP(wt: wt, value: value, W: W, n: wt.count))
