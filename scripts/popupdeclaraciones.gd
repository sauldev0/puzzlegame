extends Control

@onready var declaraciones_label = $PanelContainer/MarginContainer/VBoxContainer/DeclaracionesLabel

func set_declarations(text: String):
	declaraciones_label.bbcode_text = text
