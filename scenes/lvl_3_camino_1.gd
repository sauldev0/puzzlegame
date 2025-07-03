extends Sprite2D

const LVL_3_CAMINO_1 = preload("res://sprites/puzzles/lvl3/lvl3_camino1.png")
const LVL_3_CAMINO_RASTRO_1 = preload("res://sprites/puzzles/lvl3/lvl3_camino_rastro_1.png")

func _ready():
	pass


func _on_area_2d_mouse_entered():
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		texture = LVL_3_CAMINO_RASTRO_1
