

import Foundation

func solution(_ dartResult:String) -> Int {
    
    var scores = dartResult.split(whereSeparator: { !$0.isNumber }).compactMap { Int($0) }
    var letters = dartResult.split(whereSeparator: { $0.isNumber })
    
    for (index, letter) in letters.enumerated() {
        letter.forEach {
            let score = scores[index]
            switch $0 {
            case "D":
                scores[index] = score * score
            case "T":
                scores[index] = score * score * score
            case "*":
                scores[index] = score * 2
                if index >= 1 {
                    scores[index - 1] = scores[index - 1] * 2
                }
            case "#":
                scores[index] = -score
            default:
                break
            }
            print(scores)
        }
    }
    
    return scores.reduce(0, +)
}

//MARK: - 다른 풀이

func solution1(_ dartResult:String) -> Int {

        let numberList = dartResult.split(whereSeparator: {$0.isLetter || $0 == "#" || $0 == "*"})
        let letterList = dartResult.split(whereSeparator: {$0.isNumber})

        var totalScore = 0

        for (i, (number, letter)) in zip(numberList, letterList).enumerated() {
            var score = 0
            if let number = Int(number) {
                score = letter.contains("D") ? number * number : letter.contains("T") ? number * number * number : number

            }

            if letter.contains("*") {
                score *= 2
            } else if letter.contains("#") {
                score = -score
            }

            if i != 2 {
                if letterList[i + 1].contains("*") {
                    score *= 2
                }
            }

            totalScore += score

        }


        return totalScore
}

