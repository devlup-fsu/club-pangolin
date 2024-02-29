extends MultiplayerSpawner

var player_scene: PackedScene = load("res://Entities/Player/player.tscn")


func _enter_tree():
	spawn_function = _on_spawn


func _on_spawn(data: Dictionary) -> Player:
	var player: Player = player_scene.instantiate()
	player.set_nickname.call_deferred(data["nickname"])
	player.set_color.call_deferred(data["color"])
	player.id = data["id"]
	player.global_position = get_viewport().get_visible_rect().size / 2
	
	return player
