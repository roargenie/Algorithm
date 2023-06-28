//
//  하노이의 탑.swift
//  Algorithm
//
//  Created by 이명진 on 2023/06/28.
//

import Foundation

func solution(_ n: Int) -> [[Int]] {
    var moves: [[Int]] = []
    
    func hanoi(_ n: Int, _ from: Int, _ to: Int, _ via: Int) {
        if n == 1 {
            moves.append([from, to])
        } else {
            hanoi(n - 1, from, via, to)
            moves.append([from, to])
            hanoi(n - 1, via, to, from)
        }
    }
    
    hanoi(n, 1, 3, 2)
    
    return moves
}
