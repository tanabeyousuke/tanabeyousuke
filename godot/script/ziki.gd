extends Node2D


func _ready():
	pass

var speed = 10
func _process(delta):
	if Input.is_action_pressed("slow"):
		speed = 5
	else:
		speed = 10
		
	if Input.is_action_pressed("right") and position.x < 580:
		position.x = position.x + speed
	if Input.is_action_pressed("left") and position.x > 10:
		position.x = position.x - speed
	if Input.is_action_pressed("up") and position.y > 30:
		position.y = position.y - speed
	if Input.is_action_pressed("down") and position.y < 780:
		position.y = position.y + speed
	if Input.is_action_pressed("shot"):
		var shot = preload("res://seen/shot.tscn").instantiate()
		shot.position = position
		var root = get_node("/root")
		root.add_child(shot)
