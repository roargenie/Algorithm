//
//  프렌즈 4블록.swift
//  Algorithm
//
//  Created by 이명진 on 2023/06/02.
//

import Foundation

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    
    var graph = Array(repeating: Array(repeating: " ", count: n), count: m)
    
    var removedArr = Set<[Int]>()
    var result = 0
    var isRemoved = true
    
    for i in 0..<board.count {
        let strArr = board[i].map { String($0) }
        graph[i] = strArr
    }

    while isRemoved {
        var count = 0

        for i in 0..<m - 1 {
            for j in 0..<n - 1 {
                if graph[i][j] == graph[i][j+1] && graph[i+1][j] == graph[i][j] && graph[i+1][j+1] == graph[i][j+1] && graph[i][j] != " " {
                    removedArr.insert([i, j])
                    removedArr.insert([i, j+1])
                    removedArr.insert([i+1, j])
                    removedArr.insert([i+1, j+1])
                    count += 1
                }
            }
        }
        isRemoved = count == 0 ? false : true

        var arr = removedArr.sorted(by: { $0[0] < $1[0] })

        for i in arr {
            graph[i[0]][i[1]] = " "
        }
        result += removedArr.count
        removedArr.removeAll()
        count = 0

        for j in 0..<n {
            var stack = [String]()
            for i in 0..<m {
                if graph[i][j] != " " {
                    stack.append(graph[i][j])
                }
            }
            
            for i in (0..<m).reversed() {
                if stack.isEmpty {
                    graph[i][j] = " "
                } else {
                    graph[i][j] = stack.removeLast()
                }
            }
        }
    }
    
    
    return result
}

//MARK: - 다른 풀이

func solution(_ m: Int, _ n: Int, _ board: [String]) -> Int {
    var board = board.map { Array($0) }
    var erasedCount = 0
    
    while true {
        var erased = Array(repeating: Array(repeating: false, count: n), count: m)
        
        // 블록을 확인하며 지울 블록 표시
        for i in 0..<m-1 {
            for j in 0..<n-1 {
                let block = board[i][j]
                if block == " " {
                    continue
                }
                
                if block == board[i][j+1] &&
                   block == board[i+1][j] &&
                   block == board[i+1][j+1] {
                    erased[i][j] = true
                    erased[i][j+1] = true
                    erased[i+1][j] = true
                    erased[i+1][j+1] = true
                }
            }
        }
        
        // 지워진 블록 수 count
        var count = 0
        for i in 0..<m {
            for j in 0..<n {
                if erased[i][j] {
                    count += 1
                    board[i][j] = " "
                }
            }
        }
        
        if count == 0 {
            break
        }
        
        erasedCount += count
        
        // 블록 떨어뜨리기
        for j in 0..<n {
            var stack = [Character]()
            for i in 0..<m {
                if board[i][j] != " " {
                    stack.append(board[i][j])
                }
            }
            
            for i in (0..<m).reversed() {
                if stack.isEmpty {
                    board[i][j] = " "
                } else {
                    board[i][j] = stack.removeLast()
                }
            }
        }
    }
    
    return erasedCount
}
