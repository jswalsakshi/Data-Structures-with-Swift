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

func majorityElement(_ nums: [Int]) -> Int? {
    
    let majority = Int(ceil(Double(nums.count) / 2))
    var mp = [Int: Int]()
    var mx = 0
    var majorityElement: Int?
    
    for i in 0..<nums.count {
        if let count = mp[nums[i]] {
            mp[nums[i]] = count + 1
        } else {
            mp[nums[i]] = 1
        }
        
        if let currentCount = mp[nums[i]], currentCount > mx {
            mx = currentCount
            majorityElement = nums[i]
        }
    }
    
    if let majorityElement = majorityElement, mx >= majority {
        return majorityElement
    } else {
        return 1 // or any other appropriate value indicating no majority element
    }
}

let arr = [2, 2, 1, 1, 1, 2, 2]

if let result = majorityElement(arr) {
    print(result)
} else {
    print("No majority element")
    
}


func majorityElement1(_ nums: [Int]) -> Int {
    var candidate: Int?
    var count = 0
    
    for num in nums {
        if count == 0 {
            candidate = num
        }
        
        count += (num == candidate) ? 1 : -1
    }
    
    // Verify if the candidate is a majority element
    let majorityCount = nums.reduce(0) { $1 == candidate ? $0 + 1 : $0 }
    
    return majorityCount > nums.count / 2 ? candidate! : -1
}


print(majorityElement1(arr))

