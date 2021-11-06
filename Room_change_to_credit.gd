extends Area2D

func _on_Area_body_entered(body):
	print("entered")
	yield(get_tree().create_timer(0.15), "timeout")
	get_tree().change_scene("res://Scenes/Rooms/Room_endcutscene1.tscn")
	

