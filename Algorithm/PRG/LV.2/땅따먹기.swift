

import Foundation

func solution(_ land:[[Int]]) -> Int{
    var land = land
    for i in 0..<land.count - 1 {
        land[i+1][0] += max(land[i][1], land[i][2], land[i][3])
        land[i+1][1] += max(land[i][0], land[i][2], land[i][3])
        land[i+1][2] += max(land[i][0], land[i][1], land[i][3])
        land[i+1][3] += max(land[i][0], land[i][1], land[i][2])
    }
    
    guard let last = land.last else { return 0 }

    return max(last[0], last[1], last[2], last[3])
}


func solution1(_ land:[[Int]]) -> Int{
    var dp = land
    
    for i in 1..<land.count {
        for j in 0..<land[0].count {
            for k in 0..<land[0].count {
                if j == k { continue }
                dp[i][j] = max(dp[i][j], dp[i-1][k] + land[i][j])
            }
        }
    }
    
    return dp.last!.max()!
}
