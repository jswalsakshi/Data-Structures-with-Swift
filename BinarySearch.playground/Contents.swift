import Foundation

func binarySearch(arr: [Int], num: Int) -> Int {
    var start = 0
    var end = arr.count - 1
    
    while start <= end {
        
        var mid = (start + end)/2
        
        if num == arr[mid] {
            return 0
        } else if num > arr[mid] {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    
    var min1 = abs(arr[start] - num)
    min1 = min(min1, abs(arr[end] - num))
    
    return min1
}

let arr = [1, 2, 3, 6, 10, 15]
print(binarySearch(arr: arr, num: 12))

func numOfTimeArraySorted(arr: [Int]) -> Int {
    
    var start = 0
    var end = arr.count - 1
    let n = arr.count
    
    while start <= end {
        
        if arr[start] <= arr[end] {
            return start
        }
        
        let mid = (start + end)/2
        
        let next = (mid + 1) % n
        let prev = (mid + n - 1) % n
        
        if arr[mid] <= arr[next] && arr[mid] <= arr[prev] {
            return mid
        }
        else if arr[start] <= arr[mid] {
            start = mid + 1
        }
        else {
            end = mid - 1
        }
    }
    return -1
}

let arr1 = [11, 12, 15, 18, 2, 5, 6, 8]

print(numOfTimeArraySorted(arr: arr1))

func numOfTimeArrayRotated(arr: [Int]) -> Int {
    
    var start = 0
    var end = arr.count - 1
    let n = arr.count
    
    while start <= end {
        if arr[start] <= arr[end] {
            return start
        }
        
        let mid = (start + end) / 2
        let next = (mid + 1) % n
        let prev = (mid + n - 1) % n
        
        if arr[mid] <= arr[next] && arr[mid] <= arr[prev] {
            return mid
        }
        else if arr[start] <= arr[mid] {
            start = mid + 1
        }
        else {
            end = mid - 1
        }
    }
    return -1
}

let arr2 = [11, 12, 15, 18, 2, 5, 6, 8]

print(numOfTimeArrayRotated(arr: arr2)) // Output: 4

//func findElementedinRotatedSortedArr(start: Int, end: Int, arr: [Int], element: Int) -> Int {
//
//    if start > end {
//        return -1
//    }
//
//    var n = arr.count
//
//    while start <= end {
//
//        let mid = (start + end) / 2
//        let next = (mid + 1) % n
//        let prev = (mid + n - 1) % n
//
//        if element == arr[mid] {
//            return mid
//        }
//        else if element < arr[mid] {
//            findElementedinRotatedSortedArr(start: 0, end: prev, arr: arr, element: element)
//        }
//        else {
//            findElementedinRotatedSortedArr(start: next, end: end, arr: arr, element: element)
//        }
//    }
//    return -1
//}
//
//findElementedinRotatedSortedArr(start: 0, end: (arr2.count - 1), arr: arr, element: 15)

//func findElementNearlySortedArray(arr: [Int], element: Int) -> Int {
//
//    var start = 0
//    var end = arr.count - 1
//
//    if start > end {
//        return -1
//    }
//
//    while start <= end {
//        var mid = start - (start - end)/2
//
//        if (element == arr[mid]) {
//            return mid
//        }
//        else if (start < mid - 1) && (element == arr[mid - 1]) {
//            return mid - 1
//        }
//        else if (mid + 1 >= end) && (element == arr[mid + 1]) {
//            return mid + 1
//        }
//        else if (start > mid - 2) && (element < arr[mid]) {
//            end = mid - 2
//        }
//        else if (mid + 2 > end) && (element < arr[mid]) {
//            start = mid + 2
//        }
//        else {
//            return -1
//        }
//    }
//    return -1
//}

func findElementNearlySortedArray(arr: [Int], element: Int) -> Int {
    var start = 0
    var end = arr.count - 1
    
    while start <= end {
        let mid = (start + end) / 2
        
        if element == arr[mid] {
            return mid
        } else if mid > start && element == arr[mid - 1] {
            return mid - 1
        } else if mid < end && element == arr[mid + 1] {
            return mid + 1
        } else if element < arr[mid] {
            end = mid - 2  // Update 'end' to search the left subarray
        } else {
            start = mid + 2  // Update 'start' to search the right subarray
        }
    }
    
    return -1
}

let arr3 = [5, 10, 30, 20, 40]
print(findElementNearlySortedArray(arr: arr3, element: 40))

func findFloorOfSortedArray(arr: [Int], element: Int) -> Int {
    var start = 0
    var end = arr.count - 1
    var res = -1
    
    while start <= end {
        let mid = (start + end) / 2
        
        if element == arr[mid] {
            return arr[mid]
        } else if element < arr[mid] {
            end = mid - 1
        } else {
            res = arr[mid]
            start = mid + 1
        }
    }
    
    return res
}

let arr4 = [1, 2, 3, 4, 8, 10, 10, 19]
print(findFloorOfSortedArray(arr: arr4, element: 7))

func findCeilOfSortedArray(arr: [Character], element: Character) -> Character {
    
    var start = 0
    var end = arr.count - 1
    var res: Character = Character("z")
    
    while start <= end {
        
        var mid = (start + end)/2
        
        if element == arr[mid] {
            start = mid + 1
        } else if element > arr[mid] {
            start = mid + 1
        } else {
            res = arr[mid]
            end = mid - 1
        }
    }
    
    return res
}

let arr5 = [Character("a"), Character("b"), Character("f"), Character("h")]


findCeilOfSortedArray(arr: arr5, element: Character("c"))

func findFirstIndexOfOne(arr: [Int], element: Int) -> Int {

    var start = 0
    var end = 1

    while end < arr.count && element > arr[end] {
        start = end
        end = (end * 2)
    }

    return binarySearchFirstOcc(arr: arr, element: element, start: start, end: end)
}

func binarySearchFirstOcc(arr: [Int], element: Int, start: Int, end: Int) -> Int {

    var start = start
    var end = end
    var res = -1

    while start <= end {
        var mid = (start + end)/2
        if element == arr[mid] {
            res = mid
            end = mid - 1
        } else if element < arr[mid] {
            end = mid - 1
        } else {
            start = mid + 1
        }

    }

    return res
}

//func findFirstIndexOfElement(arr: [Int], element: Int) -> Int {
//    var start = 0
//    var end = 1
//
//    // Find the range where the element might exist
//    while end < arr.count && element > arr[end] {
//        start = end
//        end *= 2
//    }
//
//    return binarySearchFirstOcc(arr: arr, element: element, start: start, end:end)
//}
//
//func binarySearchFirstOcc(arr: [Int], element: Int, start: Int, end: Int) -> Int {
//    var start = start
//    var end = end
//    var res = -1
//
//    while start <= end {
//        let mid = (start + end) / 2
//        if element == arr[mid] {
//            res = mid
//            end = mid - 1  // Continue searching on the left side for the first occurrence
//        } else if element < arr[mid] {
//            end = mid - 1
//        } else {
//            start = mid + 1
//        }
//    }
//
//    return res
//}

let arr7 = [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 2]
print(findFirstIndexOfOne(arr: arr7, element: 2))

func peakElement(arr: [Int]) -> Int {
    
    var start = 0
    var end = arr.count - 1
    
    while start <= end {
        
        var mid = start + (end - start)/2
        
        if (mid > 0 && mid < end) {
            if (arr[mid] > arr[mid - 1] && arr[mid] > arr[mid + 1]) {
                return mid
            } else if (arr[mid - 1] > arr[mid]) {
                end = mid - 1
            } else {
                start = mid + 1
            }
        } else if (arr[0] > arr[1]) {
            return 0
        } else if (arr[end] > arr[end - 1]) {
            return end
        }
    }
    return -1
}

let arr8 = [5, 5, 5, 15]
print(peakElement(arr: arr8))

func searchIn2DSortedArray(arr: [[Int]], key: Int) -> (Int,Int) {
    
    var row = arr.count
    var column = arr[0].count
    var i = 0
    var j = column - 1
    
    while (i >= 0 && i < row && j >= 0 && j < column) {
        if (arr[i][j] == key) {
            return (i,j)
        }
        else if (arr[i][j] > key) {
            j = j - 1
        } else if (arr[i][j] < key) {
            i = i + 1
        }
    }
    return (-1, -1)
}

let arr9 = [[10, 20, 30, 40], [15, 25, 35, 45], [27,29, 37, 45], [32, 33, 39, 50]]

print(searchIn2DSortedArray(arr: arr9, key: 27))
