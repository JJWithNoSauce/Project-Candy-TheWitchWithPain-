extends KinematicBody2D

export var speed = 120
var default_speed = speed
export var sprint = 200

export var max_health = 6
export var max_power = 6
export var health = 6
export var power = 0

export var dis_sprint = false

var attack = false
var movement = false
var harm = false
var fainted = false
var damaging = false
var pause = false

signal ui_update_harmed
signal ui_update_attacked
signal ui_update_heal
signal ui_update_poison
signal ui_alert_nomana

signal player_dead
#signa ui_update_healed

func _ready():
	health = max_health


func _physics_process(delta):
	#movement
	var direction = Vector2.ZERO
	
	$Ani_move.play()
	movement = false
	
	#Gameover check
	if fainted == true:
		pass
	elif health < 1:
		fainted = true
		play_sfx_fainted()
		_die()
		
	
	if Input.is_action_pressed("move_up"):
		if fainted == true:
			pass
		elif pause == true:
			pass
		else:
			direction.y -= 1
			movement = true
	
	if Input.is_action_pressed("move_down"):
		if fainted == true:
			pass
		elif pause == true:
			pass
		else:
			direction.y += 1
			movement = true
	
	if Input.is_action_pressed("move_left"):
		if fainted == true:
			pass
		elif pause == true:
			pass
		else:
			direction.x -= 1
			movement = true
	
	if Input.is_action_pressed("move_right"):
		if fainted == true:
			pass
		elif pause == true:
			pass
		else:
			direction.x += 1
			movement = true
		
	#sprint scripts
	if Input.is_action_just_pressed("move_sprint"):
		if dis_sprint == true:
			pass
		else:
			speed = sprint
			$Ani_move.speed_scale = 1.5
	if Input.is_action_just_released("move_sprint"):
		if dis_sprint == true:
			pass
		else:
			speed = default_speed
			$Ani_move.speed_scale = 1
	
	#Attack Scripts
	if Input.is_action_just_pressed("move_attack"):
		if movement == true:
			if power > 0:
				pause = true
				attack = true
				print("attacked")
				power -= 1
				print(power)
				
				while true:
					attack()
					play_sfx_attack()
					yield(get_tree().create_timer(0.20), "timeout")
					pause = true
					break
				pause = false
			elif power == 0:
				emit_signal("ui_alert_nomana")
				play_sfx_not_allowed()
		elif fainted == true:
			pass
		elif power > 0:
			attack = true
			print("attacked")
			direction = Vector2.ZERO
			power -= 1
			print(power)
			attack()
			play_sfx_attack()
		elif power == 0:
			emit_signal("ui_alert_nomana")
			play_sfx_not_allowed()

	if direction.length() > 0:
		direction = direction.normalized()
		
	if direction.x < 0:
		$Ani_move.flip_h = true
	elif direction.x > 0:
		$Ani_move.flip_h = false

#Animation Set
	if fainted == true:
		$Ani_move.animation = "fainted"
	elif movement == true:
		if harm == true:
			$Ani_move.animation = "harm"
		elif direction.y < 0:
			$Ani_move.animation = "run_up"
		elif direction.y > 0:
			$Ani_move.animation = "run_down"
		elif direction.x != 0:
			$Ani_move.animation = "run"
	elif attack == true:
		$Ani_move.animation = "attack"
	elif harm == true:
		$Ani_move.animation = "harm"
	elif movement == false:
		$Ani_move.animation = "idle"
	
	move_and_slide(direction * speed)
	
func harm(damage, powerup):
	harm = true
	health -= damage
	if power == max_power:
		pass
	else:
		power += powerup
	play_sfx_harm()
	ui_update_harmed()
	yield(get_tree().create_timer(0.25), "timeout")
	harm = false
	
func attack():
		while attack == true:
			movement = true
			if $Ani_move.flip_h == true:
				$Attack/At_L.disabled = false
				ui_update_attacked()
				yield(get_tree().create_timer(0.25), "timeout")
				$Attack/At_L.disabled = true
				movement = false
				attack = false
			elif $Ani_move.flip_h == false:
				$Attack/At_R.disabled = false
				ui_update_attacked()
				yield(get_tree().create_timer(0.25), "timeout")
				$Attack/At_R.disabled = true
				movement = false
				attack = false
	
func heal_up():
	if health == max_health:
		play_sfx_heal()
	else:
		health += 1
		ui_update_heal()
		play_sfx_heal()

func _die():
	emit_signal("player_dead")
	
func ui_update_harmed():
	emit_signal("ui_update_harmed")
	
func ui_update_attacked():
	emit_signal("ui_update_attacked")
	
func ui_update_heal():
	emit_signal("ui_update_heal")
	
func ui_update_poison():
	emit_signal("ui_update_poison")
	

func play_sfx_heal():
	$Sfx/heal.play()
	yield(get_tree().create_timer(0.25), "timeout")
	$Sfx/heal.stop()
	
func play_sfx_attack():
	$Sfx/attack.play()
	yield(get_tree().create_timer(0.5), "timeout")
	$Sfx/attack.stop()

func play_sfx_not_allowed():
	$Sfx/not_allowed.play()
	yield(get_tree().create_timer(0.25), "timeout")
	$Sfx/not_allowed.stop()
	
func play_sfx_harm():
	$Sfx/harm.play()
	yield(get_tree().create_timer(0.25), "timeout")
	$Sfx/harm.stop()
	
func play_sfx_fainted():
	$Sfx/dead.play()
	yield(get_tree().create_timer(1), "timeout")
	$Sfx/dead.stop()
	

func _on_Hitbox_area_entered(area):
	if area.is_in_group("Damage"):
		damaging = true
		while damaging == true:
			harm(1,1)
			yield(get_tree().create_timer(0.8), "timeout")
	elif area.is_in_group("HealUp"):
		heal_up()
	if area.is_in_group("Damage1"):
			while area.is_in_group("Damage1"):
				ui_update_poison()
				harm(1,1)
				yield(get_tree().create_timer(1.5), "timeout")

func _on_Hitbox_area_exited(area):
	damaging = false

	
