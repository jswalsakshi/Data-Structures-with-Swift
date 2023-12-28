import Foundation

// Sorted Array

func binarySearch(arr: [Int], num: Int) -> Int {
    var start = 0
    var end = arr.count - 1
    
    
    while (start <= end) {
        let mid = (start + end) / 2
        
        if arr[mid] == num {
            return mid
        } else if (arr[mid] > num)  {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    
    return -1
    
}

let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]

print(binarySearch(arr: arr, num: 4))

func countNegatives(_ grid: [[Int]]) -> Int {
      
      let m = grid[0].count
      let n = grid.count
      var r = n-1
      var c = 0
      var result = 0

      while r >= 0 && c<m {
          if grid[r][c] < 0 {
              r = r-1
              result = result + (m-c)
          } else {
              c = c+1
          }

      }
      return result

  }

    func targetIndices(_ nums: [Int], _ target: Int) -> [Int] {
        let sortedNums = nums.sorted()
        var left = 0, right = sortedNums.count - 1, result: [Int] = []
        //Binary Search
        while left <= right {
            let mid = ( left + right ) / 2
            if sortedNums[mid] < target {
                left = mid + 1
            } else if sortedNums[mid] > target {
                 right = mid - 1
            } else {
                result.append(mid)
                //creating new mid pointers
                var mid1 = mid - 1
                var mid2 = mid + 1
                //searching in both the directions of mid
                while mid1 >= 0 && sortedNums[mid1] == target { result.append(mid1) ; mid1 -= 1 }
                while mid2 < sortedNums.count && sortedNums[mid2] == target { result.append(mid2) ; mid2 += 1 }
                break
            }
        }
        //sorting in increasing order
        return result.sorted()
    }


let nums = [11,34,78,38,8,41,97,15,16,18,97,36,21,11,85,83,36,11,45,17,93,95,70,12,16,18,13,89,97,20,86,46,24,50,45,94,89,25,61,59,51,72,74,55,4,41,47,46,45,75,93,2,61,99,39,74,49,83,53,54,22,55,89,98,48,44,87,74,25]
let target = 45

print(targetIndices(nums, target))
