

import Foundation

func solution(_ n:Int) -> Int {
    
    var queue = [Int]()
    var n = n
    var sum = 1
    var result = 0
    
    while n != 0 {
        var remainder = n % 3
        n = n / 3
        queue.insert(remainder, at: 0)
    }
    
    for num in queue {
        result += num * sum
        sum = sum * 3
    }
    
    return result
}

//MARK: - 더 나은 풀이

func solution1(_ n:Int) -> Int {
    let flipToThree = String(n,radix: 3)
    let answer = Int(String(flipToThree.reversed()),radix:3)!
        return answer
}

