
func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
    
    var dp = Array(repeating: Array(repeating: -1, count: text2.count + 1), count: text1.count + 1)
    
    let text1Length = text1.count
    let text2Lenght = text2.count
    let char1 = Array(text1)
    let char2 = Array(text2)
    
    if dp[text1Length][text2Lenght] !=  -1 {
        return dp[text1Length][text2Lenght]
    }
    
    return lcs(char1, char2, text1Length, text2Lenght, &dp)
    
}

private func lcs(_ char1: [Character], _ char2: [Character], _ m: Int, _ n: Int, _ dp: inout [[Int]]) -> Int {
    
    for i in 0...m {
        for j in 0...n {
            if(i == 0 || j == 0) {
                dp[i][j] = 0
            }
        }
    }
    
    for i in 1...m {
        for j in 1...n {
            if ( char1[i - 1]) == char2[j - 1] {
                dp[i][j] = (1 + dp[i-1][j-1])
            }
            else {
                dp[i][j] = max(dp[i][j-1], dp[i-1][j])
            }
        }
    }
    return dp[m][n]
}

let x = "abcf"
let y = "abcdaf"

longestCommonSubsequence(x, y)
