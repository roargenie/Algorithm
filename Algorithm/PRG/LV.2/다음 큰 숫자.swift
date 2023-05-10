//
//  다음 큰 숫자.swift
//  Algorithm
//
//  Created by 이명진 on 2023/05/10.
//

import Foundation

func solution(_ n: Int) -> Int {
    
    var countOfN = String(n, radix: 2).filter { $0 == "1" }.count
    var next = n + 1
    
    while true {
        let countOfNext = String(next, radix: 2).filter { $0 == "1" }.count
        if countOfN == countOfNext {
            return next
        }
        next += 1
    }
    
}
