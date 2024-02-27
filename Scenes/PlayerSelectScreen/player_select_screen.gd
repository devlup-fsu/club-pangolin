extends Control

@onready var player: Player = $Player


func _on_line_edit_text_changed(value: String):
	player.set_nickname(value)


func _on_color_picker_color_changed(color: Color):
	player.set_color(color)
