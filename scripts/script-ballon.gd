extends Area2D

func _ready() -> void:
	# Allow input detection
	input_pickable = true

func _on_mouse_entered() -> void:
	#print("mouse entered")
	pass

func _on_mouse_exited() -> void:
	#print("mouse exited")
	pass

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		var reward : float = AutoVariable.ballon_base_value
		print("ballon click + %s [%s(value) * (mult)]"
		%[
			reward,
			AutoVariable.ballon_base_value,
			#AutoVariable.ballon_value_multiplier
		])
		
		AutoVariable.money += reward
		if AutoVariable.combo < AutoVariable.combo_max:
			AutoVariable.set_combo_value(AutoVariable.combo + 1)
		else:
			AutoVariable.set_combo_value(AutoVariable.combo)
		
		print("current money = ", AutoVariable.money)
		
		queue_free()
	pass # Replace with function body.
