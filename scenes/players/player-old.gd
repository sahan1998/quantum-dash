extends CharacterBody2D

func _process(delta):
	if Input.is_action_just_pressed("jump"):
		$AnimationPlayer.play("jump")

func run_animation():
	$AnimationPlayer.play("running")
