extends Sprite2D
@export var projectile_scene:PackedScene
var fire_position:Marker2D
var projectile_container:Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fire_position = $FirePosition
	
func fire() -> void:
	var projectile_instance:Projectile = projectile_scene.instantiate()
	projectile_container.add_child(projectile_instance)
	projectile_instance.set_starting_values(fire_position.global_position, (fire_position.global_position - global_position).normalized())
	projectile_instance.connect("delete_requested", Callable(self, "_on_projectile_delete_requested"))
	
func _on_projectile_delete_requested(projectile):
	projectile_container.remove_child(projectile)
	projectile.queue_free()
