extends Node2D

export var current_room = "0"
export var current_music = "0"

# warning-ignore:unused_argument
func _process(delta):
	if Input.is_action_just_pressed("Escape"):
# warning-ignore:return_value_discarded
		yield(get_tree().create_timer(0.5), "timeout")
		$SceneTransition.fade_in()
		yield(get_tree().create_timer(0.5), "timeout")
		get_tree().change_scene("res://Menu.tscn")
	
	if Input.is_action_just_pressed("Reset"):
		yield(get_tree().create_timer(0.5), "timeout")
		$SceneTransition.fade_in()
		yield(get_tree().create_timer(0.5), "timeout")
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Scenes/Rooms/Room_" + current_room + ".tscn")
		

func _ready():
	$SceneTransition.idle()
	yield(get_tree().create_timer(0.5), "timeout")
	_play_music()
	$SceneTransition.fade_out()
	
func _on_Player_player_dead():
	yield(get_tree().create_timer(0.5), "timeout")
	$SceneTransition.fade_in()
	yield(get_tree().create_timer(0.5), "timeout")
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Rooms/Room_" + current_room + ".tscn")

func _play_music():
	if current_music == "0":
		pass
	elif current_music == "1":
		$Music/Wind.play()
	elif current_music == "2":
		$Music/Music_1.play()
	elif current_music == "3":
		$Music/Music_2.play()
	elif current_music == "4":
		$Music/Music_3.play()
	elif current_music == "5":
		$Music/Music_5.play()
	else:
		pass

func _on_Ui_fadeout():
	$Fade_out.play("Fade_out")
