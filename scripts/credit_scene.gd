extends Control

@onready var scroll_container = $ScrollContainer
@onready var v_scroll_bar = scroll_container.get_v_scroll_bar()
var scroll_speed := 100  # píxeles por segundo

func _process(delta):
	if v_scroll_bar:
		v_scroll_bar.value += scroll_speed * delta

		if v_scroll_bar.value >= v_scroll_bar.max_value:
			# Fin del scroll, puedes cambiar de escena o mostrar un botón
			get_tree().change_scene_to_file("res://scenes/menu.tscn")
