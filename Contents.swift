import Foundation

func countOddEvenSubarrays(_ arr: [Int]) -> Int {
    var prefixSum = 0
    var oddCounts = [0: 1] // Initialize with 0:1 for handling subarrays starting from the beginning
    var evenCount = 0
    var totalSubarrays = 0
    
    for num in arr {
        prefixSum += num.isMultiple(of: 2) ? -1 : 1 // Increment if odd, decrement if even 1, 0
        evenCount += num.isMultiple(of: 2) ? 1 : 0 // Increment even count if even number 1, 1
        
        totalSubarrays += oddCounts[prefixSum, default: 0] // ts = 1+0 = 1
        oddCounts[prefixSum, default: 0] += 1 // [1: 2]
    }
    
    return totalSubarrays
}

// Example usage
let arr = [4, 5, 5, 5] // [1, -1, -1, -1]
print(countOddEvenSubarrays(arr)) // Output: 1


func isNextCharInSequence(_ s1: String, _ s2: String) -> Bool {
    // Iterate through each character pair of s1 and s2
    for (char1, char2) in zip(s1, s2) {
        // Calculate ASCII values for characters
        let ascii1 = Int(char1.asciiValue!)
        let ascii2 = Int(char2.asciiValue!)
        
        // Handle special case for 'z' being next in sequence for 'a'
        if ascii1 == 122 && ascii2 == 97 {
            continue
        }
        
        // Check if the character in s2 is the next character in sequence after s1
        if ascii2 != ascii1 + 1 {
            return false
        }
    }
    return true
}

// Example usage:
let s1 = "ack"
let s2 = "bdl"

let result = isNextCharInSequence(s1, s2)
print(result)  // Output: true


// 51. Spiral Matrix

func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    
    guard !matrix.isEmpty else { return [] }
    
    var result = [Int]()
    var top = 0, bottom = matrix.count - 1
    var left = 0, right = matrix[0].count - 1
    
    while top <= bottom && left <= right {
        // Traverse top boundary
        for i in left...right {
            result.append(matrix[top][i])
        }
        top += 1
        
        // Traverse right boundary
        if top <= bottom {
            for i in top...bottom {
                result.append(matrix[i][right])
            }
            right -= 1
        }
        
        // Traverse bottom boundary
        if left < right && top <= bottom {
            for i in (left...right).reversed() {
                result.append(matrix[bottom][i])
            }
            bottom -= 1
        }
        
        // Traverse left boundary
        if top < bottom && left <= right {
            for i in (top...bottom).reversed() {
                result.append(matrix[i][left])
            }
            left += 1
        }
    }
    
    return result
}

// Example usage:
let matrix1 = [[1,2,3],[4,5,6],[7,8,9]]
print(spiralOrder(matrix1)) // Output: [1,2,3,6,9,8,7,4,5]

let matrix2 = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
print(spiralOrder(matrix2)) // Output: [1,2,3,4,8,12,11,10,9,5,6,7]


// 52. Subsets

func subsets(_ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()
    
    for num in nums {
        
    }
    
    return result
}
