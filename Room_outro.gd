extends Node2D

export var current_scene = 0
signal advance

func _ready():
	$Aniplayer.play("Fade_out")
	$Audio10.play()

	yield(get_tree().create_timer(7), "timeout")
	current_scene += 1
	proceed()
	
	yield(get_tree().create_timer(7), "timeout")
	current_scene += 1
	proceed()
	
	yield(get_tree().create_timer(7), "timeout")
	current_scene += 1
	proceed()
	
	yield(get_tree().create_timer(7), "timeout")
	current_scene += 1
	proceed()
	
	yield(get_tree().create_timer(7), "timeout")
	current_scene += 1
	proceed()
	
	yield(get_tree().create_timer(5), "timeout")
	current_scene += 1
	proceed()
	
	yield(get_tree().create_timer(5), "timeout")
	current_scene += 1
	proceed()
	
		
func proceed():
	if current_scene == 1:
		$Aniplayer.play("story2")
	elif current_scene == 2:
		$Aniplayer.play("story_3")
	elif current_scene == 3:
		$Aniplayer.play("Story4")
	elif current_scene == 4:
		$Aniplayer.play("Story5")
	elif current_scene == 5:
		$Aniplayer.play("Story6")
	elif current_scene == 6:
		$Aniplayer.play("Story7")
	elif current_scene == 7:
		$Aniplayer.play("Fade_in")
		yield(get_tree().create_timer(2), "timeout")
		get_tree().change_scene("res://Scenes/Rooms/Room_end4.tscn")
	else:
		pass

