//
//  택배 배달과 수거하기.swift
//  Algorithm
//
//  Created by 이명진 on 2023/06/16.
//

import Foundation

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    
    var deliveries = deliveries
    var pickups = pickups
    var result = 0
    
    while !deliveries.isEmpty || !pickups.isEmpty {
        deliveries.trimZeroSuffix()
        pickups.trimZeroSuffix()
        
        result += max(deliveries.count, pickups.count) * 2
        var temp = 0
        
        while !deliveries.isEmpty && temp < cap {
            if deliveries.last! + temp <= cap {
                temp += deliveries.removeLast()
            } else {
                deliveries[deliveries.count - 1] = deliveries.last! - (cap - temp)
                temp += cap - temp
            }
        }
        
        temp = 0
        
        while !pickups.isEmpty && temp < cap {
            if pickups.last! + temp <= cap {
                temp += pickups.removeLast()
            } else {
                pickups[pickups.count - 1] = pickups.last! - (cap - temp)
                temp += cap - temp
            }
        }
        
    }
    
    return Int64(result)
}

extension Array where Element == Int {
    mutating func trimZeroSuffix() {
        while self.last ?? 1 == 0 {
            self.removeLast()
        }
    }
}

//MARK: - 더 나은 풀이

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    var ans: Int64 = 0

    var d = 0
    var p = 0

    for i in stride(from: n-1, through: 0, by: -1) {
        d += deliveries[i]
        p += pickups[i]

        while d > 0 || p > 0 {
            d -= cap
            p -= cap
            ans += Int64((i + 1) * 2)
        }
    }

    return ans
}

