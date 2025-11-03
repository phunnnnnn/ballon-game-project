extends Label

@onready var label_combo: Label = $"."
@onready var timer_combo_decay: Timer = %"timer-combo-decay"

func _ready() -> void:
	label_combo.text = "current combo : %d / %d" %[
		AutoVariable.combo,
		AutoVariable.combo_max
		]
	AutoVariable.connect("combo_value_changed",_on_combo_value_changed)

func _process(delta: float) -> void:
	if timer_combo_decay.time_left > 0:
		label_combo.text = "current combo : %d / %d\ntime until decay :%.2f" %[
			AutoVariable.combo,
			AutoVariable.combo_max,
			timer_combo_decay.time_left
			]
	else:
		label_combo.text = "current combo : %d / %d" %[
			AutoVariable.combo,
			AutoVariable.combo_max
		]

func _on_combo_value_changed(value):
	if timer_combo_decay.time_left > 0:
		label_combo.text = "current combo : %d / %d\ntime until decay :%.2f" %[
			AutoVariable.combo,
			AutoVariable.combo_max,
			AutoVariable.combo_decay_time - timer_combo_decay.time_left
			]
	else:
		label_combo.text = "current combo : %d / %d" %[
			AutoVariable.combo,
			AutoVariable.combo_max
		]
