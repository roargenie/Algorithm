

import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    
    var stack: [Int] = []
    var visited: [Bool] = Array(repeating: false, count: n)
    var result = 0
    
    for i in 0..<n {
        if !visited[i] {
            result += 1
            stack.append(i)
            
            while !stack.isEmpty {
                let top = stack.popLast()!
                visited[top] = true
                
                for j in 0..<n {
                    if j != top && computers[top][j] == 1 && !visited[j] {
                        stack.append(j)
                    }
                }
            }
        }
    }
    
    return result
}


func solution1(_ n:Int, _ computers:[[Int]]) -> Int {
    
    var visited: [Bool] = Array(repeating: false, count: n)
    var result = 0
    
    for i in 0..<n {
        if !visited[i] {
            dfs(i, n, computers, &visited)
            result += 1
        }
    }
    
    return result
}

func dfs(_ x: Int, _ n: Int, _ computers: [[Int]], _ visited: inout [Bool]) {
    visited[x] = true
    
    for i in 0..<n {
        if !visited[i] && computers[x][i] == 1 {
            dfs(i, n, computers, &visited)
        }
    }
}
