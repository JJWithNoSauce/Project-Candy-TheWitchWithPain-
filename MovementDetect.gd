extends Node2D

# warning-ignore:unused_argument
func _process(delta):
	if Input.is_action_pressed("move_up"):
		$Up.frame = 1
	elif Input.is_action_just_released("move_up"):
		$Up.frame = 0
	
	if Input.is_action_pressed("move_down"):
		$Down.frame = 1
	elif Input.is_action_just_released("move_down"):
		$Down.frame = 0
		
	if Input.is_action_pressed("move_left"):
		$Left.frame = 1
	elif Input.is_action_just_released("move_left"):
		$Left.frame = 0
	
	if Input.is_action_pressed("move_right"):
		$Right.frame = 1
	elif Input.is_action_just_released("move_right"):
		$Right.frame = 0
