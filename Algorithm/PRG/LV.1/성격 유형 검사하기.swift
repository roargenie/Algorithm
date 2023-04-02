

import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    
    var characterType: [String: Int] = ["R": 0, "T": 0, "C": 0, "F": 0,
                                        "J": 0, "M": 0, "A": 0, "N": 0]
    var choiceType: [Int: Int] = [1: 3, 2: 2, 3: 1, 4: 0, 5: 1, 6: 2, 7: 3]
    var first = ""
    var second = ""
    var third = ""
    var fourth = ""
    var result = ""
    
    for i in 0..<survey.count {
        let type = survey[i]
        let choice = choices[i]
        let agree = type.suffix(1)
        let disAgree = type.prefix(1)
        if choice > 4 {
            characterType[String(agree)]! += choiceType[choice]!
        } else if choice < 4 {
            characterType[String(disAgree)]! += choiceType[choice]!
        }
    }
    
    if characterType["R"]! < characterType["T"]! {
        first = "T"
    } else if characterType["R"]! == characterType["T"]! || characterType["R"]! > characterType["T"]! {
        first = "R"
    }
    
    if characterType["C"]! < characterType["F"]! {
        second = "F"
    } else if characterType["C"]! == characterType["F"]! || characterType["C"]! > characterType["F"]! {
        second = "C"
    }
    
    if characterType["J"]! < characterType["M"]! {
        third = "M"
    } else if characterType["J"]! == characterType["M"]!|| characterType["J"]! > characterType["M"]! {
        third = "J"
    }
    
    if characterType["A"]! < characterType["N"]! {
        fourth = "N"
    } else if characterType["A"]! == characterType["N"]! || characterType["A"]! > characterType["N"]! {
        fourth = "A"
    }
    
    result = first + second + third + fourth
    
    return result
}

// 3항 연산자 사용해서 좀 더 깔끔하게.
func solution1(_ survey:[String], _ choices:[Int]) -> String {
    var dict = ["R": 0, "T": 0, "C": 0, "F": 0, "J": 0, "M": 0, "A":0, "N": 0]
    var res = ""

    for i in 0..<survey.count {
        let first = String(survey[i].first!)
        let second = String(survey[i].last!)

        switch choices[i] {
        case 1...3:
            dict[first] = dict[first]! + 4 - choices[i]
        case 5...7:
            dict[second] = dict[second]! + choices[i] - 4
        default:
            break
        }
    }

    dict["R"]! >= dict["T"]! ? res.append("R") : res.append("T")
    dict["C"]! >= dict["F"]! ? res.append("C") : res.append("F")
    dict["J"]! >= dict["M"]! ? res.append("J") : res.append("M")
    dict["A"]! >= dict["N"]! ? res.append("A") : res.append("N")

    return res
}
