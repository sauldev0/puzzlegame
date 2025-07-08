extends Node2D

@onready var popupcorrect = $"../popupcorrect"
@onready var popupincorrect = $"../popupincorrect"
@onready var popuptexto = $"../popuptexto"
@onready var score_label = $"../popupcorrect/WinPanelContainer/VBoxContainer/IconPanelContainer/VBoxContainer/MarginContainer2/score_label"
@onready var pop_up_declaraciones = $"../PopUpDeclaraciones"
#@onready var animation_player = $"../../AnimationPlayer"
@onready var view = $PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/View
@onready var piezas_label = $"../popupcorrect/WinPanelContainer/VBoxContainer/PiezasLabel"


@export var touch_indicator_scene: PackedScene

var puntos_nivel = 0
var intentos : int
var niveles_con_declaraciones = [2, 4]

# Diccionario con descripciones de los niveles
var descripciones = {
	1: "En un pueblo hay solo dos peluqueros: uno con un corte mal hecho y otro con un corte muy bien hecho.\n\n" +
	   "¿A cuál acudirías para que te cortara el cabello?",

	2: "Un profesor fue encontrado inconsciente en la biblioteca de la universidad, y cuatro personas estaban cerca del lugar.",

	3: "Debes encontrar una relojería, pero la única pista que tienes para encontrarla es la siguiente:\n\n" +
	   "12:00 " +
	   "3:00 " +
	   "12:00 " +
	   "9:00 " +
	   "6:00",

	4: "Un dispositivo valioso ha sido robado del laboratorio. Los sospechosos son cinco: Lucas, Marta, Sofía, Diego y Carla.\n\n" +
   "Cada uno ha dado una declaración relacionada con el caso.",

	5: "Debes cruzar un lago completamente congelado. El hielo es lo suficientemente grueso como para caminar sobre él, " +
   "pero extremadamente resbaladizo: cualquier movimiento te hará deslizarte en línea recta hasta chocar con un muro de nieve.",

	6: "En el bosque han desaparecido las semillas que florecen en primavera. Solo tres animales estaban cerca del lugar del robo: el Zorro, el Conejo y el Búho.\n\n" +
	   "Cada uno dio una declaración relacionada con lo ocurrido.",
	
	7: "Si siete días después de hace 70 días era domingo,\n" +
	   "¿qué día de la semana fue siete días antes de 70 días a partir de hoy?",
	
	8: "Durante una exposición nocturna en el Museo Nacional de Arte Clásico,\n" +
	   "la valiosa pintura \"La dama del espejo\" fue hallada rota en el suelo poco antes del cierre.\n\n" +
	   "Solo tres pasantes estuvieron cerca en ese momento.\n\n" +
	   "¿Quién dice la verdad?",


	9: "Un comensal no invitado se encuentra entre los presentes. Sin embargo, cuentas con pistas que te ayudarán a identificarlo:\n\n" +
	   "“Su mesa está junto a otra que tiene una flor roja.\n" +
	   "El mantel es de un color diferente al de cualquiera de las mesas que están junto a ella.\n" +
	   "Además, en la mesa del intruso no hay una flor amarilla.”",


	10: "Durante un juego, una pelota rompió una ventana. Cuatro niños que estaban presentes dieron su testimonio sobre lo ocurrido."

}


# Diccionario con condiciones de los niveles
var condiciones = {
	1: "",

	2: "Solo una persona es culpable.\n" +
	   "Al menos una persona miente, pero no necesariamente todos.",

	3: "",
	4: "Solo dos de las personas están diciendo la verdad. Todos los demás mienten.",
	5: "Solo puedes detenerte cuando chocas contra un muro. Mientras te deslizas, no puedes cambiar de dirección.",

	6: "Solo uno de los tres animales dice la verdad. Los otros dos están mintiendo.",
	7: "",

	8: "Se sabe que uno dice la verdad y los otros dos mienten.",

	9: "El comensal sospechoso se sienta en una mesa que:\n\n" +
	   "- Está junto a una mesa con una flor roja.\n" +
	   "- Tiene un mantel diferente al de todas las mesas adyacentes.\n" +
	   "- No tiene una flor amarilla.\n"+
		"Nota: “Junto a” significa que dos mesas están conectadas por una línea de puntos.",

	10: "El niño que rompió la ventana miente.\n" +
		"Al menos otro niño también está mintiendo.\n" +
		"Hay exactamente un niño que dice la verdad."

}


