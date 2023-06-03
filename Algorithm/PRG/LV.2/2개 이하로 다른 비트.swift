//
//  2개 이하로 다른 비트.swift
//  Algorithm
//
//  Created by 이명진 on 2023/06/02.
//

import Foundation

func solution(_ numbers:[Int64]) -> [Int64] {
    var result = [Int64]()
    
    for num in numbers {
        if num % 2 == 0 {
            result.append(num + 1)
        } else {
            var binary = Array(String(num, radix: 2))
            
            if binary[0] == Character("1") {
                binary.insert(Character("0"), at: 0)
            }
            
            for i in (0..<binary.count).reversed() {
                if binary[i] == Character("0") {
                    binary[i] = Character("1")
                    binary[i+1] = Character("0")
                    break
                }
            }
            
            result.append(Int64(String(binary), radix: 2)!)
        }
    }
    
    return result
}
