extends Control

@onready var scroll_container = $ScrollContainer
@onready var v_scroll_bar = scroll_container.get_v_scroll_bar()
@onready var credits_text = $ScrollContainer/VBoxContainer/CreditsText

var scroll_speed := 100  # píxeles por segundo

func _ready():
	credits_text.bbcode_enabled = true
	credits_text.bbcode_text = """"[color=#4c60aa][center][b]CRÉDITOS[/b][/center][/color]

[color=#4c60aa][b]Dirección y Producción[/b][/color]

Director del Proyecto: Saúl Pérez  
Productor Ejecutivo: Saúl Pérez  
Coordinación General: Saúl Pérez  

[color=#4c60aa][b]Desarrollo y Programación[/b][/color]
 
Diseño de Juego (Game Design): Saúl Pérez  
Programación Principal: Saúl Pérez  
Diseño de Mecánicas: Saúl Pérez  
Desarrollo de IA / Sistemas: Saúl Pérez  
Implementación de UI/UX: Saúl Pérez  

[color=#4c60aa][b]Arte y Diseño Visual[/b][/color] 

Dirección de Arte: Saúl Pérez  
Diseño de Personajes: Saúl Pérez  
Diseño de Entornos / Escenarios: Saúl Pérez  
Animaciones 2D: Saúl Pérez  
Diseño de Interfaces: Saúl Pérez  

[color=#4c60aa][b]Narrativa y Guion[/b][/color]  

Historia y Concepto Narrativo: Saúl Pérez  
Guion Original: José Casu  
Diálogos y Texto In-Game: Saúl Pérez  
Diseño Narrativo: Saúl Pérez  

[color=#4c60aa][b]Música y Sonido[/b][/color]  

Diseño de Sonido (SFX): Saúl Pérez  
Implementación de Audio: Saúl Pérez  

[color=#4c60aa][b]Pruebas y QA[/b][/color]  

Testing Interno: Saúl Pérez  
Control de Calidad (QA): Saúl Pérez  

[color=#4c60aa][b]Marketing y Publicidad[/b][/color]  

Diseño de Material Promocional: Saúl Pérez  
Community Manager: Saúl Pérez  
Relaciones Públicas: Saúl Pérez  

[color=#4c60aa][b]Herramientas y Tecnologías[/b][/color]  

Motor del Juego: Godot Engine  
Lenguaje de Programación: GDScript  
Software de Arte: LibreSprite  
Software de Audio: Audacity  

[color=#4c60aa][b]Agradecimientos Especiales[/b][/color]  

A todas las personas que probaron el juego y dieron su opinión.  
A la comunidad de Godot Engine por su increíble apoyo.  
A familiares y amigos por su paciencia y apoyo incondicional.  

[color=#4c60aa][b]Licencias y Recursos[/b][/color] 
 
Algunos sonidos, imágenes o fuentes pueden haber sido tomados de bibliotecas libres como:  
- Freesound.org  
- OpenGameArt.org  
- Kenney.nl  

[color=#5fc9e7][b]Logikazo[/b][/color] 
© 2025 Saúl Pérez. Todos los derechos reservados.
"""



func _process(delta):
	if v_scroll_bar:
		v_scroll_bar.value += scroll_speed * delta

		if v_scroll_bar.value >= v_scroll_bar.max_value:
			# Fin del scroll, puedes cambiar de escena o mostrar un botón
			get_tree().change_scene_to_file("res://scenes/menu.tscn")
