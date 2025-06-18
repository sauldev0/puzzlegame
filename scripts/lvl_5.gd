extends Node2D

@onready var color_rect = $UID/menu_pausa/ColorRect
@onready var menu_pausa = $UID/menu_pausa
@onready var game_controller = $"UID/Game Controller"
var numero_nivel = 5
@onready var timer = $Timer
@onready var label_time_left = $UID/TextureRect/LabelTimeLeft
var nivel_reiniciado = false

func _ready():
	LEVELCORE.nivel_actual = numero_nivel
	print("Nivel actual:", LEVELCORE.nivel_actual)
	game_controller.mostrar_popup_descripcion()
	color_rect.visible = false
	var opciones = get_tree().get_nodes_in_group("button") #almacena el resultado de busqueda de grupos
	for buttons in opciones:
		buttons.pressed.connect(time_start) # recibe la señal del boton del popuptexto

func _on_area_2d_body_entered(body):
	LEVELCORE.puntuar_por_tiempo = true
	LEVELCORE.tiempo_final = timer.time_left
	game_controller.call('game_victory')
	
func _process(delta):
	
	var time = timer.time_left
	#print(time)
	label_time_left.text = "Tiempo restante: " + str(int(time)) + " segundos"
	
func time_start():
	if !nivel_reiniciado:
		$Timer.start()
	nivel_reiniciado = true

func _on_timer_timeout():
	game_controller.call('game_end')


func _on_texture_button_pressed():
	get_tree().reload_current_scene()
	
