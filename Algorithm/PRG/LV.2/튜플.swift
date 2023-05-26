//
//  튜플.swift
//  Algorithm
//
//  Created by 이명진 on 2023/05/26.
//

import Foundation

func solution(_ s:String) -> [Int] {
    
    var dict: [Int: Int] = [:]
    
    var s = s.replacingOccurrences(of: "}", with: "").replacingOccurrences(of: "{", with: "").components(separatedBy: ",")
    for i in s {
        if Int(i) != nil {
            dict[Int(i)!, default: 0] += 1
        }
    }
    
    return dict.sorted(by: { $0.value > $1.value } ).map { $0.key }
}
