//
//  프로세스.swift
//  Algorithm
//
//  Created by 이명진 on 2023/05/25.
//

import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    
    var queue = [(Int, Int)]()
    var result = [Int]()
    var answer = 0
    
    for (index, item) in priorities.enumerated() {
        queue.append((item, index))
    }
    
    while !queue.isEmpty {
        var sortedQueue = queue.sorted(by: { $0.0 > $1.0 })
        
        if sortedQueue[0] == queue[0] {
            result.append(queue[0].1)
            queue.removeFirst()
        } else {
            queue.append(queue[0])
            queue.removeFirst()
        }
    }

    if let number = result.lastIndex(of: location) {
        answer = number + 1
    }
    
    return answer
}

//MARK: - 더 나은 풀이

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var cPriorities = priorities
    var targetIndex = location
    var seq = 0

    while cPriorities.count > 0 {
        if cPriorities.contains(where: { $0 > cPriorities[0] }) {
            let first = cPriorities.removeFirst()
            cPriorities.append(first)
            targetIndex = targetIndex - 1 < 0 ? cPriorities.count - 1 : targetIndex - 1
        } else {
            if(targetIndex == 0) {
                return priorities.count - cPriorities.count + 1
            }

            cPriorities.removeFirst()
            targetIndex = targetIndex - 1
        }
    }

    return 0
}

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var priority: [(Int,Int)] = priorities.enumerated().map {($0.offset, $0.element)}
    var printing: Int = 0

    while true {
        let pri: (Int, Int) = priority.remove(at: 0)
        if !priority.filter({pri.1 < $0.1}).isEmpty {
            priority.append(pri)
        } else if pri.0 == location {
            printing = priorities.count - priority.count
            break
        }
    }

    return printing
}

