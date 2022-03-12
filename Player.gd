extends KinematicBody2D
var velocity=Vector2(0,0)
var SPEED=180
var GRAVITY=25
var coins=0
var JUMPFORCE=-1150
func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x=SPEED
		$Sprite.play("walk")
		$Sprite.flip_h=false
	elif Input.is_action_pressed("ui_left"):
		velocity.x=-SPEED
		$Sprite.play("walk")
		$Sprite.flip_h=true
	else:
		$Sprite.play("idle")
	if not is_on_floor():
		$Sprite.play("jump")
	if Input.is_action_just_pressed("ui_jump") and is_on_floor():
		velocity.y=JUMPFORCE
		
		

	velocity.y=velocity.y+30
	velocity=move_and_slide(velocity,Vector2.UP)
	velocity.x=lerp(velocity.x,0,0.2)

func add_coin():
	coins+=1

func bounce():
	velocity.y=JUMPFORCE*0.7
func ouch():
	set_modulate(Color(1,0.3,0.3,0.3))
	velocity.y=JUMPFORCE*0.7





