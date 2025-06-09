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
		area.area_exited.connect(_on_area_exited)

func _on_area_entered(area, is_correct):
	print("Área detectada, esperando confirmación con botón")
	area_detectada = area
	is_correct_detectado = is_correct
	hay_area_para_validar = true

func _on_area_exited(area):
	# Solo limpiar si es el área que estaba activa
	if area == area_detectada:
		print("Saliendo del área, cancelando validación")
		area_detectada = null
		is_correct_detectado = false
		hay_area_para_validar = false

func _on_culpar_touch_screen_button_pressed():
	if LEVELCORE.dialogo_activo:
		print("no se puede culpar mientras se interroga")
		return
	
	if hay_area_para_validar:
		print("Presionando botón, validando área")
		validar(area_detectada, is_correct_detectado)
		hay_area_para_validar = false
	else:
		print("No hay área para validar.")

func validar(area, is_correct):
	if is_correct:
		game_controller.call('game_victory')
	else:
		game_controller.call('game_end')
