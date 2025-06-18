extends Camera2D

@onready var player = $"../Player"
var mas_zoom := Vector2(2, 2)
var menos_zoom := Vector2(1, 1)

var seguir_jugador := false
var posicion_inicial := Vector2.ZERO

func _ready():
	posicion_inicial = position
	make_current()  # Activar esta cámara

func _process(delta):
	if seguir_jugador and player:
		position = player.position

func _on_mas_zoom_pressed():
	seguir_jugador = true
	set_zoom(mas_zoom)

func _on_menos_zoom_pressed():
	seguir_jugador = false
	position = posicion_inicial
	set_zoom(menos_zoom)
