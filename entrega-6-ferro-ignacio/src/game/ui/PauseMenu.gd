extends Control

## Menú de pausa genérico, abierto utilizando la acción "pause_menu"
## (por default la tecla Esc).

@onready var options_menu: Control = $"."
signal return_selected()

func _ready() -> void:
	hide()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("pause_menu") && not !options_menu.visible:
		visible = !visible
		get_tree().paused = visible


func _on_resume_button_pressed() -> void:
	hide()
	get_tree().paused = false


func _on_exit_button_pressed() -> void:
	return_selected.emit()
