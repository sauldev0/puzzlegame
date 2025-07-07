extends Node2D

const CANDADONIVEL = preload("res://sprites/puzzles/candadonivel.png")
const PIEZAPUZZLEGRIS = preload("res://sprites/puzzles/piezapuzzlegris.png")
const ESTRELLA_LLENA = preload("res://sprites/puzzles/estrella_llena.png")
const ESTRELLA_VACIA = preload("res://sprites/puzzles/estrella_vacia.png")
@onready var h_box_container_4 = $Control/ScrollContainer/VBoxContainer/HBoxContainer4
@onready var level_button_11 = $Control/ScrollContainer/VBoxContainer/HBoxContainer3/LevelButton11
@onready var level_button_12 = $Control/ScrollContainer/VBoxContainer/HBoxContainer3/LevelButton12
@onready var level_button_10 = $Control/ScrollContainer/VBoxContainer/HBoxContainer3/LevelButton10




@onready var button_1 = $Control/ScrollContainer/VBoxContainer/HBoxContainer/LevelButton1/VBoxContainer/Button1
@onready var button_2 = $Control/ScrollContainer/VBoxContainer/HBoxContainer/LevelButton2/VBoxContainer/Button2
@onready var button_3 = $Control/ScrollContainer/VBoxContainer/HBoxContainer/LevelButton3/VBoxContainer/Button3
@onready var button_4 = $Control/ScrollContainer/VBoxContainer/HBoxContainer/LevelButton4/VBoxContainer/Button4
@onready var button_5 = $Control/ScrollContainer/VBoxContainer/HBoxContainer2/LevelButton5/VBoxContainer/Button5
@onready var button_6 = $Control/ScrollContainer/VBoxContainer/HBoxContainer2/LevelButton6/VBoxContainer/Button6
@onready var button_7 = $Control/ScrollContainer/VBoxContainer/HBoxContainer2/LevelButton7/VBoxContainer/Button7
@onready var button_8 = $Control/ScrollContainer/VBoxContainer/HBoxContainer2/LevelButton8/VBoxContainer/Button8
@onready var button_9 = $Control/ScrollContainer/VBoxContainer/HBoxContainer3/LevelButton9/VBoxContainer/Button9
@onready var button_10 = $Control/ScrollContainer/VBoxContainer/HBoxContainer3/LevelButton10/VBoxContainer/Button10
@onready var button_11 = $Control/ScrollContainer/VBoxContainer/HBoxContainer3/LevelButton11/VBoxContainer/Button11
@onready var button_12 = $Control/ScrollContainer/VBoxContainer/HBoxContainer3/LevelButton12/VBoxContainer/Button12



@onready var stars_1 = $Control/ScrollContainer/VBoxContainer/HBoxContainer/LevelButton1/stars1
@onready var stars_2 = $Control/ScrollContainer/VBoxContainer/HBoxContainer/LevelButton2/stars2
@onready var stars_3 = $Control/ScrollContainer/VBoxContainer/HBoxContainer/LevelButton3/stars3
@onready var stars_4 = $Control/ScrollContainer/VBoxContainer/HBoxContainer/LevelButton4/stars4
@onready var stars_5 = $Control/ScrollContainer/VBoxContainer/HBoxContainer2/LevelButton5/stars5
@onready var stars_6 = $Control/ScrollContainer/VBoxContainer/HBoxContainer2/LevelButton6/stars6
@onready var stars_7 = $Control/ScrollContainer/VBoxContainer/HBoxContainer2/LevelButton7/stars7
@onready var stars_8 = $Control/ScrollContainer/VBoxContainer/HBoxContainer2/LevelButton8/stars8
@onready var stars_9 = $Control/ScrollContainer/VBoxContainer/HBoxContainer3/LevelButton9/stars9
@onready var stars_10 = $Control/ScrollContainer/VBoxContainer/HBoxContainer3/LevelButton10/stars10
@onready var stars_11 = $Control/ScrollContainer/VBoxContainer/HBoxContainer3/LevelButton11/stars11
@onready var stars_12 = $Control/ScrollContainer/VBoxContainer/HBoxContainer3/LevelButton12/stars12


