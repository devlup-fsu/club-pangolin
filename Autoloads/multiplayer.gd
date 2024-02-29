extends Node


func start_server(port: int):
	var peer = ENetMultiplayerPeer.new()
	peer.create_server(port)
	
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(_on_multiplayer_peer_connected)


func _on_multiplayer_peer_connected(id: int):
	print(id, " connected")


func start_client(address: String, port: int):
	var peer = ENetMultiplayerPeer.new()
	peer.create_client(address, port)
	
	multiplayer.multiplayer_peer = peer
