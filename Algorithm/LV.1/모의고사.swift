

import Foundation

func solution(_ answers:[Int]) -> [Int] {
    
    var result = [Int]()
    var giveupMathPeopleDic: [Int: Int] = [1: 0, 2: 0, 3: 0]
    var numberOnePattern = [1, 2, 3, 4, 5]
    var numberTwoPattern = [2, 1, 2, 3, 2, 4, 2, 5]
    var numberThreePattern = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    for i in 0..<answers.count {
        if answers[i] == numberOnePattern[i % numberOnePattern.count] {
            giveupMathPeopleDic[1]! += 1
        }
        if answers[i] == numberTwoPattern[i % numberTwoPattern.count] {
            giveupMathPeopleDic[2]! += 1
        }
        if answers[i] == numberThreePattern[i % numberThreePattern.count] {
            giveupMathPeopleDic[3]! += 1
        }
    }
    
    var maxCnt = max(giveupMathPeopleDic[1]!, giveupMathPeopleDic[2]!, giveupMathPeopleDic[3]!)
    
    for (key, value) in giveupMathPeopleDic {
        if value == maxCnt {
            result.append(key)
        }
    }
    
    return result.sorted()
}
