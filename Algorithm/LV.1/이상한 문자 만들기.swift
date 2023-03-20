

import Foundation

func solution(_ s:String) -> String {
    
    var result = [String]()
    var str = ""
    var strArr = s.components(separatedBy: " ")
    
    for i in strArr {
        for (index, value) in i.enumerated() {
            if index % 2 == 0 {
                str += value.uppercased()
            } else {
                str += value.lowercased()
            }
        }
        result.append(str)
        str = ""
    }
    
    return result.joined(separator: " ")
}

//MARK: - 더 나은 풀이

func solution1(_ s:String) -> String {
    let a = s.components(separatedBy: " ").map { $0.enumerated().map { $0.offset % 2 == 0 ? $0.element.uppercased() : $0.element.lowercased() } }
    return a.map{ $0.map { $0 }.joined() }.joined(separator: " ")
}

