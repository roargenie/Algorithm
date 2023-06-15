//
//  문자열 압축.swift
//  Algorithm
//
//  Created by 이명진 on 2023/06/15.
//

import Foundation

func solution(_ s: String) -> Int {
    
    let n = s.count
    if n <= 2 { return n }
    
    var answer = n

    for i in 1...n/2 {
        var compressed = ""
        var prev = ""
        var count = 1

        for j in stride(from: 0, to: n, by: i) {
            let start = s.index(s.startIndex, offsetBy: j)
            let end = s.index(start, offsetBy: i, limitedBy: s.endIndex) ?? s.endIndex
            let substring = String(s[start..<end])

            if substring == prev {
                count += 1
            } else {
                if count > 1 {
                    compressed += "\(count)\(prev)"
                } else {
                    compressed += prev
                }
                prev = substring
                count = 1
            }
        }

        if count > 1 {
            compressed += "\(count)\(prev)"
        } else {
            compressed += prev
        }

        answer = min(answer, compressed.count)
    }

    return answer
}
