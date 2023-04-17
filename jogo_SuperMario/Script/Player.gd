extends KinematicBody2D

export var gravity = 9.8
export var movement = Vector2()
export var walk_speed = 108
export var jump_force = 300

var max_jumps = 1
var jumps = 0
var life = 3
var knockback_dir = 1
var knockback_int = 900

func _physics_process(delta):
	if not is_on_floor():
		movement.y+=gravity
	else:
		jumps = 0
		
	var hor_axis = Input.get_action_strength("right")-Input.get_action_strength("left")
	movement.x = hor_axis * walk_speed

	if Input.is_action_just_pressed("jump") and jumps < max_jumps:
		movement.y = -jump_force
		$AudioJump.play()
		jumps += 1
		
	move_and_slide(movement,Vector2.UP)
	
	update_animation()
	
func update_animation():
	if movement.x > 0:
		$AnimacaoPlayer.scale.x = 2
	elif movement.x < 0:
		$AnimacaoPlayer.scale.x = -2
		
	if is_on_floor():
		if abs(movement.x) > 0:
			$AnimacaoPlayer.play("walk")
		else:
			$AnimacaoPlayer.play("idle")
	else:
		$AnimacaoPlayer.play("jump")
		
func _ready():
	Serial.connect("direita", self,"_on_direita")
	Serial.connect("esquerda", self,"_on_esquerda")
	Serial.connect("pula", self,"_on_pula")
	# definir variáveis de movimento
	var velocity = Vector2.ZERO
	
	# definir animação
	var animation_player = $AnimacaoPlayer
	animation_player.play("idle")
	
func _on_esquerda():
	# mover para esquerda
	var animation_player = $AnimacaoPlayer
	animation_player.flip_h = true
	animation_player.play("walk")
	var velocity = Vector2(-200, 0)
	move_and_slide(velocity, Vector2.UP)
	
func _on_direita():
	# mover para direita
	var animation_player = $AnimacaoPlayer
	animation_player.flip_h = false
	animation_player.play("walk")
	var velocity = Vector2(200, 0)
	move_and_slide(velocity, Vector2.UP)

func _on_pula():
	if is_on_floor():
		movement.y = -jump_force
		$AnimacaoPlayer.play("jump")
		$AudioJump.play()
		jumps = 1
		
	elif jumps < max_jumps:
		movement.y = -jump_force
		$AnimacaoPlayer.play("jump")
		$AudioJump.play()
		jumps += 1
		


func knockback():
	movement.x = -knockback_dir*knockback_int
	movement = move_and_slide(movement)
	
func _on_DamagePlayer_body_entered(body):
	life = life - 1
	GlobalVar.vidas = GlobalVar.vidas - 1
	$AudioDano.play()
	knockback()
	if life == 0:
		var animation_player = $AnimacaoPlayer
		animation_player.play("gameOver")
		GlobalVar.vidas = 3
		GlobalVar.moedas = 0



