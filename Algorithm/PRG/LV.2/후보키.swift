//
//  후보키.swift
//  Algorithm
//
//  Created by 이명진 on 2023/06/15.
//

import Foundation

func solution(_ relation: [[String]]) -> Int {
    let columnCount = relation[0].count
    let rowCount = relation.count
    
    var candidateKeys = Set<Int>() // 후보 키의 비트마스크 집합
    
    for bitmask in 1..<(1 << columnCount) {
        var isUnique = true // 유일성을 검사하기 위한 플래그
        var keySet = Set<String>() // 유일성 검사를 위한 속성 조합의 집합
        
        for row in 0..<rowCount {
            var key = ""
            for col in 0..<columnCount {
                if bitmask & (1 << col) != 0 {
                    key += relation[row][col]
                }
            }
            
            if keySet.contains(key) {
                isUnique = false // 유일성이 깨지는 경우
                break
            } else {
                keySet.insert(key)
            }
        }
        
        if isUnique {
            // 최소성 검사
            var isMinimal = true
            for candidate in candidateKeys {
                if (candidate & bitmask) == candidate {
                    isMinimal = false
                    break
                }
            }
            
            if isMinimal {
                candidateKeys.insert(bitmask)
            }
        }
    }
    
    return candidateKeys.count
}
