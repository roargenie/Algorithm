

import Foundation

func solution(_ n:Int) -> Int {

    var result = 0
    var isPrime = true

    for i in 2...n {
        isPrime = true
        for j in 2...Int((sqrt(Double(n)))) + 1 {
            if i != j && i % j == 0 {
                isPrime = false
                break
            }
        }
        result = isPrime ? result + 1 : result
    }

    return result
}
