extends Control

@onready var resultado := $PanelContainer/MarginContainer/VBoxContainer/ResultadoLabel
@onready var opcion1 = $PanelContainer/MarginContainer/VBoxContainer/GridContainer/PanelContainer16/MarginContainer/OptionButton
@onready var opcion2 = $PanelContainer/MarginContainer/VBoxContainer/GridContainer/PanelContainer19/MarginContainer/OptionButton
@onready var game_controller = $"../Game Controller"

signal quiz_tabla_resuelto

var correcta1 = "True"
var correcta2 = "True"

func _ready():
	
	var opciones = ["True", "False"]
	for texto in opciones:
		opcion1.add_item(texto)
		opcion2.add_item(texto)
		
	opcion1.select(-1)
	opcion2.select(-1)

	$PanelContainer/MarginContainer/VBoxContainer/Button.pressed.connect(verificar_respuesta)
	
func verificar_respuesta():
	var seleccion1 = opcion1.get_item_text(opcion1.selected)
	var seleccion2 = opcion2.get_item_text(opcion2.selected)
	
	if seleccion1 == correcta1 and seleccion2 == correcta2:
		resultado.text = "Correcto!!"
		var settings = resultado.label_settings
		if settings == null:
			settings = LabelSettings.new()
		else:
			settings = settings.duplicate()
		settings.font_color = Color.GREEN_YELLOW
		resultado.label_settings = settings
		
		emit_signal("quiz_tabla_resuelto")
		await get_tree().create_timer(1.5).timeout
		game_controller.call('game_victory')
		visible = false
		
	else:
		resultado.text = "Incorrecto, intenta de nuevo"
		var settings = resultado.label_settings
		if settings == null:
			settings = LabelSettings.new()
		else:
			settings = settings.duplicate()
		settings.font_color = Color.CRIMSON
		resultado.label_settings = settings
		
