extends Control

func _ready():
	$Casual_af.hide()
	$Classic_af.hide()

func _on_Casual_det_body_entered(body):
	print("hide")
	$Text1.hide()
	$Text2.hide()
	$Text3.hide()
	$Text4.hide()
	$Casual_af.show()
	
	

func _on_Classic_det_body_entered(body):
	print("hide")
	$Text5.hide()
	$Text6.hide()
	$Text7.hide()
	$Text8.hide()
	$Classic_af.show()
