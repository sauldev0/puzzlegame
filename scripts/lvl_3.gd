extends Node2D

@onready var game_controller = $"UID/Game Controller"
@onready var camara = $Camera2D
var numero_nivel = 3

var zoom_activo := false
var zoom_min = Vector2(2, 2)  
var zoom_normal = Vector2(1, 1)   
var velocidad_zoom = 2

var posicion_original := Vector2()

func _ready():
	LEVELCORE.nivel_actual = numero_nivel
	LEVELCORE.letra_correcta = "H"
	game_controller.mostrar_popup_descripcion()

	var camino_tiles = get_tree().get_nodes_in_group("camino_tile")
	for tile in camino_tiles:
		tile.connect("camino_completado", Callable(self, "_on_camino_completado"))

func _on_camino_completado(letra):
	if letra == LEVELCORE.letra_correcta:
		game_controller.call("game_victory")
	else:
		game_controller.call("game_end")
		
func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if !zoom_activo:
			zoom_activo = true
			posicion_original = camara.global_position  # Guardar posición inicial

		# Zoom hacia adentro
		camara.zoom = camara.zoom.lerp(zoom_min, delta * velocidad_zoom)

		var mouse_pos = get_viewport().get_mouse_position()
		var target_pos = get_viewport().get_canvas_transform().affine_inverse() * mouse_pos

		camara.global_position = camara.global_position.lerp(target_pos, delta * velocidad_zoom)
	else:
		if zoom_activo:
			zoom_activo = false

		# Volver al zoom normal
		camara.zoom = camara.zoom.lerp(zoom_normal, delta * velocidad_zoom)

		# Solo si se guardó correctamente la posición original
		if posicion_original != Vector2():
			camara.global_position = camara.global_position.lerp(posicion_original, delta * velocidad_zoom)
