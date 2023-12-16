import Foundation
import UIKit

// Actor

//Data races occur when the same memory is accessed from multiple threads without synchronization, and at least one access is a write


final class ChickenFeederWithQueue {
    let food = "worms"
    
    /// A combination of a private backing property and a computed property allows for synchronized access.
    private var _numberOfEatingChickens: Int = 0
    var numberOfEatingChickens: Int {
        queue.sync {
            _numberOfEatingChickens
        }
    }
    
    /// A concurrent queue to allow multiple reads at once.
    private var queue = DispatchQueue(label: "chicken.feeder.queue", attributes: .concurrent)
    
    func chickenStartsEating() {
        /// Using a barrier to stop reads while writing
        queue.sync(flags: .barrier) {
            _numberOfEatingChickens += 1
        }
    }
    
    func chickenStopsEating() {
        /// Using a barrier to stop reads while writing
        queue.sync(flags: .barrier) {
            _numberOfEatingChickens -= 1
        }
    }

}

actor ChickenFeeder {
    let food = "worms"
    var numberOfEatingChickens: Int = 0
    
    func chickenStartsEating() {
        numberOfEatingChickens += 1
    }
    
    func chickenStopsEating() {
        numberOfEatingChickens -= 1
    }
}

//MainActor

@MainActor
final class HomeViewModel {
    // ..
}

//@MainActor
//func fetchImage(for url: URL) async throws -> UIImage {
//    let (data, _) = try await URLSession.shared.data(from: url)
//    guard let image = UIImage(data: data) else {
//        throw ImageFetchingError.imageDecodingFailed
//    }
//    return image
//}

//GlobalActor

// AsynAwait
