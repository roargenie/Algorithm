//
//  큰 수 만들기.swift
//  Algorithm
//
//  Created by 이명진 on 2023/06/05.
//

import Foundation

func solution(_ number: String, _ k: Int) -> String {
    var stack = [Character]()
    var k = k
    
    for digit in number {
        // 스택에 숫자를 삽입하기 전에 현재 숫자보다 작은 숫자는 스택에서 제거.
        while !stack.isEmpty && stack.last! < digit && k > 0 {
            stack.removeLast()
            k -= 1
        }
        
        stack.append(digit)
    }
    
    // k개의 수를 제거하지 못한 경우 남은 수에서 뒷부분을 자르기.
    stack = Array(stack.prefix(number.count - k))
    
    return String(stack)
}
