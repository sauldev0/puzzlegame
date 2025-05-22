extends Sprite2D

var speed = 100

func _process(delta):
	
	position.x = position.x + speed * delta
	
