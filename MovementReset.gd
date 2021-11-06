extends Node2D

func _process(delta):
	if Input.is_action_pressed("Reset"):
		$R.frame = 1
	elif Input.is_action_just_released("Reset"):
		$R.frame = 0
