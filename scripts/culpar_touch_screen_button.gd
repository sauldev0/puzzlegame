extends TouchScreenButton

const BOTON_CULPAR_BLOQUEADO = preload("res://sprites/puzzles/boton_culpar_bloqueado.png")
const BOTON_CULPAR_DESBLOQUEADO = preload("res://sprites/puzzles/boton_culpar_desbloqueado.png")



func _on_npc_persona_a_area_entered(area):
	texture_normal = BOTON_CULPAR_DESBLOQUEADO


func _on_npc_persona_a_area_exited(area):
	texture_normal = BOTON_CULPAR_BLOQUEADO


func _on_npc_persona_b_area_entered(area):
	texture_normal = BOTON_CULPAR_DESBLOQUEADO


func _on_npc_persona_b_area_exited(area):
	texture_normal = BOTON_CULPAR_BLOQUEADO


func _on_npc_persona_c_area_entered(area):
	texture_normal = BOTON_CULPAR_DESBLOQUEADO


func _on_npc_persona_c_area_exited(area):
	texture_normal = BOTON_CULPAR_BLOQUEADO


func _on_npc_persona_d_area_entered(area):
	texture_normal = BOTON_CULPAR_DESBLOQUEADO


func _on_npc_persona_d_area_exited(area):
	texture_normal = BOTON_CULPAR_BLOQUEADO


func _on_npc_profesor_area_entered(area):
	texture_normal = BOTON_CULPAR_DESBLOQUEADO


func _on_npc_profesor_area_exited(area):
	texture_normal = BOTON_CULPAR_BLOQUEADO
