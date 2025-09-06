extends Sprite2D
var speed: float = 200
var cannon
var projectile_container:Node

func _ready() -> void:
	cannon = $Cannon

func set_projectile_container(container: Node):
	cannon.projectile_container = container
	projectile_container = container

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	var direction: int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
	var mouse_position:Vector2 = get_global_mouse_position()
	var direction_vector:Vector2 = (mouse_position - global_position).normalized() # B - A siendo B el objetivo y A el shooter
	cannon.look_at(mouse_position)
	
	if Input.is_action_pressed("fire"):
		cannon.fire()
	
	position.x += direction * speed * delta
 
