

import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    
    var money = 0
    var result = 0
    var d = d.sorted(by: <)
    
    for i in d {
        if money + i <= budget {
            money += i
            result += 1
        }
    }
    
    return result
}

//MARK: - 더 나은 풀이

func solution1(_ d:[Int], _ budget:Int) -> Int {
    var budget = budget

    return d.sorted().filter{
        budget = budget - $0
        return budget >= 0
    }.count
}


