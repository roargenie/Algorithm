

import Foundation

func solution(_ s:String) -> Bool {
    
    var alphabets = "abcdefghijklmnopqrstuvwxyz".map { String($0) }
    var result = false
    
    if s.count == 4 || s.count == 6 {
        for i in s {
            if alphabets.contains(i.lowercased()) {
                result = false
                break
            } else {
                result = true
            }
        }
    } else {
        return false
    }
    
    return result
}

//MARK: - 더 나은 풀이

func solution1(_ s:String) -> Bool {
    return (Int(s) != nil && (s.count == 4 || s.count == 6)) ? true : false
}

