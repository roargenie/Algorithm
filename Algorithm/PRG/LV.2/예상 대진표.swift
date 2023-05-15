//
//  예상 대진표.swift
//  Algorithm
//
//  Created by 이명진 on 2023/05/15.
//

import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int {
    
    var a = Double(a), b = Double(b)
    var round = 0
    
    while a != b {
        a = ceil(Double(a) / 2.0)
        b = ceil(Double(b) / 2.0)
        
        round += 1
    }
    
    return round
}
