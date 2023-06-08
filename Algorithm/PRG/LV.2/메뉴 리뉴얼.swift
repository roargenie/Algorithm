//
//  메뉴 리뉴얼.swift
//  Algorithm
//
//  Created by 이명진 on 2023/06/08.
//

import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var set = [String: Int]()
    
    func dfs(index: Int, origin: [Character], newString: String) {
        if course.last! < newString.count{
            return
        }
        
        if course.contains(newString.count) {
            if set.keys.contains(newString) {
                set[newString]! += 1
            } else {
                set[newString] = 1
            }
        }
        
        for i in index..<origin.count {
            let c = origin[i]
            dfs(index: i+1, origin:  origin, newString: "\(newString)\(c)")
        }
    }
    
    for order in orders {
        let order = order.sorted()
        dfs(index: 0, origin: order, newString: "")
    }
    
    var result = [String]()
    
    for length in course {
        let temp = set.filter { $0.key.count == length && $0.value > 1 }
        let maxNum = temp.max { $0.value < $1.value }
        let menu = temp.filter { maxNum!.value == $0.value }.map { $0.key }
        result.append(contentsOf: menu)
    }
    return result.sorted()
    
}
