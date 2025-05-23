class_name table extends Area2D

signal player_correct()
signal player_incorrect()

#var puntuacion = 0
@export var is_correct:bool

func _on_area_entered(area):
	print(is_correct)
	if is_correct:
		#print("correctooo")
		#puntuacion = puntuacion + 1
		#print (puntuacion)
		player_correct.emit()
		LEVELCORE.lvl3_completed = true
		
	else:
		print("intenta otra vez")
		player_incorrect.emit()
