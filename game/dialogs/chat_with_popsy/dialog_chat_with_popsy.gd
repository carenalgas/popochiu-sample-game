@tool
extends PopochiuDialog


#region Virtual ####################################################################################
func _on_start() -> void:
	# One can put here something to excecute before showing the dialog options.
	# E.g. Make the PC to look at the character which it will talk to, walk to
	# it, and say something (or make the character say something):
	await C.player.face_clicked()
	await C.player.say("Hey, Popsy!")
	# (!) It MUST always use an await
	await E.get_tree().process_frame


func _option_selected(opt: PopochiuDialogOption) -> void:
	# You can make the player character say the selected option with:
#	await D.say_selected()
	
	# Use match to check which option was selected and excecute something for
	# each one
	match opt.id:
		"StopWhining":
			await C.Popsy.say("Bwaaah! I'm hungry!!!", "sad")
			await C.player.say("I know, but please, stop crying like that...")
			await C.Popsy.say("* sniff *")
			opt.turn_off()
			turn_on_options(["OfferHelp"])
		"OfferHelp":
			await D.say_selected()
			await E.camera.shake_bg(1.0, 3.0)
			await C.Popsy.say("I WANT AN APPLE!!!", "sad")
		"PickToy":
			await D.say_selected()
			await C.Popsy.say("No, it's boring!")
			await C.Popsy.say("I'm bored!")
			await C.Popsy.say("AND I'M HUNGRY!!!", "sad")
			await C.player.say("Oh my...")
		"Bye":
			await C.player.say("Hold on!")
			stop()
	
	_show_options()


# Use this to save custom data for this PopochiuDialog when saving the game.
# The Dictionary must contain only JSON supported types: bool, int, float, String.
func _on_save() -> Dictionary:
	return {}


# Called when the game is loaded.
# This Dictionary should has the same structure you defined for the returned one in _on_save().
func _on_load(data: Dictionary) -> void:
	prints(data)


#endregion
