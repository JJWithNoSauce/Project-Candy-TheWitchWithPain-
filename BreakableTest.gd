extends StaticBody2D

var health = 2


func _on_AtDetect_area_entered(area):
	print("hit")
	health -= 1
	$Candy.frame = 1
	
	if health < 1:
		print("broken")
		$AtDetect/ColRect.set_deferred("disabled", true)
		$Blocks.set_deferred("disabled", true)
		$Candy.hide()
