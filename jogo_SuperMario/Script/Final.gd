extends Area2D


func _on_Final_body_entered(body):
	if GlobalVar.moedas >= 9:
		get_tree().change_scene("res://Scenes/Level2.tscn")
	else: 
		print("colete todas as moedas")
