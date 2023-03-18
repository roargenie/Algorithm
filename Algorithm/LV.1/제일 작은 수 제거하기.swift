
import Foundation

func solution(_ arr:[Int]) -> [Int] {
    
    var arr = arr
    var sortedArr = arr.sorted(by: >)
    if let removeIndex = arr.lastIndex(of: sortedArr.last!) {
        arr.remove(at: removeIndex)
    }
    
    return arr.isEmpty ? [-1] : arr
}
