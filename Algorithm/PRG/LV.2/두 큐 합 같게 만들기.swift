//
//  두 큐 합 같게 만들기.swift
//  Algorithm
//
//  Created by 이명진 on 2023/06/07.
//

import Foundation

func solution(_ queue1: [Int], _ queue2: [Int]) -> Int {
    var result = 0
    
    var leftPointer = 0
    var rightPointer = queue1.count
    
    var sum1 = queue1.reduce(0, +)
    var sum2 = queue2.reduce(0, +)
    
    var array = queue1 + queue2
    var targetNum = (sum1 + sum2) / 2
    
    if (sum1 + sum2) % 2 != 0 {
        return -1
    }
    
    while rightPointer < array.count && leftPointer <= rightPointer {
        if sum1 < targetNum {
            sum1 += array[rightPointer]
            rightPointer += 1
        } else if sum1 > targetNum {
            sum1 -= array[leftPointer]
            leftPointer += 1
        } else {
            break
        }
        result += 1
    }
    
    if sum1 != targetNum {
        return -1
    }
    
    return result
}
