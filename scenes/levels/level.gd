extends Node2D

var player_shift: int = -70

func _on_player_1_switch_sides():
	player_shift *= -1
	$Player1.position.y = 360 + player_shift
	$Player1.scale *= Vector2(1,-1)
	$Player1/AnimationPlayer.play("portal_jump_out")
