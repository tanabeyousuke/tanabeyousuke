extends Node2D


var ziki = preload("res://seen/ziki.tscn").instantiate()

var i = 0
var ha = 0

func _ready():
	ziki.position.x = 240
	ziki.position.y = 450
	add_child(ziki)

