//
//  오픈채팅방.swift
//  Algorithm
//
//  Created by 이명진 on 2023/05/30.
//

import Foundation

func solution(_ record:[String]) -> [String] {
    
    var dict: [String: String] = [:]
    var result: [String] = []
    
    for i in record {
        let list = i.components(separatedBy: " ")
        let command = list[0]
        let uid = list[1]
        
        if list.count >= 3 {
            let nickName = list[2]
            dict[uid] = nickName
        }
    }
    
    for j in record {
        let list = j.components(separatedBy: " ")
        let command = list[0]
        let uid = list[1]
        
        if command == "Enter" {
            let message = "\(dict[uid]!)님이 들어왔습니다."
            result.append(message)
        } else if command == "Leave" {
            let message = "\(dict[uid]!)님이 나갔습니다."
            result.append(message)
        }
    }
    
    return result
}
