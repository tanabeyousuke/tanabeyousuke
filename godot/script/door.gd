extends Area2D

var count = 0

func _ready() -> void:
	pass

func _process(delta):
	$"led".frame = (count / 6) % 3
	$"hand".frame = (count / 8) % 4

	if count < 75:
		position.y = position.y - (60 - count) / 5
	else:
		position.y = position.y + 3

	if global_position.x > 850:
		queue_free()
		
	count = count + 1
