//
//  소수 찾기.swift
//  Algorithm
//
//  Created by 이명진 on 2023/06/04.
//

import Foundation

func isPrime(_ number: Int) -> Bool {
    if number < 2 {
        return false
    }
    
    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }
    
    return true
}

func solution(_ numbers: String) -> Int {
    var result = Set<Int>()
    
    func permutations(_ str: String, _ prefix: String = "") {
        
        if !prefix.isEmpty {
            if let number = Int(prefix), isPrime(number) {
                result.insert(number)
            }
        }
        
        if str.isEmpty {
            return
        }
        
        for i in 0..<str.count {
            let index = str.index(str.startIndex, offsetBy: i)
            let nextPrefix = prefix + String(str[index])
            
            var remaining = str
            remaining.remove(at: index)
            
            permutations(remaining, nextPrefix)
        }
        
    }
    permutations(numbers, "")
    
    return result.count
}
