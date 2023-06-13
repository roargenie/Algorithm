//
//  행렬 테두리 회전하기.swift
//  Algorithm
//
//  Created by 이명진 on 2023/06/13.
//

import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    
    var graph = [[Int]](repeating: [Int](repeating: 0, count: columns), count: rows)
    var sum = 0
    var result = [Int]()
    
    for i in 0..<rows {
        for j in 0..<columns {
            sum += 1
            graph[i][j] = sum
        }
    }
    
    for i in 0..<queries.count {
        let query = queries[i].map { $0 - 1 }
        result.append(rotationSquare(query, &graph))
    }
    
    return result
}

func rotationSquare(_ query: [Int], _ graph: inout [[Int]]) -> Int {
    var currentNum = 0
    var minValue = Int.max
    var coordinate: (x: Int, y: Int) = (query[0], query[1])
    let lengthOfX = query[2] - query[0]
    let lengthOfY = query[3] - query[1]
    
    currentNum = graph[coordinate.x][coordinate.y]
    
    // 오른쪽으로 이동
    for _ in 0..<lengthOfY {
        coordinate = (coordinate.x, coordinate.y + 1)
        swap(&currentNum, &graph[coordinate.x][coordinate.y])
        minValue = min(minValue, graph[coordinate.x][coordinate.y])
    }
    
    // 아래로 이동
    for _ in 0..<lengthOfX {
        coordinate = (coordinate.x + 1, coordinate.y)
        swap(&currentNum, &graph[coordinate.x][coordinate.y])
        minValue = min(minValue, graph[coordinate.x][coordinate.y])
    }
    
    // 왼쪽으로 이동
    for _ in 0..<lengthOfY {
        coordinate = (coordinate.x, coordinate.y - 1)
        swap(&currentNum, &graph[coordinate.x][coordinate.y])
        minValue = min(minValue, graph[coordinate.x][coordinate.y])
    }
    
    // 위로 이동
    for _ in 0..<lengthOfX {
        coordinate = (coordinate.x - 1, coordinate.y)
        swap(&currentNum, &graph[coordinate.x][coordinate.y])
        minValue = min(minValue, graph[coordinate.x][coordinate.y])
    }
    
    return minValue
}
