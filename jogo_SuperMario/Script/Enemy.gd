extends KinematicBody2D

export var gravity = 9.8 
export var movement = Vector2()
export var direction = 2

#func _ready():
	
	#$RayCast2D.position.x = $ColisaoEnemy.shape.get_extents().x*direction
	
	#pass

# warning-ignore:unused_argument
func _physics_process(delta):
	if not is_on_floor():
		movement.y+=gravity
	if is_on_wall(): #or not $RayCast2D.is_colliding():
		direction*=-1
		#$RayCast2D.position.x = $ColisaoEnemy.shape.get_extents().x*direction
	movement.x =30*direction
# warning-ignore:return_value_discarded
	if direction == 2:
		$AnimacaoEnemy.flip_h = true
	else:
		$AnimacaoEnemy.flip_h = false

	move_and_slide(movement,Vector2.UP)


func _on_Damage_body_entered(body):
	$DanoInimigo.play()
	if body.get_name() == "Player":
		body.movement.y = -300
		queue_free()
