//
//  배달.swift
//  Algorithm
//
//  Created by 이명진 on 2023/06/13.
//

import Foundation

func solution(_ N: Int, _ road: [[Int]], _ K: Int) -> Int {
    var graph = [[(Int, Int)]](repeating: [], count: N + 1)
    var distances = [Int](repeating: Int.max, count: N + 1)
    
    // 그래프 초기화
    for edge in road {
        let a = edge[0]
        let b = edge[1]
        let time = edge[2]
        graph[a].append((b, time))
        graph[b].append((a, time))
    }
    
    func dijkstra(_ start: Int) {
        var queue = [(Int, Int)]()
        
        // 시작 노드 처리
        distances[start] = 0
        queue.append((start, 0))
        
        while !queue.isEmpty {
            let (node, dist) = queue.removeFirst()
            
            // 현재 노드까지의 거리가 이미 최단 거리라면 스킵
            if dist > distances[node] {
                continue
            }
            
            // 인접한 노드들을 확인하며 최단 거리 갱신
            for (nextNode, nextDist) in graph[node] {
                let cost = dist + nextDist
                if cost < distances[nextNode] {
                    distances[nextNode] = cost
                    queue.append((nextNode, cost))
                }
            }
        }
    }
    
    // 1번 마을에서 다른 마을까지의 최단 거리 계산
    dijkstra(1)
    
    // 배달이 가능한 마을의 개수 계산
    var count = 0
    for distance in distances {
        if distance <= K {
            count += 1
        }
    }
    
    return count
}
