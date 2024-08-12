extends Sprite2D

var count = 0
var tairetu = [
	preload("res://seen/enemy/tairetu/yousei/yousei1.tscn"),
	preload("res://seen/enemy/tairetu/kedama/kedama1.tscn"),
	preload("res://seen/enemy/tairetu/yousei/yousei2.tscn"),
 	preload("res://seen/enemy/tairetu/myousei/myousei1.tscn"),
	preload("res://seen/enemy/tairetu/yousei/yousei3.tscn"),
	preload("res://seen/enemy/tairetu/kedama/kedama2.tscn"),
	preload("res://seen/enemy/tairetu/kedama/kedama3.tscn"),
	preload("res://seen/enemy/middleboss/mahouzin.tscn"),
	preload("res://seen/enemy/tairetu/sfyousei/sfyousei1.tscn"),
	preload("res://seen/enemy/tairetu/sfyousei/sfyousei2.tscn"),
	preload("res://seen/enemy/tairetu/sfyousei/sfyousei3.tscn"),
	preload("res://seen/enemy/tairetu/sfyousei/sfyousei4.tscn"),
	preload("res://seen/enemy/tairetu/myousei/myousei2.tscn"),
	preload("res://seen/enemy/tairetu/sfyousei/sfyousei5.tscn")]

func _process(delta):
	position.y = position.y + 1
	if position.y == 800:
		position.y = 0
		print(position.y)
