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
 
Diseño de Juego (Game Design): Saúl Pérez/José Casu    
Programación Principal: Saúl Pérez/José Casu    
Diseño de Mecánicas: Saúl Pérez/José Casu    
Desarrollo de IA / Sistemas: Saúl Pérez/José Casu    
Implementación de UI/UX: Saúl Pérez/José Casu    

[color=#4c60aa][b]Arte y Diseño Visual[/b][/color] 

Dirección de Arte: Saúl Pérez/José Casu    
Diseño de Personajes: Saúl Pérez/José Casu    
Diseño de Entornos / Escenarios: Saúl Pérez/José Casu    
Animaciones 2D: Saúl Pérez/José Casu    
Diseño de Interfaces: Saúl Pérez/José Casu    

[color=#4c60aa][b]Narrativa y Guion[/b][/color]  

Historia y Concepto Narrativo: Saúl Pérez/José Casu    
Guion Original: Saúl Pérez/José Casu     
Diálogos y Texto In-Game: Saúl Pérez/José Casu  
Diseño Narrativo: Saúl Pérez/José Casu  

[color=#4c60aa][b]Música y Sonido[/b][/color]  

Diseño de Sonido (SFX): Saúl Pérez/José Casu  
Implementación de Audio: Saúl Pérez/José Casu 

[color=#4c60aa][b]Pruebas y QA[/b][/color]  

Testing Interno: Saúl Pérez/José Casu  
Control de Calidad (QA): Saúl Pérez/José Casu  

[color=#4c60aa][b]Marketing y Publicidad[/b][/color]  

Diseño de Material Promocional: Saúl Pérez/José Casu  
Community Manager: Saúl Pérez/José Casu  
Relaciones Públicas: Saúl Pérez/José Casu  

[color=#4c60aa][b]Herramientas y Tecnologías[/b][/color]  

Motor del Juego: Godot Engine  
Lenguaje de Programación: GDScript  
Software de Arte: LibreSprite  
Software de Audio: Audacity  

[color=#4c60aa][b]Agradecimientos Especiales[/b][/color]  

A todas las personas que probaron el juego y dieron su opinión. 
A familiares y amigos por su paciencia y apoyo incondicional.  
A nuestro tutor Franklin España, por su apoyo moral.
A los ingenieros Maikol Ortiz, Rafael Barrios y la especialista Avelina Rubio por su valioso tiempo y aportes.
A los estudiantes de informática, por su colaboración y amabilidad en la investigación.
A la UNELLEZ y sus profesores, por brindarnos las bases necesarias para formarnos como profesionales.
Y a todos nuestros amigos y seres queridos, por su constante apoyo moral.


[color=#4c60aa][b]Licencias y Recursos[/b][/color] 
 
Algunos sonidos, imágenes o fuentes pueden haber sido tomados de bibliotecas libres como:  
- Freesound.org  
- OpenGameArt.org  
- Kenney.nl  

[color=#5fc9e7][b]Logikazo[/b][/color] 
© 2025 Todos los derechos reservados.
"""



func _process(delta):
	if v_scroll_bar:
		v_scroll_bar.value += scroll_speed * delta

		if v_scroll_bar.value >= v_scroll_bar.max_value:
			# Fin del scroll, puedes cambiar de escena o mostrar un botón
			get_tree().change_scene_to_file("res://scenes/menu.tscn")
