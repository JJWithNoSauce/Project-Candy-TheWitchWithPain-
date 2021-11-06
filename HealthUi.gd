extends Control

var damage = 1
var powerup = 1
var poison = 0

func _ready():
	$Health/Cursed.hide()
	$Health/Heal.hide()
	$Health/Harmed.hide()
	$RichTextLabel.hide()
	$Mana/ManaWarn.hide()
	$Mana/ManaGain.hide()
	

func _on_Player_ui_update_harmed():
	$Health/HealthBar.value -= damage
	$Mana/AttackBar.value += powerup
	$Health/Harmed.show()
	$Mana/ManaGain.show()
	yield(get_tree().create_timer(0.1), "timeout")
	$Health/Harmed.hide()
	$Mana/ManaGain.hide()
	
	
	
func _on_Player_ui_update_attacked():
	$Mana/AttackBar.value -= powerup
	


func _on_Player_ui_update_heal():
	$Health/HealthBar.value += powerup
	$Health/Heal.show()
	yield(get_tree().create_timer(0.1), "timeout")
	$Health/Heal.hide()
	
func _on_Player_ui_update_poison():
	$Health/Cursed.show()
	$RichTextLabel.show()
	poison += 1
	$RichTextLabel.text = ("Cursed!")

func _on_Player_ui_alert_nomana():
	$Mana/ManaWarn.show()
	yield(get_tree().create_timer(0.1), "timeout")
	$Mana/ManaWarn.hide()
	yield(get_tree().create_timer(0.1), "timeout")
	$Mana/ManaWarn.show()
	yield(get_tree().create_timer(0.1), "timeout")
	$Mana/ManaWarn.hide()
		

func _on_Player_player_dead():
	pass # Replace with function body.
