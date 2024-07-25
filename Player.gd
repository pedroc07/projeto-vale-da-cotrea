extends KinematicBody2D

var tam_tela
var vel = Vector2.ZERO
const vel_max = 88

var animationSprite = null
var animationTree = null
var animationPlayer = null
var animationState = null

func _ready():
	animationSprite = $AnimatedSprite
	animationPlayer = $AnimatedSprite/AnimationPlayer
	animationTree = $AnimatedSprite/AnimationTree
	animationState = animationTree.get("parameters/playback")
	tam_tela = get_viewport_rect().size

func _process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		print(input_vector)
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Andar/blend_position", input_vector)
		animationState.travel("Andar")
		vel = input_vector
	else:
		animationState.travel("Idle")
		vel = Vector2.ZERO
	move_and_collide(vel * delta * vel_max)
	#position += direcao * delta
	#position.x = clamp(position.x, -400, 560)
	#position.y = clamp(position.y, -420, 80)
