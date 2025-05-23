extends Node2D

@onready var game_controller = $"UID/Game Controller"
var numero_nivel = 9

func _ready():
	GLOBAL.nivel_actual = numero_nivel
	print("Nivel actual:", GLOBAL.nivel_actual)
	game_controller.mostrar_popup_descripcion()
	
	var opciones = get_tree().get_nodes_in_group("tables") #almacena el resultado de busqueda de grupos
	for tables in opciones:
		tables.area_entered.connect(validar.bind(tables.is_correct))
		#buttons.connect("pressed", validar) # para cuando es una señal personalizada

func validar(_area_entered, is_correct):
	if is_correct:
		#print(_area_entered," ", is_correct)
		LEVELCORE.lvl3_completed = true
		game_controller.call('game_victory')
	else:
		#print(_area_entered," ", is_correct)
		game_controller.call('game_end')
		
