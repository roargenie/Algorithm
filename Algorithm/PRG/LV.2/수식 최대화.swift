//
//  수식 최대화.swift
//  Algorithm
//
//  Created by 이명진 on 2023/06/12.
//

import Foundation

func calculate(_ num1: Int, _ num2: Int, _ operator: String) -> Int {
    switch `operator` {
    case "+":
        return num1 + num2
    case "-":
        return num1 - num2
    case "*":
        return num1 * num2
    default:
        return 0
    }
}

func calculateExpression(_ expression: [String], _ priority: [String]) -> Int {
    var numbers = expression.filter { $0 != "+" && $0 != "-" && $0 != "*" }.map { Int($0)! }
    var operators = expression.filter { $0 == "+" || $0 == "-" || $0 == "*" }
    
    for op in priority {
        var i = 0
        while i < operators.count {
            if operators[i] == op {
                let result = calculate(numbers[i], numbers[i+1], op)
                numbers[i] = result
                numbers.remove(at: i+1)
                operators.remove(at: i)
            } else {
                i += 1
            }
        }
    }
    
    return numbers.first!
}

func solution(_ expression: String) -> Int64 {
    let operands = expression.components(separatedBy: ["+", "-", "*"])
    let operators = expression.filter { $0 == "+" || $0 == "-" || $0 == "*" }
    let expressionArray = zip(operands, operators).flatMap { [$0, String($1)] } + [operands.last!]
    
    let priorityCases = [["+", "-", "*"], ["+", "*", "-"], ["-", "+", "*"], ["-", "*", "+"], ["*", "+", "-"], ["*", "-", "+"]]
    
    var maxResult = Int.min
    
    for priority in priorityCases {
        let result = calculateExpression(expressionArray, priority)
        maxResult = max(maxResult, abs(result))
    }
    
    return Int64(maxResult)
}

//MARK: - 다른 풀이 방법

enum Operation: Character {
    case multiple = "*"
    case plus = "+"
    case minus = "-"

    func operate(_ n1: Int64, _ n2: Int64) -> Int64 {
        switch self {
            case .multiple: return n1 * n2
            case .plus: return n1 + n2
            case .minus: return n1 - n2
            default: return -1
        }
    }
}

func operate(numbers: [Int64], opers: [Character], prior: [Operation]) -> Int64 {
    var numbers = numbers
    var opers = opers
    for oper in prior {
        while let index = opers.firstIndex(of: oper.rawValue) {
            numbers[index] = oper.operate(numbers[index], numbers[index+1])
            numbers.remove(at: index+1)
            opers.remove(at: index)
        }
    }
    return abs(numbers[0])
}

func solution(_ expression:String) -> Int64 {
    let numbers = expression.components(separatedBy: ["*", "+", "-"]).map{abs(Int64($0)!)}
    let opers = Array(expression.filter({ Int(String($0)) == nil}))
    let myOper = "*+-"
    var maxValue: Int64 = 0

    for first in myOper {
        for second in myOper {
            guard first != second else { continue }
            let third = "*+-".filter({$0 != first && $0 != second})[0]
            let result = operate(numbers: numbers, opers: opers, prior: [
                Operation(rawValue: first)!,
                Operation(rawValue: second)!,
                Operation(rawValue: third)!
            ])
            maxValue = max(maxValue, result)
        }
    }


    return maxValue
}

