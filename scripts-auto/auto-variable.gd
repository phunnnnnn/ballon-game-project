extends Node

signal upgrade(upgrade_type: String)

# --- Player variables ---
var money: float = 9999999999999999.0
var combo: int = 0

# --- Upgrade levels ---
var upgrade_levels := {
	"InflationRate": 0,
	"AirRush": 0,
	"SkyOverload": 0,
	"ComboPressure": 0,
	"EliteBalloons": 0,
	"ChainReaction": 0,
	"PhantomPop": 0,
	"AutoDetonate": 0,
}

func _ready() -> void:
	connect("upgrade", Callable(self, "_on_upgrade_triggered"))

# --- Handle upgrade signal ---
func _on_upgrade_triggered(upgrade_type: String) -> void:
	if not upgrade_levels.has(upgrade_type):
		push_warning("Unknown upgrade type: %s" % upgrade_type)
		return

	var current_level = upgrade_levels[upgrade_type]

	# Check max level
	var max_level = AutoData[upgrade_type].size() - 1

	if current_level >= max_level:
		print("%s is already max level!" % upgrade_type)
		return

	# Find price for *next level*
	var price = AutoData[upgrade_type].get(current_level, null).price
	if price == null:
		push_warning("Missing price for %s at level %d" % [upgrade_type, current_level])
		return

	# Check player money
	if money < price:
		print("Not enough money for upgrade %s. Need %d, have %d" % [upgrade_type, price, money])
		return

	# Deduct money
	money -= price

	# Apply upgrade
	upgrade_levels[upgrade_type] += 1
	var new_level = upgrade_levels[upgrade_type]

	print("Bought upgrade %s → Level %d (Cost: %d)" % [upgrade_type, new_level, price])

	# Perform upgrade-specific logic
	match upgrade_type:
		"InflationRate":
			_increase_inflation_rate()
		"AirRush":
			_increase_air_rush()
		"SkyOverload":
			_increase_sky_overload()
		"ComboPressure":
			_increase_combo_pressure()
		"EliteBalloons":
			_increase_elite_balloons()
		"ChainReaction":
			_increase_chain_reaction()
		"PhantomPop":
			_increase_phantom_pop()
		"AutoDetonate":
			_increase_auto_detonate()
		_:
			pass



# --- Individual upgrade logic (can be customized later) ---

func _increase_inflation_rate():
	#print("Inflation Rate upgraded!")
	pass

func _increase_air_rush():
	#print("Air Rush upgraded!")
	pass

func _increase_sky_overload():
	#print("Sky Overload upgraded!")
	pass

func _increase_combo_pressure():
	#print("Combo Pressure upgraded!")
	pass

func _increase_elite_balloons():
	#print("Elite Balloons upgraded!")
	pass

func _increase_chain_reaction():
	#print("Chain Reaction upgraded!")
	pass

func _increase_phantom_pop():
	#print("Phantom Pop upgraded!")
	pass

func _increase_auto_detonate():
	#print("Auto Detonate upgraded!")
	pass
