extends Node2D

var player_scene: PackedScene = load("res://Entities/Player/player.tscn")


func spawn_player(nickname: String, color: Color):
	var player: Player = player_scene.instantiate()
	player.set_nickname.call_deferred(nickname)
	player.set_color.call_deferred(color)
	player.global_position = get_viewport().get_visible_rect().size / 2
	$Island/Players.add_child(player)
