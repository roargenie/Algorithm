

import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    
    // 스테이지 별 도전자 수를 저장할 배열
    var players = Array(repeating: 0, count: N + 1)
    
    // 스테이지 별 도전자 수 계산
    for stage in stages {
        if stage <= N {
            players[stage] += 1
        }
    }
    
    // 스테이지 별 실패율을 저장할 딕셔너리
    var failureRates = [Int: Float]()
    
    // 스테이지 별 실패율 계산
    var challengerCount = stages.count
    for stage in 1...N {
        if challengerCount == 0 {
            failureRates[stage] = 0
        } else {
            let failureCount = players[stage]
            failureRates[stage] = Float(failureCount) / Float(challengerCount)
            challengerCount -= failureCount
        }
    }
    
    // 실패율이 높은 스테이지부터 내림차순으로 정렬
    let result = failureRates.sorted { $0.key < $1.key }.sorted { $0.value > $1.value }.map { $0.key }
    
    return result
}

