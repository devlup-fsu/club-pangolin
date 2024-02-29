extends Node


func start_server(port: int):
	var peer = ENetMultiplayerPeer.new()
	peer.create_server(port)
	
	multiplayer.multiplayer_peer = peer


func start_client(address: String, port: int):
	var peer = ENetMultiplayerPeer.new()
	peer.create_client(address, port)
	
	multiplayer.multiplayer_peer = peer
