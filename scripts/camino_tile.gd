extends Area2D

signal camino_completado(letra: String)

@export var textura_normal: Texture2D
@export var textura_trazo: Texture2D
@export var es_inicio: bool = false
@export var es_final: bool = false
@export var letra: String = ""

var presionado = false
static var trazando := false
static var tiles_visitados: Array = []

var mouse_encima := false  # Flag para saber si el mouse está sobre este tile

func _ready():
	$Sprite2D.texture = textura_normal
	connect("mouse_entered", Callable(self, "_on_mouse_entered"))
	connect("mouse_exited", Callable(self, "_on_mouse_exited"))

func _process(_delta):
	if mouse_encima and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if !presionado:
			if es_inicio and !trazando:
				iniciar_trazado()
				if has_node("TrazoAudio"):
					$TrazoAudio.play()
			elif trazando and puede_continuar():
				marcar_trazo()
				tiles_visitados.append(self)
				if has_node("TrazoAudio"):
					$TrazoAudio.play()
				if es_final:
					finalizar_trazado()
	else:
		# Si el mouse se soltó y estaba trazando, cancelar
		if trazando and !Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			cancelar_trazado()

func _on_mouse_entered():
	mouse_encima = true

func _on_mouse_exited():
	mouse_encima = false

func iniciar_trazado():
	trazando = true
	marcar_trazo()
	tiles_visitados = [self]
	
func cancelar_trazado():
	trazando = false
	for tile in tiles_visitados:
		tile.resetear()
	tiles_visitados.clear()

func puede_continuar():
	if tiles_visitados.is_empty():
		return false

	var ultimo = tiles_visitados[-1]
	if self in tiles_visitados:
		return false

	var delta = global_position - ultimo.global_position
	var dx = int(abs(delta.x))
	var dy = int(abs(delta.y))
	return (dx == 36 and dy == 0) or (dy == 36 and dx == 0)

func marcar_trazo():
	presionado = true
	$Sprite2D.texture = textura_trazo

func resetear():
	presionado = false
	$Sprite2D.texture = textura_normal

func finalizar_trazado():
	trazando = false
	await get_tree().create_timer(0.2).timeout

	for tile in tiles_visitados:
		tile.resetear()
	tiles_visitados.clear()

	emit_signal("camino_completado", letra)
