import Foundation

func findMaxSubarray(arr: [Int], ws: Int) -> Int {
    
    let size = arr.count - 1
    var i = 0
    var j = 0
    var sum = 0
    var maximum = 0
    
    while j < size {
        
        sum = sum + arr[j]
        
        if (j-i+1) < ws {
            j = j+1
        } else if (j-i+1) == ws {
            maximum = max(maximum, sum)
            sum = sum - arr[i]
            i = i + 1
            j = j + 1
        }
    }
    return maximum
}

let arr = [2, 5, 1, 8, 2, 9, 1]

print(findMaxSubarray(arr: arr, ws: 3))


func findFirstNegativeNumInSizeK(arr: [Int], k: Int) -> [Int] {
    
    let size = arr.count
    var i = 0
    var j = 0
    var list: [Int] = [Int]()
    var output: [Int] = [Int]()
    
    while j < size {
        
        if arr[j] < 0 {
            list.append(arr[j])
        }
        
        if (j - i + 1) < k {
            j = j + 1
        }
        else if (j-i+1) == k {
            
            if list.isEmpty {
                output.append(0)
            } else {
                output.append(list.first!)
            }
            
            if arr[i] == list.first {
                list.removeFirst()
            }
            
            i = i + 1
            j = j + 1
        }
    }
    
    return output
}

let arr1 = [12, -1, -7, 8, -15, 30, 16, 28]

print(findFirstNegativeNumInSizeK(arr: arr1, k: 3))

func findMaxInWS(arr: [Int], k: Int) -> [Int] {
    let size = arr.count
    var i = 0
    var j = 0
    var list: [Int] = [Int]()
    var output: [Int] = [Int]()
    
    while j < size {
        
        while (!list.isEmpty && arr[j] > list.last!) {
            list.removeLast()
        }
        
        list.append(arr[j])
        
        if (j - i + 1) < k {
            j = j + 1
        }
        else if (j-i+1) == k {
            
            output.append(list.first!)
            
            i = i + 1
            j = j + 1
        }
    }
    return output
}

let arr2 = [1, 3, -1, -3, 5, 3, 6, 7]
print(findMaxInWS(arr: arr2, k: 3))

func findMaxSizeWindow(arr: [Int], k: Int) -> Int {
    let size = arr.count
    var i = 0
    var j = 0
    var sum = 0
    var maximum = 0
    
    while j < size {
       
        sum = sum + arr[j]
        
        if sum < k {
            j = j + 1
        } else if sum == k {
            maximum = max(maximum, j-i+1)
            j = j + 1
        } else {
            while (sum > k) {
                sum = sum - arr[i]
            }
            i = i + 1
            j = j + 1
        }
        
        
    }
    
    return maximum
}

let arr3 = [4, 1, 1, 1, 2, 3, 5]
print(findMaxSizeWindow(arr: arr3, k: 9))

func longestSubstringWithSizeK(arr: String, k: Int) -> Int {
    let charArr = Array(arr)
    let size = arr.count
    var i = 0
    var j = 0
    var map = [Character: Int]()
    var maximum = 0
    
    while(j < size) {
        // Calculation
        map[charArr[j], default: 0] += 1
        
        // If the number of distinct characters is smaller than k
        if map.count < k {
            j = j + 1
        }
        // If the number of distinct characters is exactly k
        else if map.count == k {
            maximum = max(maximum, j - i + 1)
            j = j + 1
        }
        // If the number of distinct characters is larger than k
        else {
            while (map.count > k) {
                map[charArr[i]] = map[charArr[i]]! - 1
                if map[charArr[i]] == 0 {
                    map[charArr[i]] = nil
                }
                i = i + 1
            }
            j = j + 1
        }
    }
    
    return maximum
}

let arr5 = "aabacbebebe"
print(longestSubstringWithSizeK(arr: arr5, k: 2))

func findMinSizeWindowContainSubstring(arr: String, k: String) -> Int {
    let charArr = Array(arr)
    let kCharArr = Array(k)
    let size = arr.count
    var i = 0
    var j = 0
    var map = [Character: Int]()
    var minimum = Int.min
    var count = 0
    
    for ch in kCharArr {
        map[ch, default: 0] += 1
    }
    
    count = map.count
    
    while j < size {
        
        if map.keys.contains(charArr[j]) {
            map[charArr[j]]! -= 1
            
            if map[charArr[j]] == 0 {
                count = count - 1
            }
        }
        
        if count == 0 {
            return min(minimum, j - i + 1)
        }
    }
    
    return minimum
}
