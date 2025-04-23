extends Control

@export var menu_size = 0.45
@export var lerp_speed = 0.2
@onready var texture_button = $VBoxContainer/TextureButton
@onready var description_label = $VBoxContainer/NinePatchRect/MarginContainer/VBoxContainer/DescriptionLabel

var popped_up = true 
var up_anchor = Vector2(1-menu_size,1)
var down_anchor = Vector2(1,1+menu_size)
var target_anchor = up_anchor

func _ready():
	print("popuptexto activo")

func _process(delta):
	anchor_top = lerp(anchor_top,target_anchor.x,lerp_speed)
	anchor_bottom = lerp(anchor_bottom,target_anchor.y,lerp_speed)

func _on_texture_button_pressed():
	#texture_button.disabled = false
	if !popped_up:
		target_anchor = up_anchor
	else:
		target_anchor = down_anchor
	popped_up = !popped_up

func _on_menu_pausa_pressed_menu_pausa():
	target_anchor = down_anchor
	
func set_description(text: String):
	description_label.text = text
	
	
	
