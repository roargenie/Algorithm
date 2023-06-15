//
//  거리두기 확인하기.swift
//  Algorithm
//
//  Created by 이명진 on 2023/06/15.
//

import Foundation

func solution(_ places:[[String]]) -> [Int] {
    var result = [Int]()
    
    for place in places {
        let room = splitPlaces(place)
        var sum = 1
        
        for i in 0..<5 {
            guard sum == 1 else { break }
            
            for j in 0..<5 {
                if room[i][j] == "P" {
                    if !checkDistance(room, (i, j)) {
                        sum = 0
                        break
                    }
                }
            }
        }
        result.append(sum)
    }
    
    return result
}

func splitPlaces(_ places: [String]) -> [[String]] {
    var room = places.map { $0.map { String($0) } }
    return room
}

//func checkPartition(_ rooms: [[String]], _ a: (Int, Int), _ b: (Int, Int)) -> Bool {
//    if a.0 == b.0 {
//        return rooms[a.0][a.1+1...b.1-1].contains("X")
//    } else if a.1 == b.1 {
//        return rooms[a.0+1...b.0-1][a.1].contains("X")
//    } else {
//        return rooms[a.0][a.1+1...b.1-1].contains("X") && rooms[a.0+1...b.0-1][a.1].contains("X")
//    }
//}

func checkPartition(_ rooms: [[String]], _ a: (Int, Int), _ b: (Int, Int)) -> Bool {
    if a.0 == b.0 {
        return rooms[a.0][(a.1+b.1)/2] == "X"
    } else if a.1 == b.1 {
        return rooms[(a.0+b.0)/2][a.1] == "X"
    } else {
        return rooms[a.0][(a.1+b.1)/2] == "X" && rooms[(a.0+b.0)/2][a.1] == "X"
    }
}

func checkDistance(_ rooms: [[String]], _ start: (Int, Int)) -> Bool {
    let dx = [0, 0, -1, 1]
    let dy = [1, -1, 0, 0]
    
    var queue = [start]
    var index = 0
    var visited = Array(repeating: Array(repeating: false, count: 5), count: 5)
    
    visited[start.0][start.1] = true
    
    while index < queue.count {
        let startNode = queue[index]
        index += 1
        
        for i in 0..<4 {
            let nx = startNode.0 + dx[i]
            let ny = startNode.1 + dy[i]
            
            guard (0..<5) ~= nx, (0..<5) ~= ny else { continue }
            
            let distance = abs(nx - start.0) + abs(ny - start.1)
            guard distance <= 2 else { continue }
            
            guard !visited[nx][ny] else { continue }
            visited[nx][ny] = true
            
            if rooms[nx][ny] == "P" {
                if distance <= 1 {
                    return false
                } else if distance == 2 {
                    if !checkPartition(rooms, start, (nx, ny)) {
                        return false
                    }
                }
            } else if rooms[nx][ny] == "O" {
                queue.append((nx, ny))
            }
        }
    }
    
    return true
}
