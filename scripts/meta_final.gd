extends Area2D


func _on_area_entered(area):
	await get_tree().create_timer(3).timeout
	queue_free()
