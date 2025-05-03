extends Node2D

@onready var game_controller = $"UID/Game Controller"
var numero_nivel = 2

func _ready():
	GLOBAL.nivel_actual = numero_nivel
	print("Nivel actual:", GLOBAL.nivel_actual)
	game_controller.mostrar_popup_descripcion()
