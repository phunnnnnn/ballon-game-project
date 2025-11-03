extends Control

@onready var panel_upgrade_opener: Panel = $"panel-upgrade-opener"
@onready var upgrade_window: Panel = $"upgrade-window"

@onready var button_upgrade_less_time_spawn: Button = %"button-less-time-spawn"
@onready var button_upgrade_more_value: Button = %"button-value-mult"
@onready var button_upgrade_more_decay_time: Button = %"button-more-decay-time"
@onready var button_upgrade_more_combo_max: Button = %"button-more-combo-max"

func _ready() -> void:
	upgrade_window.hide()
	panel_upgrade_opener.show()
	
	#connect signal
	button_upgrade_less_time_spawn.pressed.connect(_on_button_upgrade_less_time_spawn_pressed)
	button_upgrade_more_value.pressed.connect(_on_button_upgrade_more_value_pressed)
	button_upgrade_more_decay_time.pressed.connect(_on_button_upgrade_more_decay_time_pressed)
	button_upgrade_more_combo_max.pressed.connect(_on_button_upgrade_more_combo_max_pressed)
	

func _on_panelupgradeopener_mouse_entered() -> void:
	panel_upgrade_opener.hide()
	upgrade_window.show()
	
	print("ui opened")

func _on_upgradewindow_mouse_exited() -> void:
	
	var mouse_pos: Vector2 = get_global_mouse_position()

	# Get the panel's global rectangle area
	var panel_rect: Rect2 = Rect2(upgrade_window.global_position,upgrade_window.size)
	if not panel_rect.has_point(mouse_pos):
		upgrade_window.hide()
		panel_upgrade_opener.show()
	
		print("ui close")

#upgrade pressed
func _on_button_upgrade_less_time_spawn_pressed():
	if AutoVariable.ballon_spawn_cooldown > 0.3:
		AutoVariable.set_ballon_cooldown(AutoVariable.ballon_spawn_cooldown - 0.2)
		print("Cooldown changed to: ", AutoVariable.ballon_spawn_cooldown)

func _on_button_upgrade_more_value_pressed():
	AutoVariable.set_ballon_base_value(AutoVariable.ballon_base_value + 0.1)
	print("ballon base value changed to: ", AutoVariable.ballon_base_value)

func _on_button_upgrade_more_decay_time_pressed():
	AutoVariable.set_combo_decay_time(AutoVariable.combo_decay_time + 0.1)
	print("decay time value changed to: ", AutoVariable.combo_decay_time)

func _on_button_upgrade_more_combo_max_pressed():
	AutoVariable.set_combo_max_value(AutoVariable.combo_max + 1)
	print("combo value changed to: ", AutoVariable.combo_max)
