

import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var result = 0
    
    func dfs(_ depth: Int, _ sum: Int) {
        if depth == numbers.count {
            if target == sum {
                result += 1
            }
            return
        }
        
        dfs(depth + 1, sum + numbers[depth])
        dfs(depth + 1, sum - numbers[depth])
    }
    
    dfs(0, 0)
    return result
}

func solution1(_ numbers:[Int], _ target:Int) -> Int {
    func dfs(_ depth: Int, _ sum: Int) -> Int {
        if depth == numbers.count {
            return sum == target ? 1 : 0
        }
        
        let result = dfs(depth + 1, sum + numbers[depth]) + dfs(depth + 1, sum - numbers[depth])
        return result
    }
    
    return dfs(0, 0)
}
