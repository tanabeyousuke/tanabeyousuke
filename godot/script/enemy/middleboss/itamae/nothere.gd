extends Area2D

var tama = preload('res://seen/tama.tscn')
var hp = 1000
var count = 0
const type = "enemy"

var serial = 0

func _ready():
	pass

func _process(delta):
	position.x = cos(deg_to_rad($"../".count + serial * 45)) * 200
	position.y = sin(deg_to_rad($"../".count + serial * 45)) * 170

	
