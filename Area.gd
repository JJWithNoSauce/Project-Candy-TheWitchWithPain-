extends Area2D

export var To_room = "0"

func _on_Area_body_entered(body):
	print("entered")
	get_tree().change_scene("res://Scenes/Rooms/Room_" + To_room + ".tscn")
