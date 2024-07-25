extends KinematicBody2D

var tam_tela
var direcao = Vector2.ZERO
var vel = -5
var player_position

func _ready():
	tam_tela = get_viewport_rect().size

func set_player_position(x):
	player_position = x

func _process(delta):
	if Input.is_action_pressed("acao"):
		position = player_position
	direcao.y += vel
	var colisao = move_and_collide(direcao)
	direcao.y = 0
