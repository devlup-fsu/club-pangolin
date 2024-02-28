extends Node


func start_server(port: int) -> bool:
	var peer = ENetMultiplayerPeer.new()
	peer.create_server(port)
	
	if peer.get_connection_status() == MultiplayerPeer.CONNECTION_DISCONNECTED:
		OS.alert("Failed to start multiplayer server.")
		return false
	
	multiplayer.multiplayer_peer = peer
	return true


func start_client(address: String, port: int) -> bool:
	var peer = ENetMultiplayerPeer.new()
	peer.create_client(address, port)
	
	if peer.get_connection_status() == MultiplayerPeer.CONNECTION_DISCONNECTED:
		OS.alert("Failed to start multiplayer client.")
		return false
	
	multiplayer.multiplayer_peer = peer
	return true
