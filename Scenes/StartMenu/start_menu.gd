extends Control

signal next


func _on_create_server_button_pressed():
	Multiplayer.start_server(int(%HostPortLineEdit.text))
	next.emit()


func _on_join_server_button_pressed():
	Multiplayer.start_client(%HostIPLineEdit.text, int(%HostPortLineEdit.text))
	next.emit()
