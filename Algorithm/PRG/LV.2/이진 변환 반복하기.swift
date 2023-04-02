
import Foundation

func solution(_ s:String) -> [Int] {
    
    var result = [0, 0]
    var s = s
    
    while s.count > 1 {
        for i in s {
            if i == "0" {
                result[1] += 1
            }
        }
        s = s.components(separatedBy: "0").joined()
        let binary = String(s.count, radix: 2)
        s = binary
        result[0] += 1
    }
    
    return result
}

//MARK: - 시간 초과 걸린 코드

func solution(_ s:String) -> [Int] {
    
    var result = [0, 0]
    var s = Array(s)
    
    while s.count > 1 {
        for i in s {
            if i == "0" {
                if let indexOfZero = s.firstIndex(of: i) {
                    s.remove(at: indexOfZero)
                }
                result[1] += 1
            }
        }
        let binary = String(s.count, radix: 2)
        s = Array(binary)
        result[0] += 1
    }
    
    return result
}
