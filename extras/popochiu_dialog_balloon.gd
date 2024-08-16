class_name PopochiuDialogBalloon
extends PopochiuDialog


const PLAYER_CHARACTER_NAME = "player"

@export var dialogue_resource: DialogueResource
@export var start_title := ""


#region Virtual ####################################################################################
func _on_start() -> void:
	await _process_next(start_title)


func _option_selected(opt: PopochiuDialogOption) -> void:
	if opt is PopochiuDialogBalloonOption:
		await _process_next(opt.next_id)
		
		_show_options()
	else:
		PopochiuUtils.print_error("Unexpected type for selected option " + opt.text)


#endregion

#region Private ####################################################################################
func _process_next(title: String) -> void:
	var next_line = await dialogue_resource.get_next_dialogue_line(title)
	if next_line == null:
		stop()
	else:
		await _process_dialogue_line(next_line)


func _process_dialogue_line(dialogue_line: DialogueLine) -> void:
	var character = _get_speaking_character(dialogue_line.character)
	if character == null:
		PopochiuUtils.print_error("Dialogue line character not found " + dialogue_line.character)
		return
	
	await character.say(dialogue_line.text)
	
	_turn_off_all_options()
	if dialogue_line.responses.is_empty():
		await _process_next(dialogue_line.next_id)
	else:
		for response: DialogueResponse in dialogue_line.responses:
			var opt = get_option(response.id)
			if opt == null:
				var new_opt := _option_from_response(response)
				options.push_back(new_opt)
			else:
				opt.turn_on()


func _get_speaking_character(character_name: String) -> PopochiuCharacter:
	var is_player_speaking = character_name.to_lower() == PLAYER_CHARACTER_NAME
	return C.player if is_player_speaking else C.get_runtime_character(character_name)


func _turn_off_all_options() -> void:
	for opt: PopochiuDialogOption in options:
		opt.turn_off()


func _option_from_response(response: DialogueResponse) -> PopochiuDialogBalloonOption:
	var new_opt := PopochiuDialogBalloonOption.new()
	new_opt.id = response.id
	new_opt.text = response.text
	new_opt.next_id = response.next_id
	
	return new_opt


#endregion
