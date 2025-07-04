extends Control

@onready var animation_player = $AnimationPlayer
const retraso := 0.1
var puede_hacer_click := false

func _ready():
	await get_tree().create_timer(retraso).timeout
	animation_player.play("show_title")
	await animation_player.animation_finished
	puede_hacer_click = true

func _input(event):
	if puede_hacer_click and event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		animation_player.play("hide_title")
		puede_hacer_click = false 
		await animation_player.animation_finished
		get_tree().change_scene_to_file("res://scenes/lvl_9.tscn")
