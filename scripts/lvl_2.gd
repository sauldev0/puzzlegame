extends Node2D

@onready var game_controller = $"UID/Game Controller"
@onready var culpar_button = $CulparTouchScreenButton
var numero_nivel = 2

# Variables temporales para guardar el área detectada
var area_detectada = null
var is_correct_detectado = false
var hay_area_para_validar = false

func _ready():
	LEVELCORE.nivel_actual = numero_nivel
	print("Nivel actual:", LEVELCORE.nivel_actual)
	game_controller.mostrar_popup_descripcion()
	
	var opciones = get_tree().get_nodes_in_group("areas")
	for area in opciones:
		area.area_entered.connect(_on_area_entered.bind(area.is_correct))

func _on_area_entered(area, is_correct):
	print("area detectada, esperando confirmación con botón")
	area_detectada = area
	is_correct_detectado = is_correct
	hay_area_para_validar = true

func _on_culpar_touch_screen_button_pressed():
	if hay_area_para_validar:
		print("presionando botón, validando área")
		validar(area_detectada, is_correct_detectado)
		# limpiar para evitar múltiples validaciones si se mantiene el botón presionado
		hay_area_para_validar = false
	else:
		print("No hay área para validar.")

func validar(area, is_correct):
	if is_correct:
		game_controller.call('game_victory')
	else:
		game_controller.call('game_end')
