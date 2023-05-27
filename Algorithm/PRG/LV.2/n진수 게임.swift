//
//  n진수 게임.swift
//  Algorithm
//
//  Created by 이명진 on 2023/05/27.
//

import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    
    var answer = ""
    var turn = 1
    var queue : [String] = []
    var numberToUse = 0
    
    while answer.count != t {
        if queue.isEmpty {
            queue += String(numberToUse, radix: n).uppercased().map({ String($0) })
            numberToUse += 1
        }
        let next = queue.removeFirst()
        if turn == p { answer.append(next) }
        turn = turn == m ? 1 : turn + 1
    }
    
    return answer
    
}
