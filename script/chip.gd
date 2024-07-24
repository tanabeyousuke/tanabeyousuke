extends Area2D

var bairitu = 1
func _process(delta):
	$"Chip".frame = bairitu - 1
	position.x = position.x + ((Global.zpx - position.x) / 60)
	position.y = position.y + ((Global.zpy - position.y) / 60)


func _on_area_entered(area):
	if area.type == "ziki":
		if bairitu == 1:
			Global.bairitu = Global.bairitu + 1
		else:
			Global.bairitu = Global.bairitu * bairitu
		Global.tokuten = Global.tokuten + (bairitu * 10)
		queue_free()
