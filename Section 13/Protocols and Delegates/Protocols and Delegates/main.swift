protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler{
    var delegate: AdvancedLifeSupport?
    
    func assesSituation(){
        print("tell me what happened")
    }
    
    func medicalEmergancy(){
        delegate?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSupport{
    init(handler: EmergencyCallHandler){
        handler.delegate = self
    }
    func performCPR() {
        print("doing CPR")
    }
}

class Doctor: AdvancedLifeSupport{
    init(handler: EmergencyCallHandler){
        handler.delegate = self
    }
    func performCPR() {
        print("doing CPR in style")
    }
    func useStethoscope(){
        print("listining")
    }
}

class Surgeon: Doctor{
    override func performCPR() {
        super.performCPR()
        print("singing staying alive")
    }
    func useElectricDrill(){
        print("whirrr")
    }
}

let jack = EmergencyCallHandler()
let angle = Surgeon(handler: jack)

jack.assesSituation()
jack.medicalEmergancy()
