extends CharacterBody2D

@onready var animation = $Animation
@onready var characterbody2d = %CharacterBody2D

const SPEED_STEP = 5
var speed = 0

const THRUST_STEP = 5
const THRUST_MAX = 100
var thrust = 0

func _process(delta):
	var right = Input.is_action_pressed("ui_right")
	var left = Input.is_action_pressed("ui_left")
	var jump = Input.is_action_pressed("ui_accept")
	
	if right:
		speed += SPEED_STEP
		print(speed)
		characterbody2d.position.x += SPEED_STEP
		animation.play("right")
	elif left:
		speed -= SPEED_STEP
		characterbody2d.position.x -= SPEED_STEP
		animation.play("left")
	elif jump:
		thrust += THRUST_STEP
		if thrust >= THRUST_MAX:
			thrust = THRUST_MAX
			animation.play("thrust_max")
		else:
			animation.play("jump")
	else:
		thrust = 0
		speed = 0
		animation.play("idle")
		characterbody2d.velocity.x = speed

	move_and_slide()
