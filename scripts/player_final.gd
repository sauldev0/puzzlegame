extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D2
@onready var foot_steeps = $FootSteeps

var speed := 70
var is_moving := true

func _ready():
	animated_sprite.play("up_walking")
	foot_steeps.play()

func _physics_process(delta):
	if is_moving:
		velocity = Vector2(0, -speed)
		move_and_slide()

		if !foot_steeps.playing:
			foot_steeps.play()

		if animated_sprite.animation != "up_walking":
			animated_sprite.play("up_walking")
	else:
		velocity = Vector2.ZERO
		move_and_slide()
		if foot_steeps.playing:
			foot_steeps.stop()
		animated_sprite.play("default")


func _on_meta_final_area_entered(area):
	is_moving = false
	animated_sprite.play("default")
