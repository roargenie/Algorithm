//
//  가장 큰 수.swift
//  Algorithm
//
//  Created by 이명진 on 2023/06/04.
//

import Foundation

func solution(_ numbers: [Int]) -> String {
    let sortedNumbers = numbers.map { String($0) }.sorted { $0 + $1 > $1 + $0 }
    let result = sortedNumbers.joined()
    return result.first == "0" ? "0" : result
}
