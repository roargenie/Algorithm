//
//  피보나치 수.swift
//  Algorithm
//
//  Created by 이명진 on 2023/05/10.
//

import Foundation

func solution(_ n:Int) -> Int {
    var fib = [0, 1]
    
    for i in 2...n {
        fib.append((fib[i-1] + fib[i-2]) % 1234567)
    }
    
    return fib[n]
}
