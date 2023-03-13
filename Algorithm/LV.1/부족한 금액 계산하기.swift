

import Foundation


func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    
    var price1 = price
    var charge = 0
    
    for i in 1...count {
        price1 = price * i
        charge += price1
        price1 = price
    }
    
    return money - charge > 0 ? Int64(0) : Int64(charge - money)
}
