let skeleton = Enemy(health: 3, attackStrength: 392)

print(skeleton.health)

let dragon = Dragon(health: 3, attackStrength: 39)
dragon.attackStrength = 15
dragon.wingSpan = 5
dragon.talk(speech: "my teeth are swords")

dragon.move()
dragon.attack()




