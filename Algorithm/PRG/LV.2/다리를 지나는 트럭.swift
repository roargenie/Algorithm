//
//  다리를 지나는 트럭.swift
//  Algorithm
//
//  Created by 이명진 on 2023/06/03.
//

import Foundation

struct Truck {
    let weight: Int
    var position: Int
}

func solution(_ bridge_length: Int, _ weight: Int, _ truck_weights: [Int]) -> Int {
    var bridge = [Truck]()
    var trucks = truck_weights.map { Truck(weight: $0, position: 0) }
    var time = 0
    var currentWeight = 0
    
    while !trucks.isEmpty || !bridge.isEmpty {
        time += 1
        
        // 다리에서 나와야 할 트럭이 있는지 확인
        if let firstTruck = bridge.first, firstTruck.position >= bridge_length {
            currentWeight -= firstTruck.weight
            bridge.removeFirst()
        }
        
        // 다리에 트럭을 올릴 수 있는지 확인
        if let nextTruck = trucks.first, currentWeight + nextTruck.weight <= weight {
            currentWeight += nextTruck.weight
            trucks.removeFirst()
            bridge.append(nextTruck)
        }
        
        // 다리와 트럭들의 위치 업데이트
        for i in bridge.indices {
            bridge[i].position += 1
        }
    }
    
    return time
}
