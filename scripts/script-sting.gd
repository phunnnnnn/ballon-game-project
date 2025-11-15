extends Area2D

const SPEED : int = 200
var direction : Vector2 = Vector2.RIGHT

func _process(delta: float) -> void:
	position += SPEED * delta * direction
