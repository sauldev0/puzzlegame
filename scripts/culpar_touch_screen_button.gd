extends TouchScreenButton
@onready var npc_id_actual = ""  # para saber cuál NPC está cerca


const BOTON_CULPAR_BLOQUEADO = preload("res://sprites/puzzles/boton_culpar_bloqueado.png")
const BOTON_CULPAR_DESBLOQUEADO = preload("res://sprites/puzzles/boton_culpar_desbloqueado.png")

func _on_quiz_resuelto(resuelto_npc_id):
	if resuelto_npc_id == npc_id_actual:
		verificar_estado_boton()

func _ready():
	LEVELCORE.connect("quiz_resuelto", _on_quiz_resuelto)

func verificar_estado_boton():
	if LEVELCORE.quiz_ya_resuelto(npc_id_actual):
		texture_normal = BOTON_CULPAR_DESBLOQUEADO
		LEVELCORE.puede_usarse_boton_culpar = true
	else:
		texture_normal = BOTON_CULPAR_BLOQUEADO
		LEVELCORE.puede_usarse_boton_culpar = false

func desactivar_boton():
	texture_normal = BOTON_CULPAR_BLOQUEADO
	#mouse_filter = Control.MOUSE_FILTER_IGNORE

func _on_npc_zorro_area_entered(area):
	npc_id_actual = "zorro"
	print(LEVELCORE.quiz_resueltos)
	verificar_estado_boton()
	
func _on_npc_zorro_area_exited(area):
	npc_id_actual = ""
	desactivar_boton()


func _on_npc_buho_area_entered(area):
	npc_id_actual = "buho"
	verificar_estado_boton()

func _on_npc_buho_area_exited(area):
	npc_id_actual = ""
	desactivar_boton()


func _on_npc_conejo_area_entered(area):
	npc_id_actual = "conejo"
	verificar_estado_boton()

func _on_npc_conejo_area_exited(area):
	npc_id_actual = ""
	desactivar_boton()
