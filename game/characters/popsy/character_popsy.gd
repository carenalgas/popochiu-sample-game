@tool
extends PopochiuCharacter
# You can use E.queue([]) to trigger a sequence of events.
# Use await E.queue([]) if you want to pause the excecution of
# the function until the sequence of events finishes.

const Data := preload('character_popsy_state.gd')

var state: Data = load("res://game/characters/popsy/character_popsy.tres")


#region Virtual ####################################################################################
# When the room in which this node is located finishes being added to the tree
func _on_room_set() -> void:
	pass


# When the node is clicked
func _on_click() -> void:
	D.ChatWithPopsy.start()


func _on_double_click() -> void:
	# Replace the call to E.command_fallback() with your code.
	E.command_fallback()
	# For example, you could make the player instantly do something instead of walking there first


# When the node is right clicked
func _on_right_click() -> void:
	await C.player.face_clicked()
	await C.player.say("Popsy can be a handful, but he's also adorable.")


# When the node is middle clicked
func _on_middle_click() -> void:
	# Replace the call to E.command_fallback() to implement your code.
	E.command_fallback()


# When the node is clicked and there is an inventory item selected
func _on_item_used(_item: PopochiuInventoryItem) -> void:
	if _item == I.ToyCar:
		await C.player.walk_to_clicked()
		await C.player.say("Maybe if you played with your toy car a little bit, you wouldn't feel hungry.")
		await I.ToyCar.remove()
		await C.Popsy.say("Yay! My toy car! Vrooom!!!")
		await C.player.face_down()
		await C.player.say("I hope this will keep him busy for a while!")
	if _item == I.Apple:
		## An example on how to use queues for cutscenes
		## That's an optional way to write them
		await E.queue([
			C.player.queue_walk_to_clicked(),
			"Player: Here! A juicy apple for you!",
			I.Apple.queue_remove(),
			"Popsy: Yeeeee!!!",
			E.queue_wait(1.5),
			"Popsy(sad): But I wanted a GREEN apple..."
		])
		
		R.goto_room("End")


# Use it to play the idle animation for the character
func _play_idle() -> void:
	super()


# Use it to play the walk animation for the character
# target_pos can be used to know the movement direction
func _play_walk(target_pos: Vector2) -> void:
	super(target_pos)


# Use it to play the talk animation for the character
func _play_talk() -> void:
	if emotion == "sad":
		play_animation("cry")
	else:
		super()


# Use it to play the grab animation for the character
func _play_grab() -> void:
	super()


# Called when the character stops moving
func _on_move_ended() -> void:
	pass


#endregion

#region Public #####################################################################################
# You can add here functions triggered by the GUI commands. For example, if your GUI has a command
# for look_at, you could have the function:
#func on_look_at() -> void:
	#pass


#endregion
