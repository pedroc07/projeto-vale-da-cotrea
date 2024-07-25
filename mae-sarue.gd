extends KinematicBody2D
var tam_tela
var direcao = Vector2.ZERO
var vel = 5
var sentido = 1

func _ready():
	$AnimatedSprite.playing = true
	tam_tela = get_viewport_rect().size

func _process(delta):
	direcao.x += vel * sentido
	if position.x >= 600:
		sentido = -1
	if position.x <= -300:
		sentido = 1
	var colisao = move_and_collide(direcao)
	if colisao:
		$AnimatedSprite.animation = "magra"
	direcao.x = 0
