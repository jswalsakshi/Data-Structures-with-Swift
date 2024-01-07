import Foundation

// Question 1

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    
    var result = [Int]()
    result.reserveCapacity(m + n)
    
    var cur1 = 0
    var cur2 = 0
    
    // Merge the two sorted arrays into the result array
    while cur1 < m && cur2 < n {
        if nums1[cur1] < nums2[cur2] {
            result.append(nums1[cur1])
            cur1 += 1
        } else {
            result.append(nums2[cur2])
            cur2 += 1
        }
    }
    
    // Add the remaining elements from nums1 (if any)
    while cur1 < m {
        result.append(nums1[cur1])
        cur1 += 1
    }
    
    // Add the remaining elements from nums2 (if any)
    while cur2 < n {
        result.append(nums2[cur2])
        cur2 += 1
    }
    
    // Copy the merged result back to nums1
    nums1 = result
}

var nums1 = [1, 2, 3, 0, 0, 0]
let m = 3
let nums2 = [2, 5, 6]
let n = 3

print(merge(&nums1, m, nums2, n))

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    if nums.isEmpty {
        return 0
    }
    
    var indexToPlace = 0
    
    for i in 0..<nums.count {
        if nums[i] != val {
            nums[indexToPlace] = nums[i]
            indexToPlace += 1
        }
    }
    
    nums.removeLast(nums.count - indexToPlace) // Remove the excess elements
    
    return nums.count
}

var num1 = [0, 1, 2, 2, 3, 0, 4, 2]
let val = 2

print(removeElement(&num1, val))

func removeDuplicates(_ nums: inout [Int]) -> Int {
    
    if nums.count == 1 {
        return 1
    }
    
    var count = 0
    var indexToPlace = 1
    
    for i in 1..<nums.count {
        if nums[i] != nums[count] {
           nums[indexToPlace] = nums[i]
            count = count + 1
            indexToPlace = indexToPlace + 1
        } else {
            count = count + 2
            if nums[i] == nums[count] {
                indexToPlace = indexToPlace + 1
            }
        }
    }
    
}

