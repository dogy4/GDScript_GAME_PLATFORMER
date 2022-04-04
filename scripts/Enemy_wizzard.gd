extends KinematicBody2D

var motion = Vector2.ZERO
const UP = Vector2(0,1)
const Accel = 10
const MaxSpeed = 175
const MaxFallSpeed = 300
const Gravity = 20
const JumpForse = 400
var enemy_lifes = 1
signal InflDamage

func _ready():
	motion.x = clamp(motion.x, -MaxSpeed, MaxSpeed)	

func _physics_process(delta):
	movement()
	death()

func movement():
	
	
	if motion.x>MaxSpeed:
		motion.x = MaxSpeed
	
	if motion.x<-MaxSpeed:
		motion.x = -MaxSpeed
	
	motion.y += Gravity
	if motion.y > MaxFallSpeed:
		motion.y = MaxFallSpeed

	motion = move_and_slide(motion,UP)

	
func death():
	if position.y > 600:
		queue_free()
	if enemy_lifes < 1:
		queue_free()
	

func _on_Hero_InflDamage():
	enemy_lifes = 0
