//
//  JadenCase 문자열 만들기.swift
//  Algorithm
//
//  Created by 이명진 on 2023/05/13.
//

import Foundation

func solution(_ s:String) -> String {
    
    let letters = Array(s)
    var isBeforeBlank = true
    var result: String = ""
    
    for letter in letters {
        result += (isBeforeBlank ? letter.uppercased() : letter.lowercased())
        isBeforeBlank = (letter == " ")
    }
    
    return result
}

// 더 나은 풀이

func solution1(_ s:String) -> String {
    
    let letters = Array(s)
    var isBeforeBlank = true
    var result: String = ""
    
    for letter in letters {
        result += (isBeforeBlank ? letter.uppercased() : letter.lowercased())
        isBeforeBlank = (letter == " ")
    }
    
    return result
}
