extends CharacterBody2D

const SPEED := 250  # Velocidad de movimiento
var direction := Vector2.ZERO
var is_moving := false
var touch_start := Vector2.ZERO
var touch_end := Vector2.ZERO
var swipe_threshold := 200  # Distancia mínima para considerar un swipe
@onready var animated_sprite = $AnimatedSprite2D2


func _unhandled_input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			touch_start = event.position
		else:
			touch_end = event.position
			handle_swipe()

func handle_swipe():
	if is_moving:
		return  # Ya está en movimiento, no hacer nada

	var delta := touch_end - touch_start
	if delta.length() < swipe_threshold:
		return  # No fue un swipe significativo

	if abs(delta.x) > abs(delta.y):
		if delta.x > 0:
			start_slide(Vector2.RIGHT)
		else:
			start_slide(Vector2.LEFT)
	else:
		if delta.y > 0:
			start_slide(Vector2.DOWN)
		else:
			start_slide(Vector2.UP)

func _physics_process(delta):
	
	if not is_moving:
		if Input.is_action_pressed("ui_up"):
			
			start_slide(Vector2.UP)
		elif Input.is_action_pressed("ui_down"):
			start_slide(Vector2.DOWN)
		elif Input.is_action_pressed("ui_left"):
			start_slide(Vector2.LEFT)
		elif Input.is_action_pressed("ui_right"):
			start_slide(Vector2.RIGHT)

	if is_moving:
		var collision = move_and_collide(direction * SPEED * delta)
		if collision:
			stop_slide()

		# Mover también el sprite visualmente
		$AnimatedSprite2D2.global_position = global_position

func start_slide(dir: Vector2):
	var sensor = null
	
	match dir:
		Vector2.UP:
			sensor = $up
		Vector2.DOWN:
			sensor = $down
		Vector2.LEFT:
			sensor = $left
		Vector2.RIGHT:
			sensor = $right

	if sensor and sensor.is_colliding():
		return  # No iniciar si hay colisión inmediata
	
	direction = dir
	is_moving = true
	update_animation(direction)
	
func stop_slide():
	$"../SnowImpact".play()
	is_moving = false
	velocity = Vector2.ZERO

	# Alinear al centro del tile más cercano
	var tile_center = (global_position / 64.0).floor() * 64.0 + Vector2(32, 32)
	global_position = tile_center
	$AnimatedSprite2D2.global_position = tile_center
	paused_animation(direction)

func update_animation(direction : Vector2):
	if abs(direction.x) > abs(direction.y): # abs devuelve el valor absoluto
		if direction.x > 0:
			animated_sprite.play("right_walking")
		else:
			animated_sprite.play("left_walking")
	else:
		if direction.y > 0:
			animated_sprite.play("down_walking")
		else:
			animated_sprite.play("up_walking")
			
 
func paused_animation(direction : Vector2):
	if abs(direction.x) > abs(direction.y): # abs devuelve el valor absoluto
		if direction.x > 0:
			animated_sprite.play("right_paused")
		else:
			animated_sprite.play("left_paused")
	else:
		if direction.y > 0:
			animated_sprite.play("default")
		else:
			animated_sprite.play("up_paused")
