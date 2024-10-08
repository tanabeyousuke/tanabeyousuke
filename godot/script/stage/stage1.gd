extends Sprite2D

var count = 0
var bossbp = 4250
var zyunnbann = 0

var tairetu = [
	preload("res://seen/enemy/tairetu/reccabounds1.tscn"),
	preload("res://seen/enemy/tairetu/reccabounds2.tscn"),
	preload("res://seen/enemy/tairetu/stingrays.tscn"),
	preload("res://seen/enemy/tairetu/kasou1.tscn"),
	preload("res://seen/enemy/tairetu/kasou2.tscn"),	
	preload("res://seen/enemy/tairetu/kasou3.tscn"),
	preload("res://seen/enemy/tairetu/stingrays.tscn"),
	preload("res://seen/enemy/tairetu/invaders.tscn"),
	preload("res://seen/enemy/tairetu/toroids1.tscn"),
	preload("res://seen/enemy/tairetu/toroids2.tscn"),
	preload("res://seen/enemy/tairetu/toroids1.tscn"),
	preload("res://seen/enemy/tairetu/toroids2.tscn")
]

func next():
	if bossbp > 0:
		var tai = tairetu[zyunnbann % tairetu.size()].instantiate()
		get_tree().root.add_child(tai)
		zyunnbann = zyunnbann + 1

func _ready():
	Global.stage = $"."
	print(Global.stage)

func _process(delta):
	if position.y < 2590:
		position.y = position.y + 1

	if count == 120:
		next()

	count = count + 1
	bossbp = bossbp - 1
	
	if bossbp == -500:
		var tank = preload("res://seen/enemy/boss/markI/body.tscn").instantiate()
		tank.position.x = -150
		tank.position.y = -2590 - 150
		add_child(tank)

	if bossbp == -1200:
		var tank = preload("res://seen/enemy/boss/markI/body.tscn").instantiate()
		tank.position.x = 150
		tank.position.y = -2590 - 150
		tank.num = 1
		add_child(tank)
		
