extends Node2D

@onready var popupcorrect = $"../popupcorrect"
@onready var popupincorrect = $"../popupincorrect"
@onready var popuptexto = $"../popuptexto"
@onready var score_label = $"../popupcorrect/WinPanelContainer/VBoxContainer/IconPanelContainer/VBoxContainer/score_label"

var puntos_nivel = 0
var intentos : int

# Diccionario con descripciones de los niveles
var descripciones = {1 : "En un pueblo solo hay dos peluqueros uno con un corte mal hecho y otro con un corte muy bien hecho
\n¿A cuál acudirías para que te cortara el cabello?",

	2 : "Un profesor fue encontrado inconsciente en la biblioteca de la universidad, y cuatro personas estaban cerca del lugar.
\n- Acércate a los sospechosos e interrógalos
\n- Acércate a los sospechosos e indica al culpable
",

9 : "Anda por ahí un comensal que no estaba invitado. Sin embargo, tienes información que permite identificarlo.
\n\"Su mesa está junto a otra que tiene una flor roja. El mantel es de diferente color que el de cualquiera de las mesas que se encuentran junto a ella. Ah, y en la mesa del intruso no hay una flor amarilla. \"
\n\"Junto a \" significa que dos mesas están conectadas por una línea de puntos.",

3 : ""
}

var reglas = {1 : "",

	2 : "Solo una persona es culpable.
\nAl menos una persona miente, pero no necesariamente todos.

	",

9 : "
",

3 : ""
}

func _ready():
	get_tree().paused = false
	popupcorrect.visible = false
	popupincorrect.visible = false
	
	print("game controller activo")
	
func mostrar_popup_descripcion():
	var nivel = LEVELCORE.nivel_actual
	popuptexto.set_description(descripciones.get(nivel, "Descripción no disponible."))
	popuptexto.set_rules(reglas.get(nivel, "Reglas no disponible."))
	
func game_victory():
	var estrellas = calcular_estrellas()
	puntos_nivel = estrellas * 50  

	var nivel = LEVELCORE.nivel_actual
	var ya_completado = false
	
	# Verifica si el nivel ya fue completado anteriormente
	match nivel:
		1: ya_completado = LEVELCORE.lvl1_completed
		2: ya_completado = LEVELCORE.lvl2_completed
		3: ya_completado = LEVELCORE.lvl3_completed
		4: ya_completado = LEVELCORE.lvl4_completed
		5: ya_completado = LEVELCORE.lvl5_completed
		6: ya_completado = LEVELCORE.lvl6_completed
		7: ya_completado = LEVELCORE.lvl7_completed
		8: ya_completado = LEVELCORE.lvl8_completed
		9: ya_completado = LEVELCORE.lvl9_completed
		10: ya_completado = LEVELCORE.lvl10_completed
		11: ya_completado = LEVELCORE.lvl11_completed
		12: ya_completado = LEVELCORE.lvl12_completed
	
	# Si es la primera vez que se completa, se otorgan puntos y se guardan las estrellas
	if !ya_completado:
		sumar_puntos()
		guardar_estrellas_por_nivel(nivel, estrellas)
		popupcorrect.visible = true 
		score_label.text = "Has conseguido " + str(puntos_nivel) + " fragmentos de puzzle"
	else:
		popupcorrect.visible = true 
		score_label.text = "El nivel ya ha sido completado 0 fragmentos de puzzle"

	
	LEVELCORE.numero_de_intentos = 0
	get_tree().paused = popupcorrect.visible
	
func game_end():
	
	LEVELCORE.numero_de_intentos = LEVELCORE.numero_de_intentos + 1
	print("llevas " + str(LEVELCORE.numero_de_intentos) + " numero de intentos")
	print("mal")
	popupincorrect.visible = true
	get_tree().paused = popupincorrect.visible

func calcular_estrellas() -> int:
	if LEVELCORE.numero_de_intentos <= 3:
		return 3
	elif LEVELCORE.numero_de_intentos <= 6:
		return 2
	else:
		return 1
		
# Asigna la cantidad de estrellas si el nivel no ha sido completado antes
func guardar_estrellas_por_nivel(nivel: int, estrellas: int):
	match nivel:
		1:
			if !LEVELCORE.lvl1_completed:
				LEVELCORE.lvl1_stars = estrellas
				LEVELCORE.lvl1_completed = true
		2:
			if !LEVELCORE.lvl2_completed:
				LEVELCORE.lvl2_stars = estrellas
				LEVELCORE.lvl2_completed = true
		3:
			if !LEVELCORE.lvl3_completed:
				LEVELCORE.lvl3_stars = estrellas
				LEVELCORE.lvl3_completed = true
		4:
			if !LEVELCORE.lvl4_completed:
				LEVELCORE.lvl4_stars = estrellas
				LEVELCORE.lvl4_completed = true
		5:
			if !LEVELCORE.lvl5_completed:
				LEVELCORE.lvl5_stars = estrellas
				LEVELCORE.lvl5_completed = true
		6:
			if !LEVELCORE.lvl6_completed:
				LEVELCORE.lvl6_stars = estrellas
				LEVELCORE.lvl6_completed = true
		7:
			if !LEVELCORE.lvl7_completed:
				LEVELCORE.lvl7_stars = estrellas
				LEVELCORE.lvl7_completed = true
		8:
			if !LEVELCORE.lvl8_completed:
				LEVELCORE.lvl8_stars = estrellas
				LEVELCORE.lvl8_completed = true
		9:
			if !LEVELCORE.lvl9_completed:
				LEVELCORE.lvl9_stars = estrellas
				LEVELCORE.lvl9_completed = true
		10:
			if !LEVELCORE.lvl10_completed:
				LEVELCORE.lvl10_stars = estrellas
				LEVELCORE.lvl10_completed = true
		11:
			if !LEVELCORE.lvl11_completed:
				LEVELCORE.lvl11_stars = estrellas
				LEVELCORE.lvl11_completed = true
		12:
			if !LEVELCORE.lvl12_completed:
				LEVELCORE.lvl12_stars = estrellas
				LEVELCORE.lvl12_completed = true


func sumar_puntos():
	LEVELCORE.score_total = LEVELCORE.score_total + puntos_nivel
	
	print("Has conseguido " + str(puntos_nivel) + " puntos")
	print("Total de puntos " + str(LEVELCORE.score_total))
	
