extends StaticBody2D




func _on_At_det_area_entered(area):
	if area.is_in_group("Attack"):
		$Ani.play()
		yield(get_tree().create_timer(0.3), "timeout")
		$At_det/CollisionShape2D.set_deferred("disabled", true)
		$Block.set_deferred("disabled", true)
		$Ani.hide()
