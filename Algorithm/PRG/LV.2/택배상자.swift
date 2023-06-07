//
//  택배상자.swift
//  Algorithm
//
//  Created by 이명진 on 2023/06/07.
//

import Foundation

func solution(_ order:[Int]) -> Int {
    
    var result = [Int]()
    var stack = [Int]()
    var num = 1
    
    for i in 0..<order.count {
        while num <= order[i] {
            stack.append(num)
            num += 1
        }
        if let box = stack.last, box == order[i] {
            stack.removeLast()
            result.append(box)
        } else {
            break
        }
        
    }
    
    return result.count
}
