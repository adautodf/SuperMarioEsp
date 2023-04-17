extends Area2D


func _on_GameOver_body_entered(body):
	if body.get_name() == "Player":
		GlobalVar.moedas = 0
		GlobalVar.vidas = 3
		get_tree().reload_current_scene()
	
