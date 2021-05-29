import UIKit

class Solution {
    func defangIPaddr(_ address: String) -> String {
      return address.replacingOccurrences(of: ".", with: "[.]")
    }
}


class Solution2 {
    func defangIPaddr(_ address: String) -> String {
      return address.components(separatedBy: ".").joined(separator: "[.]")
    }
}
