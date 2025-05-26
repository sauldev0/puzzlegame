extends Node2D

@onready var popupcorrect = $"../popupcorrect"
@onready var popupincorrect = $"../popupincorrect"
@onready var popuptexto = $"../popuptexto"
@onready var score_label = $"../popupcorrect/VBoxContainer/score_label"

var puntos_nivel = 0
var intentos : int

var descripciones = {1 : "En un pueblo solo hay dos peluqueros uno con un corte mal echo y otro con un corte muy bien hecho
\n¿A cuál acudirías para que te cortara el cabello?",

2 : "Caso: El misterio de la biblioteca
Un profesor fue encontrado inconsciente en la biblioteca de la universidad, y cuatro personas estaban cerca del lugar. Cada una hizo una declaración:
•	Persona A: \"Yo no fui, y la Persona B miente. \"
•	Persona B: \"La Persona C fue quien atacó al profesor. \"
•	Persona C: \"A y B están mintiendo. \"
•	Persona D: \"Si C dice la verdad, entonces A es culpable. \"
",

9 : "Anda por ahí un comensal que no estaba invitado. Sin embargo, tienes información que permite identificarlo.
\n\"Su mesa está junto a otra que tiene una flor roja. El mantel es de diferente color que el de cualquiera de las mesas que se encuentran junto a ella. Ah, y en la mesa del intruso no hay una flor amarilla. \"
\n\"Junto a \" significa que dos mesas están conectadas por una línea de puntos.",

3 : ""
}

func _ready():
	get_tree().paused = false
	popupcorrect.visible = false
	popupincorrect.visible = false
	
	print("game controller activo")
	
func mostrar_popup_descripcion():
	var nivel = GLOBAL.nivel_actual
	popuptexto.set_description(descripciones.get(nivel, "Descripción no disponible."))
	
func game_victory():
	var estrellas = calcular_estrellas()
	puntos_nivel = estrellas * 50  

	sumar_puntos()
	guardar_estrellas_por_nivel(GLOBAL.nivel_actual, estrellas)

	popupcorrect.visible = true 
	score_label.text = "Has conseguido " + str(puntos_nivel) + " fragmentos de puzzle"
	GLOBAL.numero_de_intentos = 0
	get_tree().paused = popupcorrect.visible
	
func game_end():
	
	GLOBAL.numero_de_intentos = GLOBAL.numero_de_intentos + 1
	print("llevas " + str(GLOBAL.numero_de_intentos) + " numero de intentos")
	print("mal")
	popupincorrect.visible = true
	get_tree().paused = popupincorrect.visible

func calcular_estrellas() -> int:
	if GLOBAL.numero_de_intentos <= 3:
		return 3
	elif GLOBAL.numero_de_intentos <= 6:
		return 2
	else:
		return 1
		
func guardar_estrellas_por_nivel(nivel: int, estrellas: int):
	match nivel:
		1:
			LEVELCORE.lvl1_stars = max(estrellas, LEVELCORE.lvl1_stars)
			LEVELCORE.lvl1_completed = true
		2:
			LEVELCORE.lvl2_stars = max(estrellas, LEVELCORE.lvl2_stars)
			LEVELCORE.lvl2_completed = true
		3:
			LEVELCORE.lvl3_stars = max(estrellas, LEVELCORE.lvl3_stars)
			LEVELCORE.lvl3_completed = true
		4:
			LEVELCORE.lvl4_stars = max(estrellas, LEVELCORE.lvl4_stars)
			LEVELCORE.lvl4_completed = true
		5:
			LEVELCORE.lvl5_stars = max(estrellas, LEVELCORE.lvl5_stars)
			LEVELCORE.lvl5_completed = true
		6:
			LEVELCORE.lvl6_stars = max(estrellas, LEVELCORE.lvl6_stars)
			LEVELCORE.lvl6_completed = true
		7:
			LEVELCORE.lvl7_stars = max(estrellas, LEVELCORE.lvl7_stars)
			LEVELCORE.lvl7_completed = true
		8:
			LEVELCORE.lvl8_stars = max(estrellas, LEVELCORE.lvl8_stars)
			LEVELCORE.lvl8_completed = true
		9:
			LEVELCORE.lvl9_stars = max(estrellas, LEVELCORE.lvl9_stars)
			LEVELCORE.lvl9_completed = true
		10:
			LEVELCORE.lvl10_stars = max(estrellas, LEVELCORE.lvl10_stars)
			LEVELCORE.lvl10_completed = true
		11:
			LEVELCORE.lvl11_stars = max(estrellas, LEVELCORE.lvl11_stars)
			LEVELCORE.lvl11_completed = true
		12:
			LEVELCORE.lvl12_stars = max(estrellas, LEVELCORE.lvl12_stars)
			LEVELCORE.lvl12_completed = true

func sumar_puntos():
	GLOBAL.score_total = GLOBAL.score_total + puntos_nivel
	
	print("Has conseguido " + str(puntos_nivel) + " puntos")
	print("Total de puntos " + str(GLOBAL.score_total))
