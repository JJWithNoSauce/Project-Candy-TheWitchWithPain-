extends Node2D

export var current_scene = 0
signal advance

func _ready():
	yield(get_tree().create_timer(0.25), "timeout")
	$Ani_fade.play("Fade_out")
	$Music/song1.play()
	$text2.hide()
	$text3.hide()
	$text4.hide()
	$text5.hide()
	yield(get_tree().create_timer(8), "timeout")
	$Music/song1.stop()

func _on_Skip_pressed():
	yield(get_tree().create_timer(0.5), "timeout")
	get_tree().change_scene("res://Scenes/Rooms/Room_0.tscn")
	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		current_scene += 1
		emit_signal("advance")
	elif Input.is_action_just_pressed("Left_click"):
		current_scene += 1
		emit_signal("advance")
		
		
func proceed():
	if current_scene == 1:
		$Storyframes.frame = 0
		$text1.hide()
		$text2.show()
	elif current_scene == 2:
		$Ani_fade.play("Fade_in")
		yield(get_tree().create_timer(0.5), "timeout")
		$Music/song2.play()
		$Storyframes.frame = 1
		$text2.hide()
		$text3.show()
		$Ani_fade.play("Fade_out")
		yield(get_tree().create_timer(8), "timeout")
		$Music/song2.stop()
	elif current_scene == 3:
		$Ani_fade.play("Fade_in")
		yield(get_tree().create_timer(0.5), "timeout")
		$Music/song3.play()
		$Storyframes.frame = 2
		$text3.hide()
		$text4.show()
		$Ani_fade.play("Fade_out")
		yield(get_tree().create_timer(8), "timeout")
		$Music/song3.stop()
	elif current_scene == 4:
		$Ani_fade.play("Fade_in")
		yield(get_tree().create_timer(0.5), "timeout")
		$Music/song4.play()
		$Storyframes.frame = 3
		$text4.hide()
		$text5.show()
		$Ani_fade.play("Fade_out")
		yield(get_tree().create_timer(6), "timeout")
		$Music/song4.stop()
	elif current_scene == 5:
		$Ani_fade.play("Fade_in")
		yield(get_tree().create_timer(2), "timeout")
		get_tree().change_scene("res://Scenes/Rooms/Room_0_cutscene.tscn")
	else:
		pass

func _on_Story_1_advance():
	proceed()
