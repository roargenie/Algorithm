//
//  영어 끝말잇기.swift
//  Algorithm
//
//  Created by 이명진 on 2023/05/12.
//

import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    
    var usedWords: [String] = [words[0]]
    var lastChar = words[0].last!
    
    for i in 1..<words.count {
        if usedWords.contains(words[i]) || lastChar != words[i].first! {
            return [(i % n) + 1, (i / n) + 1]
        }
        usedWords.append(words[i])
        lastChar = words[i].last!
    }
    
    return [0, 0]
}
