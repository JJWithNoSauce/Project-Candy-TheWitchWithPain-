extends Node2D

export var current_room = "0"
export var current_music = "0"

func _ready():
	$Ani_player.play("falling")
	_play_music()
	yield(get_tree().create_timer(8), "timeout")
	$Music/Wind.stop()
	yield(get_tree().create_timer(5.5), "timeout")
	get_tree().change_scene("res://Scenes/Rooms/Room_0.tscn")

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
	else:
		pass
