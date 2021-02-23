extends KinematicBody2D

# Player Status
var score : int = 0
 
# Player physics
var speed : int = 200
var jumpForce : int = 600
var gravity : int = 800
 
var vel : Vector2 = Vector2()
var grounded : bool = false

# components
onready var sprite = $PlayerSprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	vel.x = 0
	if Input.is_action_pressed("move_left"):
		vel.x -= speed
	if Input.is_action_pressed("move_right"):
		vel.x += speed
	vel = move_and_slide(vel, Vector2.UP)
	
	vel.y += gravity * delta
	if Input.is_action_pressed("jump") and is_on_floor():
		vel.y -= jumpForce
	
	if vel.x <0 :
		sprite.flip_h = true
	else:
		sprite.flip_h = false
		
