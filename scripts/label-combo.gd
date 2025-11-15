extends Label

@onready var label_combo: Label = $"."
@onready var timer_combo_decay: Timer = %"timer-combo-decay"

func _ready() -> void:
	label_combo.text = "current combo : %d / %d" %[
		AutoVariable.combo,
		AutoData.ComboPressure[AutoVariable.upgrade_levels["ComboPressure"]]["limit"]
		]

func _process(delta: float) -> void:
	if timer_combo_decay.time_left > 0:
		label_combo.text = "current combo : %d / %d\ntime until decay :%.2f" %[
			AutoVariable.combo,
			AutoData.ComboPressure[AutoVariable.upgrade_levels["ComboPressure"]]["limit"],
			timer_combo_decay.time_left
			]
	else:
		label_combo.text = "current combo : %d / %d" %[
			AutoVariable.combo,
			AutoData.ComboPressure[AutoVariable.upgrade_levels["ComboPressure"]]["limit"]
		]
