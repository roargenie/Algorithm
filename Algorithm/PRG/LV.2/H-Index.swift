//
//  H-Index.swift
//  Algorithm
//
//  Created by 이명진 on 2023/05/15.
//

import Foundation

func solution(_ citations:[Int]) -> Int {
    var citations = citations.sorted(by: >)
    
    for i in 0..<citations.count {
        if i >= citations[i] {
            return i
        }
    }
    
    return citations.count
}
