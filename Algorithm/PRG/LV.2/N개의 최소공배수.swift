//
//  N개의 최소공배수.swift
//  Algorithm
//
//  Created by 이명진 on 2023/05/15.
//

import Foundation

func solution(_ arr:[Int]) -> Int {
    return arr.reduce(1) { lcm($0, $1) }
}

// 최대공약수
func gcd(_ a: Int, _ b: Int) -> Int {
    let maxNum = max(a, b)
    let minNum = min(a, b)
    
    let remain = maxNum % minNum
    
    return remain == 0 ? minNum : gcd(minNum, remain)
}

// 최소공배수
func lcm(_ a: Int, _ b: Int) -> Int {
    return (a * b) / gcd(a, b)
}
