extends Node2D

var player_scene: PackedScene = load("res://Entities/Player/player.tscn")

func get_player(id: int) -> Player:
	for player in %Players.get_children():
		if player is Player and player.id == id:
			return player
	
	return null


@rpc("call_local", "any_peer", "reliable")
func spawn_player(nickname: String, color: Color):
	if multiplayer.is_server():
		var player = $MultiplayerSpawner.spawn({"id": multiplayer.get_remote_sender_id(), "nickname": nickname, "color": color})
