extends Area2D

const PROFESOR_LVL_2 = preload("res://dialogues/Profesor_lvl2.dialogue")
var is_player_close = false
var is_dialogue_active = false


func _ready():
	DialogueManager.dialogue_started.connect(on_dialogue_started)
	DialogueManager.dialogue_ended.connect(on_dialogue_ended)

func _process(delta):
	if is_player_close and Input.is_action_just_pressed("Interrogar") and not is_dialogue_active:
		DialogueManager.show_dialogue_balloon(PROFESOR_LVL_2, "start")

func _on_area_entered(area):
	is_player_close = true

func _on_area_exited(area):
	is_player_close = false
	
func on_dialogue_started(dialogue):
	var is_dialogue_active = true
	
func on_dialogue_ended(dialogue):
	await get_tree().create_timer(0.2).timeout
	var is_dialogue_active = false
