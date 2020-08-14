import UIKit

var width: Float = 1.5
var height: Float = 2.3

//single bucket filles 1.5m^2

var bucketOfPaint: Int{
    get{
        return Int(ceil((width * height)/1.5))
    }set{
        print("This amount of paint can cover \(Double(newValue) * 1.5) cm sqaured of area")
    }
}

print(bucketOfPaint)
bucketOfPaint = 8
