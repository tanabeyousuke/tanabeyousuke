extends Node2D


var ziki = preload("res://seen/ziki.tscn").instantiate()
var stage1 = preload("res://seen/stage/stage1.tscn").instantiate()

var tairetu = []
var zyunnbann = 0
	
func _ready():
	add_child(stage1)
	ziki.position.x = 240
	ziki.position.y = 450
	add_child(ziki)
