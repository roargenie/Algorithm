//
//  n^2배열 자르기.swift
//  Algorithm
//
//  Created by 이명진 on 2023/05/16.
//

import Foundation

func solution(_ n: Int, _ left: Int64, _ right: Int64) -> [Int] {
    let startIndex = Int(left)
    let lastIndex = Int(right)
    let size = lastIndex - startIndex + 1

    var result = [Int](repeating: 0, count: size)

    for i in 0..<size {
        let row = (startIndex + i) / n
        let col = (startIndex + i) % n
        result[i] = max(row, col) + 1
    }

    return result
}

// 고차함수 이용

func solution(_ n: Int, _ left: Int64, _ right: Int64) -> [Int] {
    
    return (Int(left)...Int(right)).map { max($0 / n + 1, $0 % n + 1) }
}


//MARK: - 시간 초과

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    
    var result = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    for i in 0..<n {
        for j in 0..<n {
            result[i][j] += (max(i, j) + 1)
        }
    }
    
    return Array(result.flatMap { $0 }[Int(left)...Int(right)])
}

func solution(_ n: Int, _ left: Int64, _ right: Int64) -> [Int] {
    var result = [Int]()
    let startIndex = Int(left)
    let lastIndex = Int(right)
    
    for i in 0..<n {
        for j in 0..<n {
            result.append(max(i, j) + 1)
        }
    }
    
    return Array(result[startIndex...lastIndex])
}
