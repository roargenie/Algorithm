

import Foundation

func solution(_ X:String, _ Y:String) -> String {
    
    var dic: [String: (Int, Int)] = [:]
    var arr = [Int]()
    var result = ""
    
    for i in X {
        if dic[String(i)] == nil {
            dic[String(i)] = (1, 0)
        } else {
            dic[String(i)]!.0 += 1
        }
    }
    for i in Y {
        if dic[String(i)] == nil {
            dic[String(i)] = (0, 1)
        } else {
            dic[String(i)]!.1 += 1
        }
    }
    
    for (key, value) in dic {
        if value.0 > 0 && value.1 > 0 {
            let minCnt = min(value.0, value.1)
            for _ in 0..<minCnt {
                arr.append(Int(key)!)
            }
        }
    }
    
    if arr.isEmpty {
        result = "-1"
    } else {
        if arr.first == 0 {
            result = "0"
        } else {
            result = arr.sorted(by: >).map { String($0) }.joined()
        }
    }
    
    return result
}

// 교집합 이용
func solution1(_ X:String, _ Y:String) -> String {
    let arr1 = Array(X)
    let arr2 = Array(Y)
    let uniqueKey = Set(arr1).intersection(Set(arr2))
    var answer = ""
    for key in uniqueKey.sorted(by: >) {
        answer += String(repeating: key, count: min(arr1.filter{$0 == key}.count, arr2.filter{$0 == key}.count))
    }
    return answer == "" ? "-1" : ((uniqueKey.count == 1 && uniqueKey.contains("0")) ? "0" : answer)
}
