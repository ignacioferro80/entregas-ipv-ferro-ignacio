extends Sprite2D

@export var projectile_scene:PackedScene
var projectile_container: Node

@onready var fire_position:Marker2D = $FirePosition
var player

func _ready() -> void:
	pass
	
func set_values(player, projectile_container):
	self.player = player
	self.projectile_container = projectile_container
	$Timer.start()

func _on_timer_timeout() -> void:
	fire()
	
func fire() -> void:
	var projectile:Projectile = projectile_scene.instantiate()
	projectile_container.add_child(projectile)
	projectile.set_starting_values(fire_position.global_position, (player.global_position - fire_position.global_position).normalized())
	projectile.connect("delete_requested", Callable(self, "_on_projectile_delete_requested"))

func _on_projectile_delete_requested(projectile):
	projectile_container.remove_child(projectile)
	projectile.queue_free()
