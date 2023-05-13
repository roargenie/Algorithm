//
//  카펫.swift
//  Algorithm
//
//  Created by 이명진 on 2023/05/13.
//

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let area = brown + yellow
    var width = 0
    var height = 0
    var result = [Int]()
    
    for i in 3...(area / 3) {
        
        if area % i == 0 {
            width = i
            height = area / i
            
            if (width - 2) * (height - 2) == yellow {
                result = [width, height].sorted(by: >)
                break
            }
        }
    }
    return result
}

// 더 나은 풀이

func solution1(_ brown: Int, _ red: Int) -> [Int] {
    for n in (1...Int(sqrt(Double(red)))).reversed() {
        if (red/n+2) * (n+2) == (brown + red) {
            return [(red/n+2), n+2]
        }
    }
    return [0, 0]
}
