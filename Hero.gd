extends KinematicBody2D

var motion = Vector2.ZERO
const UP = Vector2(0,1)
const Accel = 10
const MaxSpeed = 150
const MaxFallSpeed = 300
const Gravity = 20
const JumpForse = 400

func _ready():
	motion.x = clamp(motion.x, -MaxSpeed, MaxSpeed)	

func _physics_process(delta):
	if Input.is_action_pressed("Right"):
		motion.x += Accel
	elif Input.is_action_pressed("Left"):
		motion.x -= Accel
	else: 
		motion.x = lerp(motion.x,0,0.2)
	
	motion.y += Gravity
	if motion.y > MaxFallSpeed:
		motion.y = MaxFallSpeed

		if Input.is_action_just_pressed("Up"):
			motion.y = -JumpForse
		
	motion = move_and_slide(motion,UP)
