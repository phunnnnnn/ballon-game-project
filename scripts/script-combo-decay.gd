extends Timer

@onready var timer_combo_decay: Timer = %"timer-combo-decay"

func _ready() -> void:
	AutoVariable.connect("combo_value_changed",_on_combo_value_changed)
	pass # Replace with function body.

func _on_combo_value_changed(value):
	#print("combo start decay")
	timer_combo_decay.wait_time = AutoVariable.combo_decay_time
	if AutoVariable.combo > 0:
		timer_combo_decay.start()
	

func _on_timeout() -> void:
	AutoVariable.set_combo_value(0)
