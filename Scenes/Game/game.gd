extends Node

@onready var level: Node2D = $Level
@onready var chatBox = $ChatBox


func _on_start_menu_next():
	$StartMenu.queue_free()
	var player_select_screen = load("res://Scenes/PlayerSelectScreen/player_select_screen.tscn").instantiate()
	player_select_screen.next.connect(_on_player_select_screen_next)
	add_child(player_select_screen, true)


func _on_player_select_screen_next(nickname: String, color: Color):
	level.spawn_player(nickname, color)
	level.visible = true
	$PlayerSelectScreen.queue_free()
