extends Node3D

@onready var camera = $Camera3D
@export var speed = 0.2
@export var zoom_speed = 0.5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	
	var direction = Vector3.ZERO
	var zoom = Vector3.ZERO

	if Input.is_action_pressed("right"):
		direction.z -= 1
	if Input.is_action_pressed("left"):
		direction.z += 1
	if Input.is_action_pressed("back"):
		direction.x += 1
	if Input.is_action_pressed("forward"):
		direction.x -= 1
	if Input.is_action_just_pressed("out"):
		zoom.y += 1
	if Input.is_action_just_pressed("in"):
		zoom.y -= 1

	if direction != Vector3.ZERO:
		direction = direction.normalized()
		
	if zoom != Vector3.ZERO:
		zoom = zoom.normalized()
	
	camera.position += direction * speed
	camera.position += zoom * zoom_speed
