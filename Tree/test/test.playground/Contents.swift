import UIKit


var things = "cars"

let closure = { [things] in
    print("Things are \(things)")
}

things = "bikes"

closure()


var tempDispatchQuesue = DispatchQueue(label: "com.test", attributes: .concurrent)

print("1")
tempDispatchQuesue.async {
    print("2")
  tempDispatchQuesue.sync {
    print("3")
    }
    print("4")
}
print("5")

//1, 5, 2, 3, 4
//1, 5, 3, 2, 4


