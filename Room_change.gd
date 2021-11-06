extends Node2D

export var To_room = 0

func _on_Area_area_entered(area):
	if area.is_in_group("Player"):
		if To_room == 1:
			get_tree().change_scene("res://Scenes/Rooms/Room_1.tscn")
			print("changed")
		elif To_room == 2:
			get_tree().change_scene("res://Scenes/Rooms/Room_2.tscn")
			print("changed")
		else:
			pass
