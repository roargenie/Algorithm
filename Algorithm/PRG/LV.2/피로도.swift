//
//  피로도.swift
//  Algorithm
//
//  Created by 이명진 on 2023/05/25.
//

import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var result = 0
    
    var visited = [Bool](repeating: false, count: dungeons.count)
    
    
    func dfs(_ count: Int, _ pirodo: Int){
        if result < count{
            result = count
        }
        for i in 0..<dungeons.count{
            if !visited[i] && dungeons[i][0] <= pirodo{
                visited[i] = true
                dfs(count + 1, pirodo - dungeons[i][1])
                visited[i] = false
            }
        }
    }
    
    dfs(0, k)
    
    return result
}
