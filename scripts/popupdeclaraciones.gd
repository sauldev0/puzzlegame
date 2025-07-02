extends Control

@onready var declaraciones_label = $PanelContainer/MarginContainer/VBoxContainer/DeclaracionesLabel
@onready var view_table = $PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/ViewTable
@onready var view_declarations = $PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/ViewDeclarations
@onready var pop_up_tabla = $PopUpTabla
@onready var tabla_lvl_4 = $PanelContainer/MarginContainer/VBoxContainer/CenterContainer/TablaLvl4
@onready var label = $PanelContainer/MarginContainer/VBoxContainer/Label
@onready var panel_container = $PanelContainer

var niveles_con_declaraciones_y_tabla = [4]

func set_declarations(text: String):
	declaraciones_label.bbcode_text = text


	
func _ready():
	await get_tree().create_timer(0.1).timeout
	actualizar_visibilidad_tabla()
	print("Nivel actual para declaraciones:", LEVELCORE.nivel_actual)
	print("Anchors:", anchor_left, anchor_top, anchor_right, anchor_bottom)
	

func actualizar_visibilidad_tabla():
	var nivel = LEVELCORE.nivel_actual
	if nivel in niveles_con_declaraciones_y_tabla:
		view_table.visible = true

func _on_view_table_pressed():
	#pop_up_tabla.visible = true
	#panel_container.size = Vector2(3544, 1300)
	#var screen_size = get_viewport_rect().size
	#var menu_size = panel_container.size
	#panel_container.position = (screen_size - menu_size) / 2
	#panel_container.set_anchors_preset(Control.PRESET_CENTER)
	
	
	tabla_lvl_4.visible = true
	declaraciones_label.visible = false
	label.visible = false
	view_declarations.visible = true
	view_table.visible = false

func _on_view_declarations_pressed():
	tabla_lvl_4.visible = false
	declaraciones_label.visible = true
	label.visible = true
	view_declarations.visible = false
	view_table.visible = true
