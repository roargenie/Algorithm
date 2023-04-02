

import Foundation

func solution(_ n:Int) -> String {
    
    var result = ""
    
    if n % 2 == 0 {
        result = String(repeating: "수박", count: n / 2)
    } else {
        result = String(repeating: "수박", count: n / 2) + "수"
    }
    
    return result
}

//MARK: - 더 나은 풀이

func solution1(_ n:Int) -> String {
    return (0..<n).map{($0 % 2 == 0 ? "수" : "박")}.reduce("", +)
}

