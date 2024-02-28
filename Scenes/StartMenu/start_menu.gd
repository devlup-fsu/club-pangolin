extends Control

signal next


func _on_create_server_button_pressed():
	next.emit()


func _on_join_server_button_pressed():
	next.emit()
