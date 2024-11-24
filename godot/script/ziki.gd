extends Node2D

var speed = 10
var ct = 0
const type = "ziki"

func _ready():
	print(position.y)

func _process(delta):
	print(position.y)
	Global.zpx = position.x
	Global.zpy = position.y
	var opt = $"option"
	if Input.is_action_pressed("slow"):
		speed = 5
		opt.rotation = 0
	else:
		speed = 10
		if not Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
			if opt.rotation < deg_to_rad(-0.1):
				opt.rotation = opt.rotation + deg_to_rad(0.5)
			elif opt.rotation > deg_to_rad(0.1):
				opt.rotation = opt.rotation - deg_to_rad(0.5)

		
	if Input.is_action_pressed("right"):
		if position.x < 580:
			position.x = position.x + speed
		if opt.rotation < deg_to_rad(30):
			opt.rotation = opt.rotation + deg_to_rad(0.5)
	if Input.is_action_pressed("left"):
		if position.x > 10:
			position.x = position.x - speed
		if opt.rotation > deg_to_rad(-30):
			opt.rotation = opt.rotation - deg_to_rad(0.5)
			
	if Input.is_action_pressed("up") and position.y > 30:
		position.y = position.y - speed
	if Input.is_action_pressed("down") and position.y < 780:
		position.y = position.y + speed
		
	if Input.is_action_pressed("shot") or Input.is_action_pressed("slow"):
		var shot = Global.bullet.instantiate()
		shot.position.x = position.x - 7
		shot.position.y = position.y - 80
		var root = get_node("/root") 
		root.add_child(shot)
	
		shot = Global.bullet.instantiate()
		shot.position.x = position.x + 7
		shot.position.y = position.y - 80 
		root.add_child(shot)
	
		shot = Global.bullet.instantiate()
		shot.things = 1
		shot.position.x = position.x + 22.5
		shot.position.y = position.y - 45
		root.add_child(shot)
	
		shot = Global.bullet.instantiate()
		shot.things = 1
		shot.position.x = position.x - 22.5
		shot.position.y = position.y - 45
		root.add_child(shot)

func _on_area_entered(area):
	queue_free()
