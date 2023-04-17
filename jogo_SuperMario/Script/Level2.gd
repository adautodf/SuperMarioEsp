extends Node2D

func _ready():
	$AudioTemaL2.play()

func _on_Final_body_entered(body):
	pass 
	if body.get_name() == "Player":
		get_tree().change_scene("res://Scenes/TextureRect.tscn")
	else: 
		print("colete todas as moedas")
