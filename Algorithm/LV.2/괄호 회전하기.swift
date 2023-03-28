

import Foundation

func solution(_ s:String) -> Int {
    
    var list = s.map { String($0) }
    
    var count = 0
    
    (0..<s.count).forEach { _ in
        if isCorrect(list) {
            count += 1
        }
        list.append(list.removeFirst())
    }
    
    return count
}

func isCorrect(_ str: [String]) -> Bool {
    var correctBracket = ["()", "[]", "{}"]
    var stack = [String]()
    
    for i in str {
        if !stack.isEmpty {
            if let top = stack.last {
                if correctBracket.contains(top + i) {
                    stack.removeLast()
                } else {
                    stack.append(i)
                }
            }
        } else {
            stack.append(i)
        }
    }
    
    return stack.isEmpty
}
