extends CharacterBody2D

@export var move_speed: float = 100  

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D  

func _ready():
	anim.play("idle_front")

func _physics_process(delta):
	var input_direction = Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)

	velocity = input_direction.normalized() * move_speed

	if input_direction != Vector2.ZERO:
		if input_direction.x > 0:
			anim.play("walk_right")
		elif input_direction.x < 0:
			anim.play("walk_left")
		elif input_direction.y > 0:
			anim.play("walk_front")
		elif input_direction.y < 0:
			anim.play("walk_back")
	else:
		if anim.animation.begins_with("walk"):
			anim.play(anim.animation.replace("walk", "idle"))

	move_and_slide()
