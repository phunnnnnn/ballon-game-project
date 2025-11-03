extends Node
signal ballon_cooldown_changed(new_cooldown)
signal ballon_base_value_changed(new_value)
signal combo_value_changed(new_value)

#player variable
var money: float = 0.0

#combo variable
var combo: int = 0
var combo_decay_time: float = 1.0
var max_combo: int = 10 

func set_combo_value(value: int) -> void:
	combo = value
	emit_signal("combo_value_changed", value)

#game variable
var ballon_spawn_cooldown: float = 2.0
var ballon_base_value: float = 1.0

func set_ballon_cooldown(value: float) -> void:
	ballon_spawn_cooldown = value
	emit_signal("ballon_cooldown_changed", value)

func set_ballon_base_value(value: float) -> void:
	ballon_base_value = value
	emit_signal("ballon_base_value_changed", value)
	
