extends Area2D

@export var speed: int = 400
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Vector2.ZERO
	#var direction = Input.get_vector("left","right","up","down")
	if(Input.is_action_pressed("right")):
		direction.x += 1
	if(Input.is_action_pressed("left")):
		direction.x -= 1
	if(Input.is_action_pressed("up")):
		direction.y -= 1
	if(Input.is_action_pressed("down")):
		direction.y += 1
		
	if(direction.length() > 1):
		direction = direction.normalized()
	position += direction * speed * delta
