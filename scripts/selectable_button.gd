extends Control

@onready var label_left = $VBoxContainer/HBoxContainer/LabelLeft
@onready var label_right = $VBoxContainer/HBoxContainer/LabelRight
@onready var button = $VBoxContainer/HBoxContainer/Button

func _ready():
	label_left.visible = false
	label_right.visible = false
	button.connect("mouse_entered", Callable(self, "_on_mouse_entered"))
	button.connect("mouse_exited", Callable(self, "_on_mouse_exited"))


func _on_button_mouse_entered():
	label_left.visible = true
	label_right.visible = true
	label_left.modulate.a = 0
	label_right.modulate.a = 0
	tween_property(label_left, "modulate:a", 1.0, 0.2)
	tween_property(label_right, "modulate:a", 1.0, 0.2)


func _on_button_mouse_exited():
	label_left.visible = false
	label_right.visible = false
	tween_property(label_left, "modulate:a", 0.0, 0.2)
	tween_property(label_right, "modulate:a", 0.0, 0.2)
	
func tween_property(node, property_name, final_value, duration):
	var tween = create_tween()
	tween.tween_property(node, property_name, final_value, duration)
