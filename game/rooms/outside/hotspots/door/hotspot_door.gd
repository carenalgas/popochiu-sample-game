@tool
extends PopochiuHotspot
# You can use E.queue([]) to trigger a sequence of events.
# Use await E.queue([]) if you want to pause the excecution of
# the function until the sequence of events finishes.


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ VIRTUAL ░░░░
# When the node is clicked
func _on_click() -> void:
	await C.player.walk_to_clicked()
	E.goto_room("House")


# When the node is right clicked
func _on_right_click() -> void:
	# Replace the call to E.command_fallback() with your code.
	# E.g. Make the player-controlled character walk to the Hotspot and then say
	# something:
#	await C.player.face_clicked()
#	await C.player.say("A closed door")
	E.command_fallback()


# When the node is clicked and there is an inventory item selected
func _on_item_used(_item: PopochiuInventoryItem) -> void:
	# Replace the call to E.command_fallback() with your code.
	# E.g. Make the player-controlled character to react when using a specific
	# item on this Hotspot:
#	if item.script_name == 'Key':
#		await C.player.say("No can do")
	E.command_fallback()
