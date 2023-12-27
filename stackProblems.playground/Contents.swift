import Foundation

//func stockSpan(arr: [Int]) {
//    
//    
//    
//}


func call(str: [String]) -> Int {
    var sum = 0
    var newArr: [Int] = [Int]()
    
    for op in str {
        if let intValue = Int(op) {
            newArr.append(intValue)
        } else if(op == "C") {
            newArr.removeLast()
        } else if(op == "D") {
            let num = (2 * newArr.last!)
            newArr.append(num)
        } else if(op == "+") {
            let num = newArr.last! + newArr[newArr.endIndex - 2]
            newArr.append(num)
        }
    }
    
    // Calculate the sum after all operations
    sum = newArr.reduce(0, +)
    
    return sum
}
let inp = ["5", "2", "C", "D", "+"]
call(str: inp)

//func isValid(str: String) -> Bool {
//    
//    var stack: [String]?
//    
//    if stack?.count == 0 {
//        return true
//    }
//    
////    for i in str {
////        if
////    }
//    
//    
//    stack?.append(str)
//    
//    
//    
//}
