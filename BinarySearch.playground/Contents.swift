import Foundation


func print1ton(n: Int) {
   
    if n == 1 {
        print(1)
        return
    }
    
    print(n)
    print1ton(n: n-1)
}

print1ton(n: 7)


class Node<N> {
    var value: N
    var children:[Node] = []
    
    init (value: N) {
        self.value = value
    }
    
    func add(_ child: Node) {
        self.children.append(child)
    }
}

let sports = Node(value: "Sports")

let indoor = Node(value: "Indoor")
let outdoor = Node(value: "Outdoor")

sports.add(indoor)
sports.add(outdoor)

let tableTennis = Node(value: "Table Tennis")
let chess = Node(value: "Chess")

indoor.add(tableTennis)
indoor.add(chess)

let football = Node(value: "Football")
let rugby = Node(value: "Rugby")

outdoor.add(football)
outdoor.add(rugby)





// Dynamic Programming


func findJSONDifferences(doc1: [String: Any], doc2: [String: Any]) -> [String: Any] {
    var differences: [String: Any] = [:]
    
    for (key, value1) in doc1 {
        if let value2 = doc2[key] {
            if value1 is [String: Any], value2 is [String: Any] {
                // Recursively compare nested dictionaries
                 let subDifferences = findJSONDifferences(doc1: value1 as! [String: Any], doc2: value2 as! [String: Any])
                    differences[key] = subDifferences
                
            } else if let value1Str = value1 as? String, let value2Str = value2 as? String, value1Str != value2Str {
                // Compare string values
                differences[key] = value2
            } else if let value1Num = value1 as? NSNumber, let value2Num = value2 as? NSNumber, !value1Num.isEqual(to: value2Num) {
                // Compare numeric values
                differences[key] = value2
            }
        } else {
            // Field exists in doc1 but not in doc2
            differences[key] = NSNull()
        }
    }
    
    for (key, value2) in doc2 {
        if doc1[key] == nil {
            // Field exists in doc2 but not in doc1
            differences[key] = value2
        }
    }
    
    return differences.isEmpty ? [:] : differences
}

// Example usage:
let doc1: [String: Any] = [
    "name": "John",
    "age": 30,
    "address": ["street": "123 Main St", "city": "New York"]
]

let doc2: [String: Any] = [
    "name": "Jane",
    "address": ["street": "456 Elm St", "city": "Los Angeles"],
    "phone": "555-1234"
]

 let differences = findJSONDifferences(doc1: doc1, doc2: doc2)
    if let jsonData = try? JSONSerialization.data(withJSONObject: differences, options: .prettyPrinted),
       let jsonString = String(data: jsonData, encoding: .utf8) {
        print(jsonString)
    }

