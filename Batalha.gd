extends Control

var P1_max_hp = 30
var P1_hp = P1_max_hp
var P1_atk = 5
var P1_def = 5

var E1_max_hp = 18
var E1_hp = P1_max_hp
var E1_atk = 5
var E1_def = 5

var dano_p1
var dano_ini

func _ready():
	$Background/YSort/Textbox.hide()
	display_text("Bruxa Caicae te ataca!")

func _input(event):
	if P1_hp <= 0:
		display_text("GAME OVER")
	elif E1_hp <= 0:
		display_text("Voce derrotou Bruxa Caicae")
	elif Input.is_action_just_pressed("ui_accept") or Input.is_mouse_button_pressed(BUTTON_LEFT):
		$Background/YSort/Textbox.hide()
		$Background/Fundo.show()
	
func display_text(text):
	$Background/Fundo.hide()
	$Background/YSort/Textbox.show()
	$Background/YSort/Textbox/Label.text = text
	
func _on_Lutar_pressed():
	dano_ini = (2*P1_atk - E1_def)
	display_text("Bruxa Caicae perde " + str(dano_ini)+ " HP")
	$Inimigo/AnimationPlayer.play("dano")
	yield($Inimigo/AnimationPlayer, "animation_finished")
	E1_hp -= dano_ini
	dano_p1 = (2*E1_atk - P1_def)
	display_text("Voce perde " + str(dano_p1)+ " HP")
	P1_hp -= dano_p1
	$Inimigo/AnimationPlayer.play("idle")
	yield($Inimigo/AnimationPlayer, "animation_finished")
	$Background/YSort/Textbox.hide()
	$Background/Fundo.show()
