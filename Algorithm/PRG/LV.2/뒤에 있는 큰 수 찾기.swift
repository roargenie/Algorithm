//
//  뒤에 있는 큰 수 찾기.swift
//  Algorithm
//
//  Created by 이명진 on 2023/06/02.
//

import Foundation

func solution(_ numbers: [Int]) -> [Int] {
    var result: [Int] = []
    var stack: [Int] = []
    
    for number in numbers.reversed() {
        while let last = stack.last, last <= number {
            stack.removeLast()
        }

        if let nextGreater = stack.last {
            result.append(nextGreater)
        } else {
            result.append(-1)
        }

        stack.append(number)
    }

    return result.reversed()
}
