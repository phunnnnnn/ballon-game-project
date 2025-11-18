extends Control

@onready var panel_upgrade_opener: Panel = $"panel-upgrade-opener"
@onready var upgrade_window: Panel = $"upgrade-window"

@onready var ui: Control = $"."
@onready var label_combo: Label = $"Label-combo"
@onready var backgroud: ColorRect = $backgroud

@onready var bg_rect = $backgroud
@onready var star_particles = $GPUParticles2D


# Buttons
@onready var buttonUpgrade_InflationRate : Button = %"button-upgrade-InflationRate"
@onready var buttonUpgrade_AirRush       : Button = %"button-upgrade-AirRush"
@onready var buttonUpgrade_SkyOverload   : Button = %"button-upgrade-SkyOverload"
@onready var buttonUpgrade_ComboPressure : Button = %"button-upgrade-ComboPressure"
@onready var buttonUpgrade_EliteBalloons : Button = %"button-upgrade-EliteBalloons"
@onready var buttonUpgrade_ChainReaction : Button = %"button-upgrade-ChainReaction"
@onready var buttonUpgrade_PhantomPop    : Button = %"button-upgrade-PhantomPop"
@onready var buttonUpgrade_AutoDetonate  : Button = %"button-upgrade-AutoDetonate"

func _ready() -> void:
	# Setup
	upgrade_window.hide()
	panel_upgrade_opener.show()
	
	ui.visible = true
	label_combo.visible = true
	upgrade_window.visible = true
	
	
	# Connect signals
	buttonUpgrade_InflationRate.pressed.connect(upgrade_InflationRate)
	buttonUpgrade_AirRush.pressed.connect(upgrade_AirRush)
	buttonUpgrade_SkyOverload.pressed.connect(upgrade_SkyOverload)
	buttonUpgrade_ComboPressure.pressed.connect(upgrade_ComboPressure)
	buttonUpgrade_EliteBalloons.pressed.connect(upgrade_EliteBalloons)
	buttonUpgrade_ChainReaction.pressed.connect(upgrade_ChainReaction)
	buttonUpgrade_PhantomPop.pressed.connect(upgrade_PhantomPop)
	buttonUpgrade_AutoDetonate.pressed.connect(upgrade_AutoDetonate)
	set_upgrade_button(buttonUpgrade_InflationRate, "InflationRate")
	set_upgrade_button(buttonUpgrade_AirRush, "AirRush")
	set_upgrade_button(buttonUpgrade_SkyOverload, "SkyOverload")
	set_upgrade_button(buttonUpgrade_ComboPressure, "ComboPressure")
	set_upgrade_button(buttonUpgrade_EliteBalloons, "EliteBalloons")
	set_upgrade_button(buttonUpgrade_ChainReaction, "ChainReaction")
	set_upgrade_button(buttonUpgrade_PhantomPop, "PhantomPop")
	set_upgrade_button(buttonUpgrade_AutoDetonate, "AutoDetonate")


# --- Panel Behavior ---

func _on_panelupgradeopener_mouse_entered() -> void:
	panel_upgrade_opener.hide()
	upgrade_window.show()
	#print("UI opened")

func _on_upgradewindow_mouse_exited() -> void:
	var mouse_pos: Vector2 = get_global_mouse_position()
	var panel_rect: Rect2 = Rect2(upgrade_window.global_position, upgrade_window.size)
	if not panel_rect.has_point(mouse_pos):
		upgrade_window.hide()
		panel_upgrade_opener.show()
		#print("UI closed")


# --- Upgrade Functions ---

func upgrade_InflationRate() -> void:
	AutoVariable.emit_signal("upgrade","InflationRate")
	set_upgrade_button(buttonUpgrade_InflationRate, "InflationRate")
	
	
	#print("Upgrade: Inflation Rate")

func upgrade_AirRush() -> void:
	AutoVariable.emit_signal("upgrade","AirRush")
	set_upgrade_button(buttonUpgrade_AirRush, "AirRush")
	
	#print("Upgrade: Air Rush")

func upgrade_SkyOverload() -> void:
	AutoVariable.emit_signal("upgrade","SkyOverload")
	set_upgrade_button(buttonUpgrade_SkyOverload, "SkyOverload")
	
	#print("Upgrade: Sky Overload")

func upgrade_ComboPressure() -> void:
	AutoVariable.emit_signal("upgrade","ComboPressure")
	set_upgrade_button(buttonUpgrade_ComboPressure, "ComboPressure")
	
	#print("Upgrade: Combo Pressure")

func upgrade_EliteBalloons() -> void:
	AutoVariable.emit_signal("upgrade","EliteBalloons")
	set_upgrade_button(buttonUpgrade_EliteBalloons, "EliteBalloons")
	
	#print("Upgrade: Elite Balloons")

func upgrade_ChainReaction() -> void:
	AutoVariable.emit_signal("upgrade","ChainReaction")
	set_upgrade_button(buttonUpgrade_ChainReaction, "ChainReaction")
	
	#print("Upgrade: Chain Reaction")

func upgrade_PhantomPop() -> void:
	AutoVariable.emit_signal("upgrade","PhantomPop")
	set_upgrade_button(buttonUpgrade_PhantomPop, "PhantomPop")
	
	#print("Upgrade: Phantom Pop")

func upgrade_AutoDetonate() -> void:
	AutoVariable.emit_signal("upgrade","AutoDetonate")
	set_upgrade_button(buttonUpgrade_AutoDetonate, "AutoDetonate")
	#print("Upgrade: Auto Detonate")

func _get_value_text(data):
	if data == null:
		return "MAX"

	# EliteBalloons: chance dictionary
	if "chance" in data and typeof(data.chance) == TYPE_DICTIONARY:
		var parts = []
		for k in data.chance.keys():
			parts.append("%s: %.2f" % [k, data.chance[k]])
		return "\n" + "\n".join(parts)

	# Simple numeric fields
	if "value" in data:
		return str(data.value)
	if "interval" in data:
		return str(data.interval)
	if "limit" in data:
		return str(data.limit)
	if "chance" in data:
		return "%.2f" % data.chance

	return "???"


func set_upgrade_button(button: Button, upgrade_name: String):
	var level = AutoVariable.upgrade_levels[upgrade_name]
	var data_table = AutoData[upgrade_name]

	var current_data = data_table[level]
	var next_data = data_table.get(level + 1, null)

	var price = next_data.price if next_data else 0

	var current_value_text = _get_value_text(current_data)
	var next_value_text = _get_value_text(next_data)

	if next_data:
		button.text = (
			"Level : %d\n%s\n ==> %s\nCost: %d Gold"
		) % [
			level,
			current_value_text,
			next_value_text,
			price
		]
	else:
		button.text = (
			"Level : %d\n%s\nMAX LEVEL"
		) % [
			level,
			current_value_text
		]
