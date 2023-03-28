

import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    
    var dic: [Int: Int] = [:]
    var count = 0
    var kindOfTangerine = 0
    
    for i in tangerine {
        if dic[i] == nil {
            dic[i] = 1
        } else {
            dic[i]! += 1
        }
    }
    for (_, value) in dic.sorted(by: { $0.value > $1.value }) {
        if count + value >= k {
            kindOfTangerine += 1
            break
        }
        count += value
        kindOfTangerine += 1
    }
    
    return kindOfTangerine
}
