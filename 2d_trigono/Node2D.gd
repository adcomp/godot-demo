extends Node2D

var sprite = preload("res://Sprite.tscn")
var max_shape = 32;
var radius = 96;
var t = 0; # time 1
var n = 0; # time 2
var shape = []
var running = false

func _ready():
	for i in max_shape:
		var new_shape = sprite.instance()
		add_child(new_shape)
		shape.push_back(new_shape)


func _process(delta):
	# press ESC to quit
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
	# press SPACE to start/stop animation
	if Input.is_action_just_pressed("ui_accept"):
		running = not running

	if running:
		for i in max_shape:
			var rad = deg2rad(t+i*360/max_shape)
			var r = radius/2 + sin((t/10)) * radius
			var x = cos(rad) * r;
			var y = sin(rad) * r;
			shape[i].set_position(Vector2(150 + x, 150 + y))
			var shape_scale = sin(n*i+t) * cos(n*i+t) * 2
			shape[i].set_scale(Vector2(shape_scale,shape_scale))
		t += 0.02;
		n += 0.0005;
