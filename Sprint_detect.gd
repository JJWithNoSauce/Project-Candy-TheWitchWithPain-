extends Node2D

func _process(delta):
	if Input.is_action_pressed("move_sprint"):
		$Shift.frame = 1
	elif Input.is_action_just_released("move_sprint"):
		$Shift.frame = 0
