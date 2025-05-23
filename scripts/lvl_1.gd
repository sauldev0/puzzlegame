extends Node2D

@onready var game_controller = $"UID/Game Controller"
var numero_nivel = 1

func _ready():
	GLOBAL.nivel_actual = numero_nivel
	print("Nivel actual:", GLOBAL.nivel_actual)
	game_controller.mostrar_popup_descripcion()
	
	var opciones = get_tree().get_nodes_in_group("buttons") #almacena el resultado de busqueda de grupos
	for buttons in opciones:
		buttons.pressed.connect(validar.bind(buttons.is_correct))
		#buttons.connect("pressed", validar) # para cuando es una señal personalizada

func validar(is_correct):
	if is_correct:
		#print("boton apretado ", is_correct)
		LEVELCORE.lvl1_completed = true
		game_controller.call('game_victory')
	else:
		#print("boton apretado ", is_correct)
		game_controller.call('game_end')
		
