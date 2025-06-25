extends Area2D

@export var is_correct:bool
@onready var panel_dialogo_b = $PanelDialogoB
@onready var label_name_b = $LabelNameB


const SOSPECHOSO_B_LVL_8 = preload("res://dialogues/SospechosoB_lvl8.dialogue")
var is_player_close = false
var is_dialogue_active = false


func _ready():
	DialogueManager.dialogue_started.connect(on_dialogue_started)
	DialogueManager.dialogue_ended.connect(on_dialogue_ended)

func _process(delta):
	if is_player_close and Input.is_action_just_pressed("Interrogar") and not is_dialogue_active:
		DialogueManager.show_dialogue_balloon(SOSPECHOSO_B_LVL_8, "start")

func _on_area_entered(area):
	is_player_close = true

func _on_area_exited(area):
	is_player_close = false
	
func on_dialogue_started(dialogue):
	var is_dialogue_active = true
	LEVELCORE.dialogo_activo = true
	
func on_dialogue_ended(dialogue):
	# Se asegura que este nodo solo reaccione a su diálogo
	if dialogue != SOSPECHOSO_B_LVL_8:
		return
	await get_tree().create_timer(0.2).timeout
	panel_dialogo_b.visible = true
	label_name_b.visible = true
	var is_dialogue_active = false
	LEVELCORE.dialogo_activo = false
