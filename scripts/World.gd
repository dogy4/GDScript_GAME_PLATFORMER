extends Node2D

func _ready():
	var Level1 = preload("res://scenes/Level1.tscn").instance()
	add_child(Level1)
	#var Enemy_Wizzard = preload("res://scenes/Enemy_wizzard.tscn").instance()
	#add_child(Enemy_Wizzard)
	#Enemy_Wizzard.position = Vector2(514, 232)

func _process(delta):
	Health()
	combat_system()

func Health():
	if $Hero.lifes < 3:
		$H3.visible = false
	if $Hero.lifes < 2:
		$H2.visible = false

	if $Hero.lifes > 5:
		$Hero.lifes = 5

func combat_system():
	if $Hero.position.x >= ($Enemy_wizzard.position.x-20) and $Hero.position.x <= ($Enemy_wizzard.position.x+20):
		#print("not a cringe")
		$Hero.emit_signal("InflDamage")
