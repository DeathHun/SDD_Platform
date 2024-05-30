extends CharacterBody2D
class_name Player

@export var attacking = false
@export var speed  = 200.0
@export var jump_velocity = -400.0
@export var friction = 3000
@export var air_resistance = 3000
@export var Coyote_Time : float = 0.2

var has_timer_start : bool = false
var air_jump : bool = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var wall_jump : bool = false
var wall_normal : Vector2
var jump_available : bool = true


func _physics_process(delta):
	move_and_slide()



func add_gravity(delta):
	if not is_on_floor():
		velocity.y += 1.25 * gravity * delta

func movement(delta):
	var direction = Input.get_axis("left", "right")
	if direction != 0:
		velocity.x = speed*direction

	else:
		if not is_on_floor():
			velocity.x = move_toward(velocity.x, 0, delta*air_resistance)

		else:
			velocity.x = move_toward(velocity.x, 0, delta*friction)

func jump_action():
	if is_on_floor():
		air_jump = false
		jump_available = true
		#coyote_timer.stop()
	
	if not is_on_floor():
		if jump_available:
			#if coyote_timer.is_stopped():
				air_jump = true
				#coyote_timer.start(Coyote_Time)


