//
//  k진수에서 소수 개수 구하기.swift
//  Algorithm
//
//  Created by 이명진 on 2023/05/26.
//

import Foundation

func solution(_ n: Int, _ k: Int) -> Int {
    var transformNumberArr = String(n, radix: k).components(separatedBy: "0")
    var result = 0
    
    for i in transformNumberArr {
        if let number = Int(i) {
            if isPrime(number) {
                result += 1
            }
        }
    }
    
    return result
}

func isPrime(_ number: Int) -> Bool {
    if number <= 1 {
        return false
    } else if number == 2 || number == 3 {
        return true
    }
    
    for i in 2...Int(sqrt(Double(number))) {
        if number % i == 0 {
            return false
        }
    }
    
    return true
}
