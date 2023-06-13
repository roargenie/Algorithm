//
//  전력망을 둘로 나누기.swift
//  Algorithm
//
//  Created by 이명진 on 2023/06/13.
//

import Foundation

func solution(_ n: Int, _ wires: [[Int]]) -> Int {
    var graph = [[Int]](repeating: [], count: n + 1)
    var result = Int.max
    
    // 그래프 초기화
    for wire in wires {
        let v1 = wire[0]
        let v2 = wire[1]
        graph[v1].append(v2)
        graph[v2].append(v1)
    }
    
    // 각 전선을 끊어가며 송전탑 개수 차이 계산
    for wire in wires {
        let v1 = wire[0]
        let v2 = wire[1]
        var visited = [Bool](repeating: false, count: n + 1)
        visited[v2] = true
        let count1 = dfs(v1, &graph, &visited) // 첫 번째 전력망 송전탑 개수
        let count2 = n - count1 // 두 번째 전력망 송전탑 개수
        let diff = abs(count1 - count2)
        result = min(result, diff)
    }
    
    return result
}

func dfs(_ node: Int, _ graph: inout [[Int]], _ visited: inout [Bool]) -> Int {
    visited[node] = true
    var count = 1
    
    for neighbor in graph[node] {
        if !visited[neighbor] {
            count += dfs(neighbor, &graph, &visited)
        }
    }
    
    return count
}
