//
//  의상.swift
//  Algorithm
//
//  Created by 이명진 on 2023/05/17.
//

import Foundation

func solution(_ clothes:[[String]]) -> Int {
    
    var categoryCount: [String: Int] = [:]
    
    for i in clothes {
        if categoryCount[i[1]] == nil {
            categoryCount[i[1]] = 1
        } else {
            categoryCount[i[1]]! += 1
        }
    }
    var countArr = categoryCount.values.map { $0 + 1 }
    
    return countArr.reduce(1) { $0 * $1 } - 1
}
