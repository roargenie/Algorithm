//
//  기능개발.swift
//  Algorithm
//
//  Created by 이명진 on 2023/05/25.
//

import Foundation

func solution(_ progresses: [Int], _ speeds: [Int]) -> [Int] {
    var daysRemaining: [Int] = []
    var result: [Int] = []

    // 작업이 완료되는데 걸리는 날짜 계산
    for i in 0..<progresses.count {
        let progress = progresses[i]
        let speed = speeds[i]
        let remaining = 100 - progress
        let days = remaining % speed == 0 ? remaining / speed : remaining / speed + 1
        daysRemaining.append(days)
    }

    var prevDay = daysRemaining[0] // 첫 번째 작업의 남은 일수
    var count = 1 // 배포되는 기능 개수

    // 작업별로 배포되는 기능 개수 계산
    for i in 1..<daysRemaining.count {
        let currentDay = daysRemaining[i]
        if currentDay <= prevDay {
            count += 1
        } else {
            result.append(count)
            count = 1
            prevDay = currentDay
        }
    }

    result.append(count) // 마지막 배포 기능 개수 추가

    return result
}

//MARK: - 더 나은 풀이

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var lastReleaseDate: Int = 0
    var numOfReleases: [Int] = []
    
    for i in 0..<progresses.count {
        let progress = Double(progresses[i])
        let speed = Double(speeds[i])
        let day = Int(ceil((100 - progress) / speed))
        
        if day > lastReleaseDate {
            lastReleaseDate = day
            numOfReleases.append(1)
        } else {
            numOfReleases[numOfReleases.count - 1] += 1
        }
    }
    
    return numOfReleases
}

