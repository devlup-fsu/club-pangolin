extends Control


func load_player_select_screen():
	get_tree().change_scene_to_file("res://Scenes/PlayerSelectScreen/player_select_screen.tscn")


func _on_create_server_button_pressed():
	load_player_select_screen()


func _on_join_server_button_pressed():
	load_player_select_screen()
