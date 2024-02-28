extends Control

@onready var player: Player = $Control/Player


func _on_line_edit_text_changed(value: String):
	player.set_nickname(value)


func _on_color_picker_color_changed(color: Color):
	player.set_color(color)


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level/level.tscn")
