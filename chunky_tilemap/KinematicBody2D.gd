extends KinematicBody2D

var velocity = Vector2()
export var speed = 300 # player speed

func get_input():

	# Detect up/down/left/right keystate and only move when pressed
	velocity = Vector2()
	if Input.is_action_pressed('MOVE_RIGHT'):
		velocity.x += 1
	if Input.is_action_pressed('MOVE_LEFT'):
		velocity.x -= 1
	if Input.is_action_pressed('MOVE_DOWN'):
		velocity.y += 1
	if Input.is_action_pressed('MOVE_UP'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity, Vector2(0, -1))