extends Node2D

export var current_room = "0"
export var current_music = "0"

export var play_scene = "none"

func _ready():
	$Cutscene1.play(play_scene)
	_play_music()
	yield(get_tree().create_timer(28), "timeout")
	get_tree().change_scene("res://Scenes/Rooms/Room_outro.tscn")

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
