extends CharacterBody2D

var SPEED = 300
var player_state

func _ready():
	player_state = "idle"

func _physics_process(delta):
	var direction = Input.get_vector("left","right","up","down")
	
	if direction.x == 0 and direction.y == 0:
		player_state = "idle"
	elif direction.x != 0 or direction.y != 0:
		player_state = "walking"
	velocity = direction * SPEED
	move_and_slide()
	play_anim(direction)
	
func play_anim(dir):
	if(player_state == "idle"):
		$AnimatedSprite2D.play("idle")
	if(player_state == "walking"):
		if(dir.y == -1):
			$AnimatedSprite2D.play("walk_y_up")
		elif(dir.y == 1):
			$AnimatedSprite2D.play("walk_y_down")
		elif(dir.x == 1):
			$AnimatedSprite2D.flip_h = false;
			$AnimatedSprite2D.play("walk_x")
		elif(dir.x == -1):
			$AnimatedSprite2D.flip_h = true;
			$AnimatedSprite2D.play("walk_x")
	
