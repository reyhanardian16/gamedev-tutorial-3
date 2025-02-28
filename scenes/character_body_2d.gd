extends CharacterBody2D

@export var walk_speed = 200
@export var gravity = 1000.0
@export var jump_speed = -500
var can_double_jump = false
@onready var _animated_sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass

func _physics_process(delta):
	velocity.y += delta * gravity
	
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y = jump_speed
		can_double_jump = true
	elif Input.is_action_just_pressed("ui_up") and can_double_jump:
		velocity.y = jump_speed
		can_double_jump = false
	
	if not Input.is_action_pressed("ui_down"):
		$CollisionShape2D_default.disabled = false
		
	if Input.is_action_pressed("ui_left"):
		velocity.x = -walk_speed
		_animated_sprite.flip_h = true
		if is_on_floor():
			_animated_sprite.play("walk")
			if Input.is_action_pressed("ui_down"):
				$CollisionShape2D_default.disabled = true
				_animated_sprite.play("slide")
			
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  walk_speed
		_animated_sprite.flip_h = false
		if is_on_floor():
			_animated_sprite.play("walk")
			if Input.is_action_pressed("ui_down"):
				$CollisionShape2D_default.disabled = true
				_animated_sprite.play("slide")

	else:
		velocity.x = 0
		if Input.is_action_pressed("ui_down"):
			$CollisionShape2D_default.disabled = true
			_animated_sprite.play("crouch")
		else:
			_animated_sprite.play("default")
	

	
	if not is_on_floor():
		if velocity.y < 0:
			_animated_sprite.play("jump")
		else:
			_animated_sprite.play("fall")
		
	# "move_and_slide" already takes delta time into account.
	move_and_slide()
	   