#asigna la textura de las estrellas segun las estrellas obtenidas del nivel
func actualizar_estrellas(stars: int, container: Node):
	for i in range(3):
		var estrella = container.get_child(i)
		if i < stars:
			estrella.texture = ESTRELLA_LLENA
		else:
			estrella.texture = ESTRELLA_VACIA

func _on_button_pressed():
	#$BackButtonAudio.play()
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _ready():
	
	#if LEVELCORE.score_total >= 900: #desbloquear nivel secreto
		#level_button_10.visible = true
		#level_button_11.visible = true
		#level_button_12.visible = true
	#button.grab_focus()
	print("¿Juego en pausa?", get_tree().paused)
	print("lvl1 =" + str(LEVELCORE.lvl1_completed))
	print("lvl2 =" + str(LEVELCORE.lvl2_completed))
	print("lvl3 =" + str(LEVELCORE.lvl3_completed))
	print("lvl4 =" + str(LEVELCORE.lvl4_completed))
	print("lvl5 =" + str(LEVELCORE.lvl5_completed))
	print("lvl6 =" + str(LEVELCORE.lvl6_completed))
	print("lvl7 =" + str(LEVELCORE.lvl7_completed))
	print("lvl8 =" + str(LEVELCORE.lvl8_completed))
	print("lvl9 =" + str(LEVELCORE.lvl9_completed))
	print("lvl10 =" + str(LEVELCORE.lvl10_completed))
	print("lvl11 =" + str(LEVELCORE.lvl11_completed))
	print("lvl12 =" + str(LEVELCORE.lvl12_completed))
	
	
	actualizar_estrellas(LEVELCORE.lvl1_stars, stars_1)
	actualizar_estrellas(LEVELCORE.lvl2_stars, stars_2)
	actualizar_estrellas(LEVELCORE.lvl3_stars, stars_3)
	actualizar_estrellas(LEVELCORE.lvl4_stars, stars_4)
	actualizar_estrellas(LEVELCORE.lvl5_stars, stars_5)
	actualizar_estrellas(LEVELCORE.lvl6_stars, stars_6)
	actualizar_estrellas(LEVELCORE.lvl7_stars, stars_7)
	actualizar_estrellas(LEVELCORE.lvl8_stars, stars_8)
	actualizar_estrellas(LEVELCORE.lvl9_stars, stars_9)
	actualizar_estrellas(LEVELCORE.lvl10_stars, stars_10)
	actualizar_estrellas(LEVELCORE.lvl11_stars, stars_11)
	actualizar_estrellas(LEVELCORE.lvl12_stars, stars_12)

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
		button_5.icon = PIEZAPUZZLEGRIS
		
	if LEVELCORE.lvl4_completed == false and LEVELCORE.lvl3_completed == false:
		button_4.icon = CANDADONIVEL
		
	# Nivel 5
	if LEVELCORE.lvl5_completed == true and LEVELCORE.lvl6_completed == false:
		button_6.icon = PIEZAPUZZLEGRIS
		
	if LEVELCORE.lvl5_completed == false and LEVELCORE.lvl4_completed == false:
		button_5.icon = CANDADONIVEL
	
	# Nivel 6
	if LEVELCORE.lvl6_completed == true and LEVELCORE.lvl7_completed == false:
		button_7.icon = PIEZAPUZZLEGRIS
		
	if LEVELCORE.lvl6_completed == false and LEVELCORE.lvl5_completed == false:
		button_6.icon = CANDADONIVEL
	
	# Nivel 7
	if LEVELCORE.lvl7_completed == true and LEVELCORE.lvl8_completed == false:
		button_8.icon = PIEZAPUZZLEGRIS
		
	if LEVELCORE.lvl7_completed == false and LEVELCORE.lvl6_completed == false:
		button_7.icon = CANDADONIVEL
	
	# Nivel 8
	if LEVELCORE.lvl8_completed == true and LEVELCORE.lvl9_completed == false:
		pass
		button_9.icon = PIEZAPUZZLEGRIS
		
	if LEVELCORE.lvl8_completed == false and LEVELCORE.lvl7_completed == false:
		button_8.icon = CANDADONIVEL

	# Nivel 9
	if LEVELCORE.lvl9_completed == true and LEVELCORE.lvl10_completed == false:
		button_10.icon = PIEZAPUZZLEGRIS
		
	if LEVELCORE.lvl9_completed == false and LEVELCORE.lvl8_completed == false:
		button_9.icon = CANDADONIVEL
		
	# Nivel 10
	if LEVELCORE.lvl10_completed == true and LEVELCORE.lvl11_completed == false:
		button_11.icon = PIEZAPUZZLEGRIS
		
	if LEVELCORE.lvl10_completed == false and LEVELCORE.lvl9_completed == false:
		button_10.icon = CANDADONIVEL
		
	# Nivel 11
	if LEVELCORE.lvl11_completed == true and LEVELCORE.lvl12_completed == false:
		button_12.icon = PIEZAPUZZLEGRIS
		
	if LEVELCORE.lvl11_completed == false and LEVELCORE.lvl10_completed == false:
		button_11.icon = CANDADONIVEL
		
	# Nivel 12
	if LEVELCORE.lvl12_completed == true: #and LEVELCORE.lvl13_completed == false:
		pass
		#button_13.icon = PIEZAPUZZLEGRIS
		
	if LEVELCORE.lvl12_completed == false and LEVELCORE.lvl11_completed == false:
		button_12.icon = CANDADONIVEL
		
	
