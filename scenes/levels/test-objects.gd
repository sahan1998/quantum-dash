extends Node2D

var speed: int = 100

func _physics_process(delta):
	self.position.x -= speed * delta
