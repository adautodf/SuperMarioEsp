extends Node
const serial_res = preload("res://bin/gdserial.gdns")

var serial_port = serial_res.new()

var is_port_open = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var msg = ''
signal direita(player)
signal esquerda(player)
signal pula(player)

# Called when the node enters the scene tree for the first time.
func _ready():
	serial_port.open_port('COM4',115200)
	is_port_open = true
	print(is_port_open)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(is_port_open):
		var message = serial_port.read_text()
		if(message.length()>0):
			for i in message:
				if(i=='\n'):
					_text_interpreter(msg)
					msg = ''
				else:
					msg = msg+i
					
func _text_interpreter(msg):
	var command = msg.split(' ')
	if(command[0]=='ESQUERDA'):
		emit_signal("esquerda")
		
	elif(command[0]=='DIREITA'):
		emit_signal("direita")
		
	elif(command[0]=='PULA'):
		emit_signal("pula")
		
	else:
		print('COMANDO DESCONHECIDO')
