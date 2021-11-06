extends Node2D

func _ready():
	$Sounds/Music.set_deferred("playing", true)
	
func _process(delta):
	$Logo/Ani_logo.play("Idle")

func _on_Go_back_pressed():
	print("clicked")
	play_button()
	yield(get_tree().create_timer(0.5), "timeout")
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menu.tscn")

func play_button():
	$Sounds/Button_pressed.play()
	yield(get_tree().create_timer(0.5), "timeout")
	$Sounds/Button_pressed.stop()
