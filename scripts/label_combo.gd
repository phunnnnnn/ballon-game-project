extends Label

@onready var label_combo: Label = $"."

func _ready() -> void:
	label_combo.text = "current combo : 0"
	AutoVariable.connect("combo_value_changed",_on_combo_value_changed)

func _on_combo_value_changed(value):
	label_combo.text = "current combo : %s" %[value]
