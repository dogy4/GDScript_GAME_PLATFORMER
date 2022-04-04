extends KinematicBody2D

var motion = Vector2.ZERO
const UP = Vector2(0,1)
const Accel = 10
const MaxSpeed = 175
const MaxFallSpeed = 300
const Gravity = 20
const JumpForse = 400
var lifes = 3
signal InflDamage

func _ready():
	motion.x = clamp(motion.x, -MaxSpeed, MaxSpeed)
func _physics_process(delta):
	movement()
	death()
	falling()

func movement():
	if Input.is_action_pressed("Right"):
		motion.x += Accel
	elif Input.is_action_pressed("Left"):
		motion.x -= Accel
	else: 
		motion.x = lerp(motion.x,0,0.2)
	
	if motion.x>MaxSpeed:
		motion.x = MaxSpeed
	
	if motion.x<-MaxSpeed:
		motion.x = -MaxSpeed
	
	motion.y += Gravity
	if motion.y > MaxFallSpeed:
		motion.y = MaxFallSpeed

	motion = move_and_slide(motion,UP)

	if is_on_ceiling():
		if Input.is_action_just_pressed("Up"):
			motion.y = -JumpForse
	
func death():
	if lifes < 1:
		get_tree().reload_current_scene()

func falling():
	if position.y > 600:
		position = Vector2(194, 89)
		lifes -= 1
