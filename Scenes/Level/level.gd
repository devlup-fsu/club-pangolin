extends Node2D

var player_scene: PackedScene = load("res://Entities/Player/player.tscn")


@rpc("call_local", "any_peer", "reliable")
func spawn_player(nickname: String, color: Color):
	if multiplayer.is_server():
		%MultiplayerSpawner.spawn({"id": multiplayer.get_remote_sender_id(), "nickname": nickname, "color": color})
	#%EmojiPicker.player = player
