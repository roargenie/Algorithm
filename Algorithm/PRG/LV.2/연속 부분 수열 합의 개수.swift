//
//  연속 부분 수열 합의 개수.swift
//  Algorithm
//
//  Created by 이명진 on 2023/05/16.
//

import Foundation

func solution(_ elements:[Int]) -> Int {
    
    var result = Set<Int>()
        // var result: Set<Int> = [] 시간초과 왜?????
    
    for i in 0..<elements.count {
        var sum = 0
        for j in 0..<elements.count {
            let index = (i + j) % elements.count
            sum += elements[index]
            result.insert(sum)
        }
    }
    
    return result.count
}
