import Foundation

let arr = [100, 80, 60, 70, 60, 75, 85]

// for anyday, number of stock price which are smaller

func stockSpan(arr: [Int]) -> [Int] {
    
    var stack: [(Int, Int)] = [(Int, Int)]()
    var output: [Int] = [Int]()
    var result = [Int](repeating: 0, count: arr.count)
    
    for i in 0..<arr.count {
        if stack.isEmpty {
            output.append(-1)
        } else if (!stack.isEmpty && stack.last!.0 >= arr[i]) {
            output.append(stack.last!.1)
        } else {
            while (!stack.isEmpty && stack.last!.0 < arr[i]) {
                stack.removeLast()
            }
            if stack.isEmpty {
                output.append(-1)
            } else {
                output.append(stack.last!.1)
            }
            
        }
        stack.append((arr[i], i))
    }
    
    for i in 0..<arr.count {
        result[i] = i - output[i]
    }
    
    return result
}

print(stockSpan(arr: arr))

//'(', ')', '{', '}', '[' and ']'

func isValid(_ s: String) -> Bool {
    
    var stack = [Character]()
    
    if s.isEmpty {
        return false
    }
    
    for char in s {
        if (char == "(" || char == "{" || char == "[") {
            stack.append(char)
        } else {
            
            if stack.isEmpty {
                return false
            }
            
            let top = stack.removeLast()
            
            switch char {
            case ")":
                if top != "(" {
                    return false
                }
            case "}":
                if top != "{" {
                    return false
                }
            case "]":
                if top != "[" {
                    return false
                }
            default:
                return false
            }
        }
    }
    return stack.isEmpty
}

let s = "["
print(isValid(s))


func longestValidParentheses(_ s: String) -> Int {
    
    var stack = [Character]()
    var result = [Character]()
    
    if s.isEmpty {
        return 0
    }
    
    for char in s {
        if char == "(" {
            stack.append(char)
        } else {
            if stack.isEmpty {
                continue
            }
            
            let top = stack.removeLast()
            
            if char == ")" {
                result.append(top)
                result.append(char)
            }
            
            
        }
    }
    return result.count
}

let s1 = "()(()"
print(longestValidParentheses(s1))

