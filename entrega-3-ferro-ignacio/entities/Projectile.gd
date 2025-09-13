extends Sprite2D
class_name Projectile

@onready var lifetime_timer = $LifetimeTimer

@export var VELOCITY: float = 800.0

var direction:Vector2

var bodyHit: Node2D

func initialize(container, spawn_position:Vector2, direction:Vector2):
	container.add_child(self)
	self.direction = direction
	global_position = spawn_position
	lifetime_timer.connect("timeout", Callable(self, "_on_lifetime_timer_timeout"))
	lifetime_timer.start()

func _physics_process(delta):
	position += direction * VELOCITY * delta

# Si supero una cantidad de tiempo de vida
func _on_lifetime_timer_timeout():
	_remove()

func _remove():
	get_parent().remove_child(self)
	queue_free()
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body)
	if body is Player:
		print("le pegue a un player")
		bodyHit = body
		bodyHit.notify_hit()
