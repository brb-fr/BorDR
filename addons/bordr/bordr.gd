@tool
extends ColorRect

@export var window_name: String
@export var icon: Texture2D
@export var dragable: bool = true
@export var show_controls: bool = true
@export var dragobj_color: Color = Color(0,0,0,0.845)

var last_mouse_pos: Vector2i = Vector2i(0,0)
var holding = false

func _on_sensor_button_down() -> void:
	if dragable:
		holding = true
		last_mouse_pos = get_local_mouse_position()

func _on_sensor_button_up() -> void:
	holding = false

func _process(delta: float) -> void:
	if !show_controls:
		$X.hide()
		$"-".hide()
	else:
		$X.show()
		$"-".show()
	if holding: DisplayServer.window_set_position(DisplayServer.mouse_get_position() - last_mouse_pos)
	$Icon.texture = icon
	$Icon/Name.text = window_name
	color = dragobj_color
func _on_close_pressed() -> void:
	get_tree().quit()

func _on_minimize_pressed() -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MINIMIZED)
