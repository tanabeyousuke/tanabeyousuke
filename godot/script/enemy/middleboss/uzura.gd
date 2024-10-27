extends Sprite2D

var houdai = preload("res://seen/enemy/middleboss/uzurahoudai.tscn")

var hp = 10000
var nokori = 8

func broke():
	nokori = nokori - 1
	if nokori == 0:
		queue_free()
		
func _init():
	for i in range(8):
		var h = houdai.instantiate()
		h.position.x = cos(deg_to_rad(i * 45)) * 250 
		h.position.y = sin(deg_to_rad(i * 45)) * 250
		h.rotation = deg_to_rad(i * 45 + 90)
		add_child(h)
		
func _process(delta):
	rotation = rotation + deg_to_rad(0.5)
	
