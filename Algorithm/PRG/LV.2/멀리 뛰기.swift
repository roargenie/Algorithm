

import Foundation

//MARK: - 피보나치 수열

func solution(_ n:Int) -> Int64 {
    
    var result = [1, 2]
    
    while result.count < n {
        result.append((result[result.endIndex - 1] + result[result.endIndex - 2]) % 1234567)
    }
    
    return Int64(result[n - 1])
}

//MARK: - DFS

func solution1(_ n:Int) -> Int {
    var memo: [Int: Int] = [:]
    
    func dfs(_ number: Int) -> Int {
        if let count = memo[number] {
            return count
        }
        if number == n { return 1 }
        
        if number > n { return 0 }
        
        var cnt = 0
        cnt += dfs(number + 1) % 1234567
        cnt += dfs(number + 2) % 1234567
        memo[number] = cnt
        
        return cnt
    }
    
    return dfs(0) % 1234567
}
