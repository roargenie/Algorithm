

import Foundation


func solution(_ ingredient:[Int]) -> Int {
    var stack: [Int] = []
    var ans = 0
    
    for i in ingredient {
        
        stack.append(i)
        
        if stack.count < 4 { continue }
        
        let n = stack.count
        if Array(stack[n-4..<n]) == [1, 2, 3, 1] {
            stack = Array(stack[0..<n-4])
            ans += 1
        }
        
    }
    return ans
}

func solution(_ ingredient:[Int]) -> Int {
    var stack: [Int] = []
    var count: Int = 0
    
    for i in ingredient {
        stack.append(i)
        
        let suffix = stack.suffix(4)
        
        if suffix == [1,2,3,1] {
            count += 1
            stack.removeLast(4)
        }
    }
    return count
}

func solution(_ ingredient:[Int]) -> Int {
    var stack: [Int] = []
    var ans = 0
    
    for i in ingredient {
        
        stack.append(i)
        
        if stack.count < 4 { continue }
        
        if Array(stack.suffix(4) == [1, 2, 3, 1] {
            stack = Array(stack.suffix(4))
            ans += 1
        }
        
    }
    return ans
}

// stack.suffix(n) 은 왜 안되지? 실패 케이스가 뭔지 모르겠다.
