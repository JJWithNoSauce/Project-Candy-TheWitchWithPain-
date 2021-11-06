extends StaticBody2D

var health = 2

func _on_Breakable_body_entered(body):
	if body.is_in_group("Attack"):
		print("hit")
		health -= 1
		$Candy.frame = 1

func _process(delta):
	if health < 1:
		print("broken")
		CollisionShape2D.disabled = true
		$Candy.hide()
