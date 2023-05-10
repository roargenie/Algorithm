//
//  최솟값 만들기.swift
//  Algorithm
//
//  Created by 이명진 on 2023/05/10.
//

import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int {
    
    let arrA = A.sorted(by: <)
    let arrB = B.sorted(by: >)
    var result = 0
    
    for i in 0...arrA.count - 1 {
        result += arrA[i] * arrB[i]
    }
    
    return result
}
