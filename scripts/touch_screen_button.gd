extends TouchScreenButton
const BOTON_INTERROGAR_DESBLOQUEADO = preload("res://sprites/puzzles/boton_interrogar_desbloqueado.png")
const BOTON_INTERROGAR_BLOQUEADO = preload("res://sprites/puzzles/boton_interrogar_bloqueado.png")

func _on_npc_persona_a_area_entered(area):
	texture_normal = BOTON_INTERROGAR_DESBLOQUEADO

func _on_npc_persona_a_area_exited(area):
	texture_normal = BOTON_INTERROGAR_BLOQUEADO


func _on_npc_persona_b_area_entered(area):
	texture_normal = BOTON_INTERROGAR_DESBLOQUEADO

func _on_npc_persona_b_area_exited(area):
	texture_normal = BOTON_INTERROGAR_BLOQUEADO


func _on_npc_persona_c_area_entered(area):
	texture_normal = BOTON_INTERROGAR_DESBLOQUEADO

func _on_npc_persona_c_area_exited(area):
	texture_normal = BOTON_INTERROGAR_BLOQUEADO


func _on_npc_persona_d_area_entered(area):
	texture_normal = BOTON_INTERROGAR_DESBLOQUEADO

func _on_npc_persona_d_area_exited(area):
	texture_normal = BOTON_INTERROGAR_BLOQUEADO


func _on_npc_profesor_area_entered(area):
	texture_normal = BOTON_INTERROGAR_DESBLOQUEADO


func _on_npc_profesor_area_exited(area):
	texture_normal = BOTON_INTERROGAR_BLOQUEADO
