//
//  무인도 여행.swift
//  Algorithm
//
//  Created by 이명진 on 2023/06/11.
//

import Foundation

func solution(_ maps:[String]) -> [Int] {
    
    let row = maps.count
    let col = maps[0].count
    var graph = maps.reduce(into: [[Character]]()) { result, map in
        result.append(Array(map))
    }
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: col), count: row)
    let dx = [0, 0, -1, 1]
    let dy = [1, -1, 0, 0]
    var result = [Int]()
    
    func dfs(_ x: Int, _ y: Int) -> Int {
        if graph[x][y] == "X" { return 0 }
        var sum = Int(String(graph[x][y]))!
        visited[x][y] = true
        for i in dx.indices {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx >= row || nx < 0 || ny >= col || ny < 0 { continue }
            if visited[nx][ny] { continue }
            visited[nx][ny] = true
            sum += dfs(nx, ny)
        }
        return sum
    }
    
    for i in 0..<row {
        for j in 0..<col {
            if visited[i][j] || graph[i][j] == "X" { continue }
            let sum = dfs(i, j)
            if sum > 0 {
                result.append(sum)
            }
        }
    }
    
    return result.isEmpty ? [-1] : result.sorted()
}
