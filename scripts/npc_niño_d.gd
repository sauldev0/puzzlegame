extends Area2D

@export var is_correct:bool
@onready var label_name_d = $LabelNameD
@onready var panel_dialogo_d = $PanelDialogoD

const NIÑO_D_LVL_10 = preload("res://dialogues/NiñoD_lvl10.dialogue")
var is_player_close = false
var is_dialogue_active = false

func _ready():
	DialogueManager.dialogue_started.connect(on_dialogue_started)
	DialogueManager.dialogue_ended.connect(on_dialogue_ended)

func _process(delta):
	if is_player_close and Input.is_action_just_pressed("Interrogar") and not is_dialogue_active:
		DialogueManager.show_dialogue_balloon(NIÑO_D_LVL_10, "start")

func _on_area_entered(area):
	is_player_close = true

func _on_area_exited(area):
	is_player_close = false
	
func on_dialogue_started(dialogue):
	var is_dialogue_active = true
	LEVELCORE.dialogo_activo = true
	
func on_dialogue_ended(dialogue):
	# Se asegura que este nodo solo reaccione a su diálogo
	if dialogue != NIÑO_D_LVL_10:
		return
	await get_tree().create_timer(0.2).timeout
	panel_dialogo_d.visible = true
	label_name_d.visible = true
	var is_dialogue_active = false
	LEVELCORE.dialogo_activo = false
