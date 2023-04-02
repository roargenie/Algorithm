

import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    
    var todayToInt = today.split(separator: ".").map { Int($0)! }
    var dayOfToday = todayToInt[0] * 12 * 28 + todayToInt[1] * 28 + todayToInt[2]
    
    var termsToDay: [Int] = []
    
    var a: [[String]] = []
    var b: [[String]] = []
    var c: [[String]] = []
    var d: [[String]] = []
    
    var result: [Int] = []
    
    for term in terms {
        var result = term.split(separator: " ").map { String($0) }
        a.append(result)
    }
    
    for privacy in privacies {
        var result = privacy.split(separator: " ").map { String($0) }
        b.append(result)
    }
    
    for i in b {
        for j in a {
            if i.contains(j[0]) {
                c.append([i[0], j[1]])
            }
        }
    }
    
    for k in c {
        var result = k[0].split(separator: ".").map { Int($0)! }
        result[1] = result[1] + Int(k[1])!
        var resultToDay = result[0] * 12 * 28 + result[1] * 28 + result[2]
        termsToDay.append(resultToDay)
    }
    
    for (index, item) in termsToDay.enumerated() {
        if item <= dayOfToday {
            result.append(index + 1)
        }
    }
    
    return result
}
