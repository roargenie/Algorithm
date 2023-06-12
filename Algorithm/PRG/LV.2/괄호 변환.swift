//
//  괄호 변환.swift
//  Algorithm
//
//  Created by 이명진 on 2023/06/12.
//

import Foundation

func solution(_ p: String) -> String {
    
    func transform(_ p: String) -> String {
        // 1. 입력이 빈 문자열인 경우, 빈 문자열을 반환.
        if p.isEmpty {
            return ""
        }
        
        var u = ""
        var v = ""
        
        // 2. 문자열 p를 균형잡힌 괄호 문자열 u, v로 분리.
        var openCount = 0
        var closeCount = 0
        var index = 0
        
        for char in p {
            if char == "(" {
                openCount += 1
            } else {
                closeCount += 1
            }
            
            index += 1
            
            // 균형잡힌 괄호 문자열이 완성된 경우
            if openCount == closeCount {
                u = String(p.prefix(index))
                v = String(p.suffix(p.count - index))
                break
            }
        }
        
        // 3. 문자열 u가 올바른 괄호 문자열인 경우
        if isCorrect(u) {
            // 3-1. 수행한 결과 문자열을 u에 이어 붙인 후 반환.
            return u + transform(v)
        } else {
            // 4. 문자열 u가 올바른 괄호 문자열이 아닌 경우
            var newString = "("
            
            // 4-2. 문자열 v에 대해 재귀적으로 변환을 수행한 결과를 이어 붙임.
            newString += transform(v)
            
            // 4-3. ')'를 다시 붙임.
            newString += ")"
            
            // 4-4. u의 첫 번째와 마지막 문자를 제거하고 나머지 문자열의 괄호 방향을 뒤집어서 뒤에 붙임.
            u.removeFirst()
            u.removeLast()
            newString += reverse(u)
            
            // 4-5. 생성된 문자열을 반환.
            return newString
        }
    }
    
    // 주어진 문자열이 올바른 괄호 문자열인지 확인하는 함수
    func isCorrect(_ s: String) -> Bool {
        var stack = [Character]()
        
        for char in s {
            if char == "(" {
                stack.append(char)
            } else {
                if stack.isEmpty {
                    return false
                }
                stack.removeLast()
            }
        }
        
        return stack.isEmpty
    }
    
    // 문자열의 괄호 방향을 뒤집는 함수
    func reverse(_ s: String) -> String {
        var reversed = ""
        
        for char in s {
            if char == "(" {
                reversed += ")"
            } else {
                reversed += "("
            }
        }
        
        return reversed
    }
    
    return transform(p)
}
