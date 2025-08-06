@tool
extends EditorPlugin


func _enter_tree() -> void:
	printerr("Please enable borderless for this plugin to work properly.")
	printerr("You can use BorDR by instanciating bordr.tscn in the addons/bordr folder.")
