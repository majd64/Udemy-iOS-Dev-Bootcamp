class Enemy{
    var health: Int
    var attackStrength: Int
    
    init (health: Int, attackStrength: Int){
        self.health = health
        self.attackStrength = attackStrength
    }
    
    func takeDamage(amount: Int){
        health -= amount
    }
    func move(){
        print("walk forward")
    }
    func attack(){
        print("land a bit, does \(attackStrength) damage.")
    }
}
