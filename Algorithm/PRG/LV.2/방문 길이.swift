//
//  방문 길이.swift
//  Algorithm
//
//  Created by 이명진 on 2023/05/30.
//

import Foundation

func solution(_ dirs: String) -> Int {
    var visited = Set<[Int]>()
    var currentPos = (0, 0)
    let directions: [Character: (Int, Int)] = [
        "U": (0, 1),
        "D": (0, -1),
        "R": (1, 0),
        "L": (-1, 0)
    ]
    
    for direction in dirs {
        if let move = directions[direction] {
            let newPos = (currentPos.0 + move.0, currentPos.1 + move.1)
            if newPos.0 >= -5 && newPos.0 <= 5 && newPos.1 >= -5 && newPos.1 <= 5 {
                visited.insert([currentPos.0, currentPos.1, newPos.0, newPos.1])
                visited.insert([newPos.0, newPos.1, currentPos.0, currentPos.1])
                currentPos = newPos
            }
        }
    }
    
    return visited.count / 2
}
