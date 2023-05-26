//
//  압축.swift
//  Algorithm
//
//  Created by 이명진 on 2023/05/26.
//

import Foundation

func solution(_ msg:String) -> [Int] {

    var alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var dictionary: [String: Int] = [:]
    var index = 0
    var result = [Int]()

    for alp in alphabet {
        index += 1
        dictionary[String(alp), default: 0] += index
    }

    var current = ""
    for char in msg {
        let next = current + String(char)
        
        if dictionary[next] != nil {
            current = next
        } else {
            result.append(dictionary[current]!)
            index += 1
            dictionary[next] = index
            current = String(char)
        }
    }
    result.append(dictionary[current]!)

    return result
}
