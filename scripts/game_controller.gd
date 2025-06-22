extends Node2D

@onready var popupcorrect = $"../popupcorrect"
@onready var popupincorrect = $"../popupincorrect"
@onready var popuptexto = $"../popuptexto"
@onready var score_label = $"../popupcorrect/WinPanelContainer/VBoxContainer/IconPanelContainer/VBoxContainer/score_label"
@onready var pop_up_declaraciones = $"../PopUpDeclaraciones"
@onready var view = $PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/View


@export var touch_indicator_scene: PackedScene

var puntos_nivel = 0
var intentos : int
var niveles_con_declaraciones = [2, 4]

# Diccionario con descripciones de los niveles
var descripciones = {1 : "En un pueblo solo hay dos peluqueros uno con un corte mal hecho y otro con un corte muy bien hecho
\n¿A cuál acudirías para que te cortara el cabello?",

	2 : "Un profesor fue encontrado inconsciente en la biblioteca de la universidad, y cuatro personas estaban cerca del lugar.
\n- Acércate a los sospechosos e interrógalos
\n- Acércate a los sospechosos e indica al culpable
",

9 : "Anda por ahí un comensal que no estaba invitado. Sin embargo, tienes información que permite identificarlo.
\n\"Su mesa está junto a otra que tiene una flor roja. El mantel es de diferente color que el de cualquiera de las mesas que se encuentran junto a ella. Ah, y en la mesa del intruso no hay una flor amarilla. \"
",

3 : "Debes encontrar una relojería, pero la única pista que tienes para encontrarla es la siguiente:\n" +
			"12:00\n" +
			"3:00\n" +
			"12:00\n" +
			"9:00\n" +
			"6:00",
4 : "Se ha robado un dispositivo valioso en el laboratorio, y ahora hay cinco sospechosos: Lucas, Marta, Sofía, Diego y Carla.\n" +
			"Cada uno hace una declaración, pero sabemos que solo uno dice la verdad.\n" +
			"El jugador deberá construir la tabla de verdad y aplicar conectores lógicos para descubrir quién miente y quién es el verdadero culpable.",
			
			
5 : "Tienes que cruzar este lago congelado. El hielo es suficientemente grueso como para andar por encima, " +
	"pero tan resbaladizo que cualquier movimiento te hará resbalar en la dirección escogida hasta que llegues a un muro.\n" +
	"Cuando estás parado, puedes cambiar la dirección en la que te moverá tocando las flechas que aparecen a tu alrededor.",

6 : "En el bosque, desaparecieron las semillas que florecen en primavera. Solo tres animales estaban cerca: Zorro, Conejo y Búho.\n\n" +
	"Cada uno hizo una declaración, pero solo uno dice la verdad.\n\n" +
	"¿Puedes encontrar al ladrón de semillas?",

}

# Diccionario con reglas de los niveles
var reglas = {1 : "",

	2 : "Solo una persona es culpable.
\nAl menos una persona miente, pero no necesariamente todos.

	",

9 : " \"Junto a \" significa que dos mesas están conectadas por una línea de puntos.
",

3 : ""
}

# Diccionario con declaraciones de los niveles que tienen

var declaraciones = {
	2 : "A: \"Yo no fui, y B miente.\"  [color=#e4be6e] ˃ A ˹ (ˉ A ˄ ˉ B ) [/color]\n\n" +
		"B: \"C fue el culpable.\" [color=#e4be6e] ˉ B ˹ C [/color]\n\n" +
		"C: \"A y B mienten.\" [color=#e4be6e] ˃ C ˹ ( ˉ A ˄ ˉ B) [/color]\n\n" +
		"D: \"Si C dice la verdad, entonces A es culpable,\" [color=#e4be6e] ˃ D ˹ (C ˃  A) [/color]\n\n",
			
	4 : "Lucas: \"Si Marta es culpable, entonces Sofía también lo es\" [color=#e4be6e] L ˹ (M ˃ S) [/color]\n\n" +
		"Marta: \"Diego es inocente.\" [color=#e4be6e] M ˹ ˉ D [/color]\n\n" +
		"Sofía: \"Yo no soy culpable, y Diego miente.\" [color=#e4be6e] S ˹ (ˉ S ˄ ˉ D) [/color]\n\n" +
		"Diego: \"Lucas es culpable o Sofía está mintiendo.\" [color=#e4be6e] D ˹ (L ˅ ˉ S) [/color]\n\n" +
		"Carla: \"Si Sofía es inocente, entonces Marta es culpable.\" [color=#e4be6e] C ˹ (ˉ S ˃ M) [/color]\n\n",

	3 : "Declaraciones no disponibles por ahora.\n\n"
}

func _unhandled_input(event):
	if event is InputEventScreenTouch and event.pressed:
		if touch_indicator_scene:  # Solo si la escena está asignada
			var indicator = touch_indicator_scene.instantiate()
			indicator.position = event.position
			add_child(indicator)

func _ready():
	get_tree().paused = false
	popupcorrect.visible = false
	popupincorrect.visible = false
	#pop_up_declaraciones = false  
	
	print("game controller activo")
	
	
func mostrar_popup_correcto_con_o_sin_declaracion():
	var nivel = LEVELCORE.nivel_actual
	if nivel in niveles_con_declaraciones:
		mostrar_popup_declaraciones()
	else:
		mostrar_popup_correcto()

func mostrar_popup_declaraciones():
	var nivel = LEVELCORE.nivel_actual
	pop_up_declaraciones.set_declarations(declaraciones.get(nivel, "Declaraciones no disponibles."))
	pop_up_declaraciones.visible = true
	get_tree().paused = true

	var boton = pop_up_declaraciones.get_node("PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/Next")
	var callback = Callable(self, "_on_declaraciones_completadas")
	if not boton.is_connected("pressed", callback):
		boton.connect("pressed", callback)
	
func _on_declaraciones_completadas():
	pop_up_declaraciones.visible = false
	mostrar_popup_correcto()
	
	
func mostrar_popup_correcto():
	popupcorrect.visible = true
	# score_label.text = "Has conseguido " + str(puntos_nivel) + " fragmentos de puzzle"
	get_tree().paused = true

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
		mostrar_popup_correcto_con_o_sin_declaracion()
		score_label.text = "Has conseguido " + str(puntos_nivel) + " fragmentos de puzzle"
	else:
		mostrar_popup_correcto_con_o_sin_declaracion() 
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
	if LEVELCORE.puntuar_por_tiempo and LEVELCORE.nivel_actual == 5:
		var tiempo = LEVELCORE.tiempo_final
		if tiempo >= 80:
			return 3
		elif tiempo >= 40:
			return 2
		else:
			return 1
	else:
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
	
