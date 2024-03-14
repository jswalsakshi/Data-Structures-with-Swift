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


