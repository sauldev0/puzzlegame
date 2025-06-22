extends Area2D
@export var is_correct:bool
var npc_id = "conejo"

const CONEJO_LVL_6 = preload("res://dialogues/Conejo_lvl6.dialogue")
var is_player_close = false
var is_dialogue_active = false
@onready var label_name_conejo = $LabelNameConejo
@onready var panel_dialogo_conejo = $PanelDialogoConejo
@onready var quiz_input_conejo = $"../UID/QuizInputConejo"



func _ready():
	DialogueManager.dialogue_started.connect(on_dialogue_started)
	DialogueManager.dialogue_ended.connect(on_dialogue_ended)
	quiz_input_conejo.quiz_resuelto.connect(_on_quiz_resuelto)

func _process(delta):
	if is_player_close and Input.is_action_just_pressed("Interrogar") and not is_dialogue_active:
		DialogueManager.show_dialogue_balloon(CONEJO_LVL_6, "start")
		
func _on_quiz_resuelto(resuelto_npc_id):
	if resuelto_npc_id == npc_id:
		LEVELCORE.marcar_quiz_como_resuelto(npc_id)

func _on_area_entered(area):
	is_player_close = true

func _on_area_exited(area):
	is_player_close = false
	
func on_dialogue_started(dialogue):
	var is_dialogue_active = true
	LEVELCORE.dialogo_activo = true
	
func on_dialogue_ended(dialogue):
	# Se asegura que este nodo solo reaccione a su diálogo
	if dialogue != CONEJO_LVL_6:
		return
	await get_tree().create_timer(0.2).timeout
	
	if not LEVELCORE.quiz_ya_resuelto(npc_id):
		quiz_input_conejo.npc_id = npc_id
		quiz_input_conejo.visible = true
	
	panel_dialogo_conejo.visible = true
	label_name_conejo.visible = true
	var is_dialogue_active = false
	LEVELCORE.dialogo_activo = false
