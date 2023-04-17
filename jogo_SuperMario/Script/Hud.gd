extends Control

func _process(delta):
	$CanvasLayer/Label.text = "Coins:" + str(GlobalVar.moedas)
	$CanvasLayer/Life.text = "Life:" + str(GlobalVar.vidas)
