extension Array {
    func splitInSubArrays(into size: Int) -> [[Element]] {
        return (0..<size).map {
            stride(from: $0, to: count, by: size).map { self[$0] }
        }
    }
}

extension Collection where Index == Int {
    func chunked(by chunkSize: Int) -> [[Element]] {
        stride(from: startIndex, to: endIndex, by: chunkSize).map { Array(self[$0..<Swift.min($0 + chunkSize, count)]) }
    }
}
let array = [1,2,3,5,8,20,2]

var bigCell:[Array] = []
var smallCell:[Array] = []

let prefix = [1,2,3,5,8,20,2].prefix(4)


for i in 0...4 {
  
}
