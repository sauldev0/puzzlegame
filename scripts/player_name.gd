extends Control
@onready var ingresar_nombre = $PanelContainer/HBoxContainer/MarginContainer2/VBoxContainer/HBoxContainer/IngresarNombre
@onready var confirmar_button = $PanelContainer/HBoxContainer/MarginContainer4/ConfirmarButton

func _on_confirmar_button_pressed():
	var nombre_jugador_ingresado = ingresar_nombre.text.strip_edges()
	
	if nombre_jugador_ingresado != "":
		LEVELCORE.player_name = nombre_jugador_ingresado
		LEVELCORE.save_data()
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
	else:
		print("Nombre vacío, no se puede continuar.")
	
	
