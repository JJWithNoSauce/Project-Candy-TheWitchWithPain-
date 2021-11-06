extends CanvasLayer

func jump_in():
	$AnimationPlayer.play("Scene_jump_in")
	
func jump_out():
	$AnimationPlayer.play("Scene_jump_out")

func fade_in():
	$AnimationPlayer.play("Scene_fade_in")

func fade_out():
	$AnimationPlayer.play("Scene_fade_out")

func idle():
	$AnimationPlayer.play("idle")

func _transition1():
	$AnimationPlayer.play("Scene_jump_in")
	yield(get_tree().create_timer(0.5), "timeout")
	
func _transition2():
	$AnimationPlayer.play("Scene_fade_in")
	yield(get_tree().create_timer(0.5), "timeout")
	$AnimationPlayer.play("Scene_fade_out")



func _on_RoomTP_next_room():
	_transition1()
