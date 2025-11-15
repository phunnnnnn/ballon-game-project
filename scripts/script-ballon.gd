extends Area2D

@onready var sting = preload("res://scenes/sting.tscn")
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

var variant: String
var exploded: int = 0

func _ready() -> void:
	randomize()
	print(variant)
	input_pickable = true

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		explode()

func explode():
	# combo
	if AutoVariable.combo < AutoData.ComboPressure[AutoVariable.upgrade_levels["ComboPressure"]]["limit"]:
		AutoVariable.combo += 1

	# reward
	var _InflationRate = AutoData.InflationRate_value[AutoVariable.upgrade_levels["InflationRate"]]
	var _combo = AutoVariable.combo
	var _variant = AutoData.EliteBalloons.mult[variant]
	#fix variable
	if _combo < 0:
		_combo += 1
	var reward: float = _InflationRate * _combo * _variant
	print("ballon click + %s [%s(InflationRate) * %s(COMBO)] * %d(%s)" %[
		reward,
		_InflationRate,
		_combo,
		_variant,
		variant
		])
	
	AutoVariable.money += reward
	print("current money = ", AutoVariable.money)

	# explosion logic
	if exploded < AutoData.PhantomPop[AutoVariable.upgrade_levels["PhantomPop"]]["limit"] :
		if _should_explode():
			print("💥 Exploded!")
			_shoot_sting()
		else:
			print("🎈 Safe balloon")
			exploded += 1
	else:
		print("💥 Exploded!")
		_shoot_sting()
		call_deferred("queue_free")

func _should_explode() -> bool:
	return randf() < AutoData.PhantomPop[AutoVariable.upgrade_levels["PhantomPop"]]["chance"]

func _shoot_sting():
	var instance = sting.instantiate()
	instance.position = position

	var random_angle = randf() * TAU
	instance.direction = Vector2.RIGHT.rotated(random_angle)

	get_parent().call_deferred("add_child", instance)

func _on_area_entered(area: Area2D) -> void:
	# Check if the colliding area belongs to the "sting" group
	if area.is_in_group("sting"):
		if is_instance_valid(area):
			area.call_deferred("queue_free")  # remove the sting
		call_deferred("explode")  # trigger the explosion
