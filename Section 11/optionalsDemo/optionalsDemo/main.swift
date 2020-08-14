let myOptional: String?

myOptional = nil

//checking for nil
//very wordy -> not ideal
if myOptional != nil{
    print(myOptional!)
}else{
    print("skipped")
}

//optional binding
//this is good but we cannot assign default value if nil
if let safeOptional = myOptional{
    let var3:String = safeOptional
    print(var3)
}

//nil coalescing operator
let text:String = myOptional ?? "default value"

print(text)





struct PossibleStruct{
    var property:Int = 123
    func method(){
        print("i am a possible struct")
    }
}

let possibleStruct: PossibleStruct?

possibleStruct = PossibleStruct()


//optional chaining ----> ?
print(possibleStruct?.property)
