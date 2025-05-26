extends Node2D
const CANDADONIVEL = preload("res://sprites/puzzles/candadonivel.png")
const ruta_icono_candado = "res://sprites/puzzles/candadonivel.png"
const PIEZAPUZZLEGRIS = preload("res://sprites/puzzles/piezapuzzlegris.png")
@onready var button_1 = $Control/ScrollContainer/VBoxContainer/HBoxContainer/LevelButton1/VBoxContainer/Button1
@onready var button_2 = $Control/ScrollContainer/VBoxContainer/HBoxContainer/LevelButton2/VBoxContainer/Button2
@onready var button_3 = $Control/ScrollContainer/VBoxContainer/HBoxContainer/LevelButton3/VBoxContainer/Button3
@onready var button_4 = $Control/ScrollContainer/VBoxContainer/HBoxContainer/LevelButton4/VBoxContainer/Button4

#var button = get_tree().get_nodes_in_group("LevelsButtons")
func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _ready():
	#button.grab_focus()
	print("lvl1 =" + str(LEVELCORE.lvl1_completed))
	print("lvl2 =" + str(LEVELCORE.lvl2_completed))
	print("lvl3 =" + str(LEVELCORE.lvl3_completed))
	print("lvl4 =" + str(LEVELCORE.lvl4_completed))
	print("lvl5 =" + str(LEVELCORE.lvl5_completed))
	print("lvl6 =" + str(LEVELCORE.lvl6_completed))
	print("lvl7 =" + str(LEVELCORE.lvl7_completed))
	print("lvl8 =" + str(LEVELCORE.lvl8_completed))
	print("lvl9 =" + str(LEVELCORE.lvl9_completed))
	
	#var icono_candado = load(ruta_icono_candado)
	

	# Nivel 1
	if LEVELCORE.lvl1_completed == true and LEVELCORE.lvl2_completed == false:
		button_2.icon = PIEZAPUZZLEGRIS
		
	if LEVELCORE.lvl1_completed == false:
		button_1.icon = PIEZAPUZZLEGRIS
	
	# Nivel 2
	if LEVELCORE.lvl2_completed == true and LEVELCORE.lvl3_completed == false:
		button_3.icon = PIEZAPUZZLEGRIS
		
	if LEVELCORE.lvl2_completed == false and LEVELCORE.lvl1_completed == false:
		button_2.icon = CANDADONIVEL
	
	# Nivel 3
	if LEVELCORE.lvl3_completed == true and LEVELCORE.lvl4_completed == false:
		button_4.icon = PIEZAPUZZLEGRIS
		
	if LEVELCORE.lvl3_completed == false and LEVELCORE.lvl2_completed == false:
		button_3.icon = CANDADONIVEL
		
	# Nivel 4
	if LEVELCORE.lvl4_completed == true and LEVELCORE.lvl5_completed == false:
		pass
		#button_5.icon = PIEZAPUZZLEGRIS
		
	if LEVELCORE.lvl4_completed == false and LEVELCORE.lvl3_completed == false:
		button_4.icon = CANDADONIVEL
		
func _on_button_1_pressed():
	if LEVELCORE.lvl1_completed == false:
		get_tree().change_scene_to_file("res://scenes/lvl_1.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/lvl_1.tscn")
		
func _on_button_2_pressed():
	if LEVELCORE.lvl1_completed == false:
		null
	if LEVELCORE.lvl1_completed == true:
		get_tree().change_scene_to_file("res://scenes/lvl_2.tscn")
		
func _on_button_3_pressed():
	if LEVELCORE.lvl2_completed == false:
		null
	if LEVELCORE.lvl2_completed == true:
		get_tree().change_scene_to_file("res://scenes/lvl_3.tscn")
		
func _on_button_4_pressed():
	if LEVELCORE.lvl3_completed == false:
		null
	if LEVELCORE.lvl3_completed == true:
		get_tree().change_scene_to_file("res://scenes/lvl_4.tscn")
		
