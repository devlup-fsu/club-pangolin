extends Node


func _on_start_menu_next():
	%StartMenu.queue_free()
	var player_select_screen = load("res://Scenes/PlayerSelectScreen/player_select_screen.tscn").instantiate()
	player_select_screen.next.connect(_on_player_select_screen_next)
	add_child(player_select_screen, true)


func _on_player_select_screen_next(nickname: String, color: Color):
	$PlayerSelectScreen.queue_free()
	
	%Level.spawn_player.rpc(nickname, color)
	%Level.visible = true
	%EmojiPicker.id = multiplayer.get_unique_id()
	%EmojiPicker.visible = true
	%ChatBox.id = multiplayer.get_unique_id()
	%ChatBox.visible = true
