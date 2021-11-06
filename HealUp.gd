extends Area2D

func _on_HealUp_area_entered(area):
	$Col.set_deferred("disabled", true)
	$Sprite.hide()
	
