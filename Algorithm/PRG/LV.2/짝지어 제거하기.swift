//
//  짝지어 제거하기.swift
//  Algorithm
//
//  Created by 이명진 on 2023/05/11.
//

import Foundation

func solution(_ s:String) -> Int {
    var stack = [Character]()
    
    for char in s {
        if let last = stack.last, last == char {
            stack.removeLast()
        } else {
            stack.append(char)
        }
    }
    return stack.isEmpty ? 1 : 0
}
