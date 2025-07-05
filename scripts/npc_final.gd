extends Area2D

@onready var panel_dialogo = $Sprite2D/PanelDialogo


func _on_body_entered(body):
	panel_dialogo.visible = true
	



func _on_area_entered(area):
	panel_dialogo.visible = true
