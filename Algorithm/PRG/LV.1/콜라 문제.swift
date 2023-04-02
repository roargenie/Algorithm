

import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var a = a
    var n = n
    var result = 0
    
    if n < a {
        return 0
    } else {
        while n >= a {
            result += (n / a) * b
            n = (n / a) * b + (n % a)
        }
    }
    return result
}
