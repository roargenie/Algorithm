
import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    
    var result = [[Int]]()
    
    for i in 0..<arr1.count {
        result.append([])
        for j in 0..<arr1[i].count {
            result[i].append(arr1[i][j] + arr2[i][j])
        }
    }
    
    return result
}

//MARK: - 더 나은 풀이

func solution1(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    return zip(arr1, arr2).map{zip($0,$1).map{$0+$1}}
}

