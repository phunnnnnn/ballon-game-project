extends Button

@onready var ballon_spawner: Area2D = $"../ballon-spawner"

func _on_pressed() -> void:
	if AutoVariable.ballon_spawn_cooldown > 0.3:
		AutoVariable.set_ballon_cooldown(AutoVariable.ballon_spawn_cooldown - 0.2)
		#print("upgrade")
		#ballon_spawner.Timer.wait_time = AutoVariable.ballon_spawn_cooldown
