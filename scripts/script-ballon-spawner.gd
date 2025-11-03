extends Area2D


@onready var timer: Timer = $Timer
@onready var ballon: PackedScene = preload("res://scenes/scene-ballon.tscn")

@export var spawn_interval: float = 2.0

func _ready() -> void:
	spawn_interval = AutoVariable.ballon_spawn_cooldown
	timer.wait_time = spawn_interval
	timer.start()
	
	#signal
	AutoVariable.connect("ballon_cooldown_changed", Callable(self, "_on_cooldown_changed"))

func spawn() -> void:
	if ballon:
		var instance = ballon.instantiate()
		instance.position = get_random_point_in_area()
		get_tree().current_scene.add_child(instance)

func get_random_point_in_area() -> Vector2:
	var shape = $CollisionShape2D.shape
	var shape_position = $CollisionShape2D.position
	if shape is RectangleShape2D:
		var extents = shape.extents
		var random_x = randf_range(-extents.x, extents.x)
		var random_y = randf_range(-extents.y, extents.y)
		#print(shape_position + global_position + Vector2(random_x, random_y))
		return shape_position + global_position + Vector2(random_x, random_y)
	
	elif shape is CircleShape2D:
		var r = shape.radius * sqrt(randf())
		var angle = randf() * TAU
		#print(shape_position + global_position + Vector2(cos(angle), sin(angle)) * r)
		return shape_position + global_position + Vector2(cos(angle), sin(angle)) * r
	
	return global_position

func _on_timer_timeout() -> void:
	spawn()

func _on_cooldown_changed(new_cooldown: float) -> void:
	$Timer.wait_time = new_cooldown
