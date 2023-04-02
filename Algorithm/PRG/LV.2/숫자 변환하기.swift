

import Foundation

//MARK: - DP

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    var dp = Array(repeating: -1, count: y+1)
    dp[x] = 0
    
    for i in x...y {
        if dp[i] == -1 { continue }
        
        if i*2 <= y && (dp[i*2] == -1 || dp[i*2] > dp[i]+1) {
            dp[i*2] = dp[i]+1
        }
        if i*3 <= y && (dp[i*3] == -1 || dp[i*3] > dp[i]+1) {
            dp[i*3] = dp[i]+1
        }
        if i+n <= y && (dp[i+n] == -1 || dp[i+n] > dp[i]+1) {
            dp[i+n] = dp[i]+1
        }
    }
    
    return dp[y]
}

//MARK: - BFS

func solution1(_ x:Int, _ y:Int, _ n:Int) -> Int {
    var queue: [(Int, Int)] = [(x, 0)]
    var front = 0
    var answer = -1
    var visit = Set<Int>()
    
    while front < queue.count {
        let (num, count) = queue[front]
        front += 1
        if num == y { answer = count; break }
        if num > y { continue }

        if !visit.contains(num + n) {
            queue.append((num + n, count + 1))
            visit.insert(num + n)
        }
        if !visit.contains(num * 2) {
            queue.append((num * 2, count + 1))
            visit.insert(num * 2)
        }

        queue.append((num * 3, count + 1))
    }

    return answer
}


