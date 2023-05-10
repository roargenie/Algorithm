//
//  올바른 괄호.swift
//  Algorithm
//
//  Created by 이명진 on 2023/05/10.
//

import Foundation

func solution(_ s:String) -> Bool {
    
    let arr = Array(s)
    var answer = true
    var stack = 0
    
    for i in arr {
        if i == "(" {
            stack += 1
        } else {
            if stack == 0 {
                answer = false
                break
            } else {
                stack -= 1
            }
        }
    }
    
    if stack > 0 {
        answer = false
    }
    
    return answer
    
}
