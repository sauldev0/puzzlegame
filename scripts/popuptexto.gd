extends Control

@export var menu_size = 0.45
@export var lerp_speed = 0.2

@onready var texture_button = $VBoxContainer/TextureButton
@onready var description_label = $"VBoxContainer/NinePatchRect/MarginContainer/TabContainer/Descripción/MarginContainer/DescriptionLabel"
@onready var instructions_label = $VBoxContainer/NinePatchRect/MarginContainer/TabContainer/Instrucciones/MarginContainer/InstructionsLabel
@onready var conditions_label = $VBoxContainer/NinePatchRect/MarginContainer/TabContainer/Condiciones/MarginContainer/ConditionsLabel



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
	if !popped_up:
		target_anchor = up_anchor
	else:
		target_anchor = down_anchor
	popped_up = !popped_up

func _on_menu_pausa_pressed_menu_pausa():
	target_anchor = down_anchor

func set_description(text: String):
	description_label.text = text

func set_instructions(text: String):
	instructions_label.text = text

func set_conditions(text: String):
	var tab_container = $"VBoxContainer/NinePatchRect/MarginContainer/TabContainer"
	var condiciones_tab = tab_container.get_node_or_null("Condiciones")

	if text.strip_edges() == "" and condiciones_tab:
		tab_container.set_tab_hidden(tab_container.get_tab_idx_from_control(condiciones_tab), true)
	else:
		conditions_label.text = text
		tab_container.set_tab_hidden(tab_container.get_tab_idx_from_control(condiciones_tab), false)
