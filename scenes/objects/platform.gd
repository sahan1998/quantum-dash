extends Node2D

var top_block: PackedScene = preload("res://scenes/objects/top_platform_block.tscn")
var bottom_block: PackedScene = preload("res://scenes/objects/bottom_platform_block.tscn")
var vertical_spacing: int = 31
var top_block_array = []
var bottom_block_array = []
var top_block_spacing: int = 257
var bottom_block_spacing: int = 288

@export var speed: int = 100

func _ready():
	# filling the level with the initial top blocks
	for i in 7:
		var block1 = top_block.instantiate() as Sprite2D
		var block2 = bottom_block.instantiate() as Sprite2D
		
		block1.position.x = i * top_block_spacing
		block2.position.x = i * bottom_block_spacing
		block2.position.y = vertical_spacing
		
		top_block_array.append(block1)
		bottom_block_array.append(block2)
		
		$top.add_child(block1)
		$bottom.add_child(block2)

func _physics_process(delta):
	$top.position.x -= speed * delta
	$bottom.position.x -= speed * delta
	## removing and adding blocks as they move outside screen
	# Top Block
	if top_block_array[0].global_position.x < -300:
		top_block_array.pop_front().queue_free()
		var block1 = top_block.instantiate() as Sprite2D
		block1.position.x = top_block_array[-1].position.x + top_block_spacing
		top_block_array.append(block1)
		$top.add_child(block1)
	# Bottom Block
	if bottom_block_array[0].global_position.x < -300:
		bottom_block_array.pop_front().queue_free()
		var block2 = bottom_block.instantiate() as Sprite2D
		block2.position.x = bottom_block_array[-1].position.x + bottom_block_spacing
		block2.position.y = vertical_spacing
		bottom_block_array.append(block2)
		$bottom.add_child(block2)
