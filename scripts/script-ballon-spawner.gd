extends Area2D

@onready var ballon_spawner: Area2D = $"."
@onready var spawner_timer: Timer = $timer_spawn
@onready var timer_explode: Timer = $timer_explode

@onready var ballon: PackedScene = preload("res://scenes/scene-ballon.tscn")

@export var spawn_interval: float = 2.0

func _ready() -> void:
	
	#setup
	spawn_interval = AutoData.AirRush_value[AutoVariable.upgrade_levels["AirRush"]]
	spawner_timer.wait_time = spawn_interval
	spawner_timer.start()
	
	#connect signal
	AutoVariable.connect("upgrade", Callable(self, "_on_upgrade_triggered"))

func spawn() -> void:
	if ballon:
		
		var instance = ballon.instantiate()
		instance.variant = get_random_ballon_variant(AutoVariable.upgrade_levels["EliteBalloons"])
		instance.position = get_random_point_in_area()
		
		ballon_spawner.add_child(instance)

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

func _on_timer_explode_timeout() -> void:
	
	var all_ballons = []  # store all balloons
	
	for _ballon in ballon_spawner.get_children():
		if _ballon.is_in_group("ballon"):
			all_ballons.append(_ballon)
	
	if all_ballons.size() > 0:
		var random_ballon = all_ballons.pick_random()
		print("Exploding:", random_ballon.name)
		random_ballon.explode()  # call any function you want on the balloon

func _on_upgrade_triggered(upgrade_type: String) -> void:
	#handle logic for each upgrade
	match upgrade_type:
		"InflationRate":
			pass
		"AirRush":
			spawn_interval = AutoData.AirRush_value[AutoVariable.upgrade_levels["AirRush"]]
			spawner_timer.wait_time = spawn_interval
			spawner_timer.start()
		"SkyOverload":
			pass
		"ComboPressure":
			pass
		"EliteBalloons":
			pass
		"ChainReaction":
			pass
		"PhantomPop":
			pass
		"AutoDetonate":
			pass
		_:
			pass

func get_random_ballon_variant(level: int) -> String:

	var chances = AutoData.EliteBalloons["chance"].get(level, AutoData.EliteBalloons["chance"][1])

	var rand = randf()
	var cumulative = 0.0

	for variant in chances.keys():
		cumulative += chances[variant]
		if rand <= cumulative:
			return variant
	#print("wtf")
	return "regular"  # fallback