# Diccionario con instrucciones de los niveles
var instrucciones = {
	1: "Selecciona a la persona correcta haciendo clic sobre ella.",
	2: "- Acércate a los sospechosos e interrógalos.\n\n" +
	   "- Acércate a los sospechosos e indica al culpable.",
	3: "- Presiona el punto de inicio.\n\n" +
	   "- Luego, sin soltar, traza el camino hasta la letra que creas correcta para la ubicación de la relojería.",
	4: "- Acércate a los sospechosos e interrógalos.\n\n" +
	   "- Acércate a los sospechosos e indica al culpable.",
	5: "- Usa las flechas (botones) o desliza el dedo en la dirección deseada para moverte sobre el hielo.\n\n" +
	   "- Llega al otro lado del lago antes de que se agote el tiempo.",
	
	6: "- Acércate a los animales e interrógalos.\n\n" +
	   "- Completa la proposición lógica.\n\n" +
	   "- Acércate a los animales e indica cuál de ellos es el ladrón de semillas.",
	7: "- Selecciona el día de la semana que creas correcto.",
	8: "- Acércate a los sospechosos e interrógalos.\n\n" +
	   "- Acércate a los sospechosos e indica cuál de ellos está diciendo la verdad.\n\n" + 
	   "- Completa la tabla de verdad.",
	9: "Indica con un clic la ubicación del comensal sospechoso.",
	10: "- Acércate a los niños e interrógalos.\n\n" +
		"- Acércate a los niños e indica cuál de ellos rompió la ventana.\n\n" + 
		"- Completa la proposición lógica.",
}




# Diccionario con declaraciones de los niveles que tienen

var declaraciones = {
	2 : "A: \"Yo no fui, y B miente.\"  [color=#feae34] ˃ A ˹ (ˉ A ˄ ˉ B ) [/color]\n\n" +
		"B: \"C fue el culpable.\" [color=#feae34] ˉ B ˹ C [/color]\n\n" +
		"C: \"A y B mienten.\" [color=#feae34] ˃ C ˹ ( ˉ A ˄ ˉ B) [/color]\n\n" +
		"D: \"Si C dice la verdad, entonces A es culpable,\" [color=#feae34] ˃ D ˹ (C ˃  A) [/color]\n\n",
			
	4 : "Lucas: \"Si Marta es culpable, entonces Sofía también lo es\" [color=#feae34] L ˹ (M ˃ S) [/color]\n\n" +
		"Marta: \"Diego es inocente.\" [color=#feae34] M ˹ ˉ D [/color]\n\n" +
		"Sofía: \"Yo no soy culpable, y Diego miente.\" [color=#feae34] S ˹ (ˉ S ˄ ˉ D) [/color]\n\n" +
		"Diego: \"Lucas es culpable o Sofía está mintiendo.\" [color=#feae34] D ˹ (L ˅ ˉ S) [/color]\n\n" +
		"Carla: \"Si Sofía es inocente, entonces Marta es culpable.\" [color=#feae34] C ˹ (ˉ S ˃ M) [/color]\n\n",

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
	var size = get_viewport().get_visible_rect().size
	print("Resolución actual: ", size)
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
	#animation_player.play("show_pop_up_declaraciones")
	pop_up_declaraciones.visible = true
	print("Anchors:", pop_up_declaraciones.anchor_left, pop_up_declaraciones.anchor_top, pop_up_declaraciones.anchor_right, pop_up_declaraciones.anchor_bottom)
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
	popuptexto.set_conditions(condiciones.get(nivel, "Reglas no disponible."))
	popuptexto.set_instructions(instrucciones.get(nivel, "Reglas no disponible."))

func game_victory():
	$GameVictory.play()
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
		score_label.text = str(puntos_nivel)
	else:
		mostrar_popup_correcto_con_o_sin_declaracion() 
		score_label.text = "0"
		piezas_label.text = "El nivel ya ha sido completado antes"
		
	
	LEVELCORE.numero_de_intentos = 0
	get_tree().paused = popupcorrect.visible
	
func game_end():
	$GameOver.play()
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
	
