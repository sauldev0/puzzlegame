extends Control
signal quiz_resuelto(npc_id)
var npc_id := ""

@onready var resultado := $PanelContainer/VBoxContainer/ResultadoLabel
@onready var opcion1 = $PanelContainer/VBoxContainer/HBoxContainer/OptionButton

var correcta1 = "˃"

func _ready():
	
	var opciones := ["", "˄", "˅", "ˉ", "˃", "˹"]
	for texto in opciones:
		opcion1.add_item(texto)

	$Button.pressed.connect(verificar_respuesta)

func verificar_respuesta():
	var seleccion1 = opcion1.get_item_text(opcion1.selected)

	if seleccion1 == correcta1:
		resultado.text = "¡Correcto!"

		emit_signal("quiz_resuelto", npc_id)  #notifica que se resolvió
		await get_tree().create_timer(1.5).timeout
		visible = false
	else:
		resultado.text = "Incorrecto. Intenta de nuevo."
