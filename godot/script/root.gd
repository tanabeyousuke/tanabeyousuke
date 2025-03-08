extends Node2D

var z = preload("res://seen/ziki.tscn")
var stage = [preload("res://seen/stage/stage1.tscn").instantiate(),
	preload("res://seen/stage/stage2.tscn").instantiate(),
	preload("res://seen/stage/stage3/base.tscn").instantiate()]

var nowstage = 2

var tairetu = []
var zyunnbann = 0

func nextstage():
	add_child(stage[nowstage])
	var ziki = z.instantiate()
	ziki.position.x = 300
	ziki.position.y = 700
	add_child(ziki)

func _ready():
	nextstage()
