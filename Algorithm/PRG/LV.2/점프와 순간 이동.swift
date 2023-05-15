//
//  점프와 순간 이동.swift
//  Algorithm
//
//  Created by 이명진 on 2023/05/15.
//

import Foundation

func solution(_ n: Int) -> Int {
    var count = 0
    var distance = n
    
    while distance > 0 {
        if distance % 2 == 1 {
            count += 1
        }
        distance /= 2
    }
    
    return count
}
