//
//  삼각 달팽이.swift
//  Algorithm
//
//  Created by 이명진 on 2023/06/05.
//

import Foundation

func solution(_ n: Int) -> [Int] {
    var triangle = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    var row = -1
    var col = 0
    var num = 1
    var remaining = n
    var direction = 0
    
    while remaining > 0 {
        for _ in 0..<remaining {
            // 이동 방향에 따라 좌표 업데이트
            if direction == 0 {
                row += 1 // 아래로 이동
            } else if direction == 1 {
                col += 1 // 오른쪽으로 이동
            } else if direction == 2 {
                row -= 1 // 위로 이동
                col -= 1
            }
            
            triangle[row][col] = num
            num += 1
        }
        
        direction = (direction + 1) % 3
        remaining -= 1
    }
    
    return triangle.flatMap { $0.filter { $0 > 0 } }
}
