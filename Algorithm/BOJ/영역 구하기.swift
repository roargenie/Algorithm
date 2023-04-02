//
//  main.swift
//  Algorithm
//
//  Created by 이명진 on 2023/04/02.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let m = input[0]
let n = input[1]
let k = input[2]

var graph = Array(repeating: Array(repeating: 0, count: n), count: m)
var rectPoints: [[Int]] = []

for _ in 0..<k {
    let rectPoint = readLine()!.split(separator: " ").map { Int(String($0))! }
    rectPoints.append(rectPoint)
}

for i in 0..<rectPoints.count {
    let leftPoint = (rectPoints[i][0], rectPoints[i][1])
    let rightPoint = (rectPoints[i][2], rectPoints[i][3])
    
    for j in leftPoint.0..<rightPoint.0 {
        for k in leftPoint.1..<rightPoint.1 {
            graph[k][j] = 1
        }
    }
}

let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]
var result = [Int]()
var count = 0

func dfs(_ x: Int, _ y: Int) {
    for i in 0..<dx.count {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if nx < 0 || ny < 0 || nx > n - 1 || ny > m - 1 {
            continue
        } else {
            if graph[ny][nx] == 0 {
                graph[ny][nx] = 1
                count += 1
                dfs(nx, ny)
            }
        }
    }
}

for i in 0..<m {
    for j in 0..<n {
        if graph[i][j] == 0 {
            graph[i][j] = 1
            count += 1
            dfs(j, i)
            result.append(count)
            count = 0
        }
    }
}

print(result.count)
result.sort()
var resultString = ""
for i in result {
    resultString += "\(i) "
}
print(resultString)

