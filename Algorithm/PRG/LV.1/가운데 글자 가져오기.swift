

import Foundation

func solution(_ s:String) -> String {
    
    var strArr = s.map { String($0) }
    
    if s.count % 2 == 0 {
        return strArr[s.count / 2 - 1...s.count / 2].joined()
    } else {
        return strArr[s.count / 2]
    }
}

//MARK: - 더 나은 풀이

func solution(_ s:String) -> String {

    return String(s[String.Index(encodedOffset: (s.count-1)/2)...String.Index(encodedOffset: s.count/2)])
}

