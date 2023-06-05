//
//  쿼드압축 후 개수 세기.swift
//  Algorithm
//
//  Created by 이명진 on 2023/06/05.
//

import Foundation

func solution(_ arr: [[Int]]) -> [Int] {
    var zeros = 0
    var ones = 0
    
    func compress(_ row: Int, _ col: Int, _ size: Int) {
        let first = arr[row][col]
        var isCompressible = true
        
        // 현재 영역 내부의 모든 수가 같은지 확인
        for i in row..<row+size {
            for j in col..<col+size {
                if arr[i][j] != first {
                    isCompressible = false
                    break
                }
            }
            if !isCompressible {
                break
            }
        }
        
        if isCompressible {
            if first == 0 {
                zeros += 1
            } else {
                ones += 1
            }
        } else {
            let newSize = size / 2
            compress(row, col, newSize)                      // 좌상단 영역
            compress(row, col + newSize, newSize)            // 우상단 영역
            compress(row + newSize, col, newSize)            // 좌하단 영역
            compress(row + newSize, col + newSize, newSize)  // 우하단 영역
        }
    }
    
    compress(0, 0, arr.count)
    
    return [zeros, ones]
}
