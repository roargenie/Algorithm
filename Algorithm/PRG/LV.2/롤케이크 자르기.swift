//
//  롤케이크 자르기.swift
//  Algorithm
//
//  Created by 이명진 on 2023/06/04.
//

import Foundation

func solution(_ topping:[Int]) -> Int {
    
    // 전체 토핑 종류별 갯수
    var dic1 = topping.reduce(into: [Int: Int]()) {
        $0[$1, default: 0] += 1
    }
    
    // 잘라질 토핑 종류별 갯수를 담을 딕셔너리
    var dic2: [Int: Int] = [:]
    
    return topping.reduce(0) { result, topping in
        // 전체 토핑 종류에서 갯수가 1이면 -1을 했을때 종류에서 빠져야 하기 때문에 nil할당
        dic1[topping] = dic1[topping] == 1 ? nil : dic1[topping]! - 1
        // 잘라질 토핑 종류를 담을 딕셔너리에 추가
        dic2[topping, default: 0] += 1
        
        // 딕셔너리의 키 값의 갯수가 같을경우 reduce(0) = result 이기 때문에 결과값에 1추가
        return dic1.count == dic2.count ? result + 1 : result
    }
}
