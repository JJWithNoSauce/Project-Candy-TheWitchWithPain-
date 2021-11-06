extends Node2D

func _process(delta):
	if Input.is_action_pressed("Escape"):
		$Esc.frame = 1
	elif Input.is_action_just_released("Escape"):
		$Esc.frame = 0
