//
//  숫자 문자열과 영단어.swift
//  Algorithm
//
//  Created by 이명진 on 2023/05/18.
//

import Foundation

func solution(_ s:String) -> Int {
    
    var dic = ["zero": "0", "one": "1", "two": "2", "three": "3", "four": "4",
              "five": "5", "six": "6", "seven": "7", "eight": "8", "nine": "9"]
    var result = [String]()
    var words = ""
    
    for i in s {
        if dic.values.contains(String(i)) {
            result.append(String(i))
        } else {
            words += String(i)
        }
        if let num = dic[words] {
            result.append(num)
            words = ""
        }
    }
    
    return Int(result.joined())!
}
