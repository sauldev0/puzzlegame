extends Node2D

@onready var button = $Button
@onready var button_2 = $Button2
@onready var button_3 = $Button3
@onready var lvl_1_completed = $lvl1_completed
@onready var lvl_2_completed = $lvl2_completed
@onready var lvl_3_completed = $lvl3_completed
@onready var lvl_1_locked = $lvl1_locked
@onready var lvl_2_locked = $lvl2_locked
@onready var lvl_3_locked = $lvl3_locked
@onready var lock_1 = $lock1
@onready var lock_2 = $lock2

func _ready():
	button.grab_focus()
	print("lvl1 =" + str(LEVELCORE.lvl1_completed))
	print("lvl2 =" + str(LEVELCORE.lvl2_completed))
	
	
	# Nivel 1
	if LEVELCORE.lvl1_completed == true:
		lvl_1_locked.visible = false
		lock_1.visible = false
		
	if LEVELCORE.lvl1_completed == false:
		lvl_1_locked.visible = true
		lock_1.visible = true
		
	# Nivel 2
	if LEVELCORE.lvl2_completed == true:
		lvl_2_locked.visible = false
		lock_2.visible = false
		
	if LEVELCORE.lvl2_completed == false:
		lvl_2_locked.visible = true
	
		# Nivel 3
	if LEVELCORE.lvl3_completed == true:
		lvl_3_locked.visible = false
		lock_2.visible = false
		
	if LEVELCORE.lvl3_completed == false:
		lvl_3_locked.visible = true
		
func _on_button_pressed():
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
		get_tree().change_scene_to_file("res://scenes/lvl_9.tscn")
