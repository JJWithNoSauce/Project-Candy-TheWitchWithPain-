extends Control

func _ready():
	$Sounds/Music.play()
	

func _on_New_game_pressed():
	print("clicked")
	play_button()
	yield(get_tree().create_timer(0.5), "timeout")
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Rooms/Room_intro.tscn")

func _on_Levels_pressed():
	print("clicked")
	play_button()
	yield(get_tree().create_timer(0.5), "timeout")
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://level_select.tscn")

func _on_Controls_pressed():
	print("clicked")
	play_button()
	yield(get_tree().create_timer(0.5), "timeout")
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Rooms/Room_tutorials.tscn")

func play_button():
	$Sounds/Button_pressed.play()
	yield(get_tree().create_timer(0.5), "timeout")
	$Sounds/Button_pressed.stop()
	
func _on_Credits_pressed():
	print("clicked")
	play_button()
	yield(get_tree().create_timer(0.5), "timeout")
	get_tree().change_scene("res://Scenes/Rooms/Room_Credit.tscn")
	
