extends CharacterBody2D

const SPEED = 100
var motion = Vector2()
@onready var animation = $Animation

func _physics_process(delta):
	move_and_slide()

func _process(delta):
	var right = Input.is_action_pressed("ui_right")
	var left =  Input.is_action_pressed("ui_left")
	var jump = Input.is_action_pressed("ui_accept")
	
	if right:
		animation.play("jump")
	elif left:
		animation.play("jump")
	elif jump:
		animation.play("jump")
	else:
		animation.play("idle")
