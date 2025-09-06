extends Sprite2D
class_name Projectile

signal delete_requested(projectile)

var direction: Vector2
@export var speed:float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_physics_process(false)

func set_starting_values(starting_position: Vector2, direction: Vector2):
	global_position = starting_position
	self.direction = direction
	$Timer.start()
	set_physics_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position += direction*speed*delta

func _on_timer_timeout() -> void:
	emit_signal("delete_requested", self)
