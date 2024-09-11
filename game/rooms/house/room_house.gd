@tool
extends PopochiuRoom

const Data := preload('room_house_state.gd')

var state: Data = load("res://game/rooms/house/room_house.tres")


#region Virtual ####################################################################################
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	A.mx_two_popochius.play()

# What happens when the room changing transition finishes. At this point the room
# is visible.
func _on_room_transition_finished() -> void:
	if state.visited_first_time:
		await C.player.say("What a lazy day!")
		await C.Popsy.say("[rainbow]Bwaaaaaah!!![/rainbow]")
		await C.player.face_right()
		await C.player.say("Why are you crying, Popsy?")
		await C.Popsy.say("I'm hungry!")
		await C.player.say("Ok, ok, no need to scream like that!")
		await C.player.say("I'll try and find some fruit!")
		await C.Popsy.say("Thank you!")
		await C.player.face_left()
		await C.player.say("I'd better find something for Popsy or he'll drive me mad.")


# What happens before Popochiu unloads the room.
# At this point, the screen is black, processing is disabled and all characters
# have been removed from the $Characters node.
func _on_room_exited() -> void:
	pass


#endregion
