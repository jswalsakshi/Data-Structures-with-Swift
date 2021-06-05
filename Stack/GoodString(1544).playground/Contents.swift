import Foundation




  func makeGood(_ s: String) -> String {
    
    var stack:[Character] = []
    
    for ch in s {
      if ch.isLowercase {
        stack.append(ch)
      }
      else if ch.isUppercase {
        stack.removeLast()
      }
    }
    
    return String(stack)
  }

makeGood("abBAcC")


//extension Character {
//    func isMember(of set: CharacterSet) -> Bool {
//        guard let scalar = UnicodeScalar(String(self)) else { return false }
//        return set.contains(scalar)
//    }
//    var isUppercase: Bool {
//        return isMember(of: .uppercaseLetters)
//    }
//  var isLowerCase: Bool {
//    return isMember(of: .lowercaseLetters)
//  }
//}