func _on_button_1_pressed():
	if LEVELCORE.lvl1_completed == false:
		get_tree().change_scene_to_file("res://scenes/lvl_1_intro.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/lvl_1_intro.tscn")
		
func _on_button_2_pressed():
	if LEVELCORE.lvl1_completed == false:
		null
	if LEVELCORE.lvl1_completed == true:
		get_tree().change_scene_to_file("res://scenes/lvl_2_intro.tscn")
		
func _on_button_3_pressed():
	if LEVELCORE.lvl2_completed == false:
		null
	if LEVELCORE.lvl2_completed == true:
		get_tree().change_scene_to_file("res://scenes/lvl_3_intro.tscn")
		
func _on_button_4_pressed():
	if LEVELCORE.lvl3_completed == false:
		null
	if LEVELCORE.lvl3_completed == true:
		get_tree().change_scene_to_file("res://scenes/lvl_4_intro.tscn")

func _on_button_5_pressed():
	if LEVELCORE.lvl4_completed == false:
		null
	if LEVELCORE.lvl4_completed == true:
		get_tree().change_scene_to_file("res://scenes/lvl_5_intro.tscn")

func _on_button_6_pressed():
	if LEVELCORE.lvl5_completed == false:
		null
	if LEVELCORE.lvl5_completed == true:
		get_tree().change_scene_to_file("res://scenes/lvl_6_intro.tscn")

func _on_button_7_pressed():
	if LEVELCORE.lvl6_completed == false:
		null
	if LEVELCORE.lvl6_completed == true:
		get_tree().change_scene_to_file("res://scenes/lvl_7_intro.tscn")

func _on_button_8_pressed():
	if LEVELCORE.lvl7_completed == false:
		null
	if LEVELCORE.lvl7_completed == true:
		get_tree().change_scene_to_file("res://scenes/lvl_8_intro.tscn")

func _on_button_9_pressed():
	if LEVELCORE.lvl8_completed == false:
		null
	if LEVELCORE.lvl8_completed == true:
		get_tree().change_scene_to_file("res://scenes/lvl_9_intro.tscn")

func _on_button_10_pressed():
	if LEVELCORE.lvl9_completed == false:
		null
	if LEVELCORE.lvl9_completed == true:
		get_tree().change_scene_to_file("res://scenes/lvl_10_intro.tscn")

func _on_button_11_pressed():
	if LEVELCORE.lvl10_completed == false:
		null
	if LEVELCORE.lvl10_completed == true:
		get_tree().change_scene_to_file("res://scenes/lvl_11.tscn")

func _on_button_12_pressed():
	if LEVELCORE.lvl11_completed == false:
		null
	if LEVELCORE.lvl11_completed == true:
		get_tree().change_scene_to_file("res://scenes/lvl_12.tscn")
