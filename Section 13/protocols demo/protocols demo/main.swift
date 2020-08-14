protocol canFly{
    func fly()
}

class Bird{
    var isFemale = true
    
    
    func layEgg(){
        if (isFemale){
            print("layed egg")
        }
    }
  
}


class Eagle: Bird, canFly{
    func fly() {
        print("The agle flaps its wings and lifts off into the sky")
    }
    
    func soar(){
        print("gliding therough the air")
    }
}

class Penguin: Bird{
    func swim(){
        print("paddling")
    }
}

struct FlyingMuesum{
    func flyingDemos(flyingObject: canFly ){
        flyingObject.fly()
    }
}

struct Airplane: canFly {
    func fly() {
        print("the airplane lifts off")
    }
    
    
}


let myEagle = Eagle()
/*
myEagle.fly()
myEagle.layEgg()
myEagle.soar()
 */

let myPenguin = Penguin()
/*
myPenguin.layEgg()
myPenguin.swim()
myPenguin.fly()
 */


let museum = FlyingMuesum()


let myPlane = Airplane()
museum.flyingDemos(flyingObject: myPlane)
