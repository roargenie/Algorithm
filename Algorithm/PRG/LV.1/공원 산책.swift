//
//  공원 산책.swift
//  Algorithm
//
//  Created by 이명진 on 2023/06/18.
//

import Foundation

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    var route = [[String]]()
    var start = [0,0]
    var dict = ["E": 1, "S": 1, "W": -1, "N": -1]
    
    for i in 0..<park.count {            // 공원을 2차원배열로 변경 및 시작점 찾기
        let arr = Array(park[i]).map{String($0)}
        if arr.contains("S") {
            start[0] = i
            for j in 0..<arr.count {
                if arr[j] == "S" {
                    start[1] = j
                }
            }
        }
        route.append(arr)
    }
    
    for i in 0..<routes.count {         //명령들 순회
        var arr = routes[i].split(separator: " ").map{ String($0)}
        var move = dict[arr[0]]! * Int(arr[1])!
        let rowIdx = route[0].count - 1
        let colIdx = route.count - 1
        var check = [String]()
        
        if arr[0] == "E" || arr[0] == "W" {
            var moved = start[1] + move
            if moved < 0 || moved > rowIdx {    // 움직였을때 맵 밖으로 나갔는지 확인
                continue
            }
            if arr[0] == "E" {                  // 움직인 범위의 배열 추출
                for j in start[1]...moved {
                check.append(route[start[0]][j])
                }
            } else {
                for j in moved...start[1] {
                check.append(route[start[0]][j])
                }
            }
            if check.contains("X") {            // 장애물 있는지 확인
                continue
            } else {
                start = [start[0], moved]
            }
        }
        
        if arr[0] == "S" || arr[0] == "N" {
            var moved = start[0] + move
            if moved < 0 || moved > colIdx {    // 움직였을때 맵 밖으로 나갔는지 확인
                continue
            }
            if arr[0] == "S" {                  // 움직인 범위의 배열 추출
                for j in start[0]...moved {
                check.append(route[j][start[1]])
                }
            } else {
                for j in moved...start[0] {
                check.append(route[j][start[1]])
                }
            }
            if check.contains("X") {            // 장애물 있는지 확인
                continue
            } else {
                start = [moved, start[1]]
            }
        }
        
    }
    
    return start
}
