extends Camera2D

@onready var player = $"../Player"

var mas_zoom := Vector2(5, 5)
var zoom_original := Vector2.ONE

var seguir_jugador := false
var posicion_guardada := Vector2.ZERO  # Ahora guardamos justo antes de seguir

var zoom_objetivo := Vector2.ONE
var posicion_objetivo := Vector2.ZERO

var velocidad_zoom := 5.0
var velocidad_mov := 5.0

func _ready():
	zoom_original = zoom
	zoom_objetivo = zoom
	posicion_objetivo = position
	make_current()
	
func _process(delta):
	# Movimiento suave
	zoom = zoom.lerp(zoom_objetivo, delta * velocidad_zoom)
	position = position.lerp(posicion_objetivo, delta * velocidad_mov)

	# Si se debe seguir al jugador, actualiza la posición objetivo
	if seguir_jugador and player:
		posicion_objetivo = player.position

func _on_npc_persona_a_area_entered(area):
	posicion_guardada = position  # Guardamos antes de empezar a seguir
	seguir_jugador = true
	zoom_objetivo = mas_zoom

func _on_npc_persona_a_area_exited(area):
	seguir_jugador = false
	zoom_objetivo = zoom_original
	posicion_objetivo = posicion_guardada  # Volver a la posición previa al seguimiento
