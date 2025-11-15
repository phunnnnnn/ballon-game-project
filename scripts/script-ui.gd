extends Control

@onready var panel_upgrade_opener: Panel = $"panel-upgrade-opener"
@onready var upgrade_window: Panel = $"upgrade-window"

@onready var ui: Control = $"."

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

	# Connect signals
	buttonUpgrade_InflationRate.pressed.connect(upgrade_InflationRate)
	buttonUpgrade_AirRush.pressed.connect(upgrade_AirRush)
	buttonUpgrade_SkyOverload.pressed.connect(upgrade_SkyOverload)
	buttonUpgrade_ComboPressure.pressed.connect(upgrade_ComboPressure)
	buttonUpgrade_EliteBalloons.pressed.connect(upgrade_EliteBalloons)
	buttonUpgrade_ChainReaction.pressed.connect(upgrade_ChainReaction)
	buttonUpgrade_PhantomPop.pressed.connect(upgrade_PhantomPop)
	buttonUpgrade_AutoDetonate.pressed.connect(upgrade_AutoDetonate)


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
	#print("Upgrade: Inflation Rate")

func upgrade_AirRush() -> void:
	AutoVariable.emit_signal("upgrade","AirRush")
	#print("Upgrade: Air Rush")

func upgrade_SkyOverload() -> void:
	AutoVariable.emit_signal("upgrade","SkyOverload")
	#print("Upgrade: Sky Overload")

func upgrade_ComboPressure() -> void:
	AutoVariable.emit_signal("upgrade","ComboPressure")
	#print("Upgrade: Combo Pressure")

func upgrade_EliteBalloons() -> void:
	AutoVariable.emit_signal("upgrade","EliteBalloons")
	#print("Upgrade: Elite Balloons")

func upgrade_ChainReaction() -> void:
	AutoVariable.emit_signal("upgrade","ChainReaction")
	#print("Upgrade: Chain Reaction")

func upgrade_PhantomPop() -> void:
	AutoVariable.emit_signal("upgrade","PhantomPop")
	#print("Upgrade: Phantom Pop")

func upgrade_AutoDetonate() -> void:
	AutoVariable.emit_signal("upgrade","AutoDetonate")
	#print("Upgrade: Auto Detonate")
