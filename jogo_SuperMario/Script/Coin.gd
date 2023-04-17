extends Area2D


func _on_Coins_body_entered(body):
	$AudioCoins.play()
	if body.get_name() == "Player":
		GlobalVar.moedas += 1
		queue_free()
