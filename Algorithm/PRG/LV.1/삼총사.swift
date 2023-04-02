

import Foundation

func solution(_ number:[Int]) -> Int {
    
    var result = 0
    
    for i in 0...number.count - 3 {
        for j in i + 1...number.count - 2 {
            for k in j + 1...number.count - 1 {
                if number[i] + number[j] + number[k] == 0 {
                    result += 1
                }
            }
        }
    }
    
    return result
}
