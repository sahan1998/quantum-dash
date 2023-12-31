extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -300.0

signal switch_sides

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 980

func _ready():
	pass

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AnimationPlayer.play("jump")
	
	# Handle Dimension Swap
	if Input.is_action_just_pressed("primary action"):
		$AnimationPlayer.play("portal_jump_in")
		switch_sides.emit()
		gravity *= -1
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
#	var direction = Input.get_axis("ui_left", "ui_right")
#	if direction:
#		velocity.x = direction * SPEED
#	else:
#		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func run_animation():
	$AnimationPlayer.play("running")
