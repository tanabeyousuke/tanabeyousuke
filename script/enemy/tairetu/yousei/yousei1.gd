extends Area2D

const type = "tairetu"
var yousei = preload("res://seen/enemy/yousei.tscn")
var state = 0
var count = 0
var nokori = 96

func breaked():
	nokori = nokori - 1
	if nokori == 0:
		queue_free()

func _process(delta):
	match state:
		0:
			if count % 45 == 0:
				for i in range(3):
					var ro = yousei.instantiate()
					ro.position.x = (i * 75) - 75
					ro.position.y = (-i * 25) - 25
					ro.scriptnum = 0
					ro.rl = 0
					if i == 1:
						ro.opt = 1
					add_child(ro)
			if count == 450:
				count = 0
				state = 1

		1:
			if count == 180:
				state = 2

		2:
			if count % 45 == 0:
				for i in range(3):
					var ro = yousei.instantiate()
					ro.position.x = (i * 75) + 525
					ro.position.y = (i * 25) - 25
					ro.scriptnum = 0
					ro.rl = 1
					if i == 1:
						ro.opt = 1
					add_child(ro)
			if count == 450:
				count = 0
				state = 3

		3:
			if count == 180:
				state = 4

		4:
			if count % 45 == 0:
				if count % 2 == 0:
					for i in range(3):
						var ro = yousei.instantiate()
						ro.position.x = (i * 75) - 75
						ro.position.y = (i * 25) - 25
						ro.scriptnum = 0
						ro.rl = 0
						if i == 1:
							ro.opt = 1
						add_child(ro)
				else:
					for i in range(3):
						var ro = yousei.instantiate()
						ro.position.y = (i * 25) - 25
						ro.scriptnum = 0
						ro.rl = 1
						if i == 1:
							ro.position.x = (i * 75) + 525
							ro.opt = 1
						add_child(ro)

			if count == 530:
				state = 5
			
	count = count + 1
