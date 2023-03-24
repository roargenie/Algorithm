

import Foundation

func solution(_ strings:[String], _ n:Int) -> [String] {
    return strings.sorted(by: <).sorted(by: { $0[$0.index($0.startIndex, offsetBy: n)] < $1[$1.index($1.startIndex, offsetBy: n)] })
}

//MARK: - 더 나은 풀이

func solution(_ strings:[String], _ n:Int) -> [String] {
    return strings.sorted{  Array($0)[n] == Array($1)[n] ? $0 < $1 :  Array($0)[n] < Array($1)[n] }
}

