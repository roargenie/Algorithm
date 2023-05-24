//
//  뉴스 클러스터링.swift
//  Algorithm
//
//  Created by 이명진 on 2023/05/24.
//

import Foundation

func solution(_ str1:String, _ str2:String) -> Int {
    
    let strArr1 = Array(str1)
    let strArr2 = Array(str2)
    var twoWordsArr1 = [String]()
    var twoWordsArr2 = [String]()
    
    for i in 0..<strArr1.count - 1 {
        if strArr1[i].isLetter && strArr1[i+1].isLetter {
            twoWordsArr1.append("\(strArr1[i].lowercased())\(strArr1[i+1].lowercased())")
        }
    }
    
    for j in 0..<strArr2.count - 1 {
        if strArr2[j].isLetter && strArr2[j+1].isLetter {
            twoWordsArr2.append("\(strArr2[j].lowercased())\(strArr2[j+1].lowercased())")
        }
    }
    var unionCnt = twoWordsArr1.count + twoWordsArr2.count
    var intersectionCnt = 0
    
    for i in twoWordsArr1.indices {
        for j in twoWordsArr2.indices {
            if twoWordsArr1[i] == twoWordsArr2[j] {
                intersectionCnt += 1
                twoWordsArr2.remove(at: j)
                break
            }
        }
    }
    
    unionCnt -= intersectionCnt
    
    if unionCnt == 0 {
        return 65536
    } else if intersectionCnt == 0 {
        return 0
    } else {
        return Int(Double(intersectionCnt) / Double(unionCnt) * 65536)
    }
    
}
