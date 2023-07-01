//
//  가장 큰 정사각형 찾기.swift
//  Algorithm
//
//  Created by 이명진 on 2023/07/01.
//

import Foundation

func solution(_ board: [[Int]]) -> Int {
    let rows = board.count
    let cols = board[0].count
    
    var dp = [[Int]](repeating: [Int](repeating: 0, count: cols), count: rows)
    var maxSquare = 0
    
    if rows == 1 || cols == 1 {
        for i in 0..<rows {
            for j in 0..<cols {
                if board[i][j] == 1 {
                    return 1
                }
            }
        }
    }
    
    for i in 0..<rows {
        for j in 0..<cols {
            if i == 0 || j == 0 {
                dp[i][j] = board[i][j]
            } else {
                if board[i][j] == 1 {
                    dp[i][j] = min(dp[i-1][j-1], dp[i-1][j], dp[i][j-1]) + 1
                }
            }
            
            maxSquare = max(maxSquare, dp[i][j])
        }
    }
    
    return maxSquare * maxSquare
}
