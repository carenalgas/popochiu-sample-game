class_name PopochiuDialogBalloon
extends PopochiuDialog

@export var dialogue_resource: DialogueResource
@export var start_title := ""


#region Virtual ####################################################################################
func _on_start() -> void:
	_process_next(start_title)


#endregion

#region Private ####################################################################################
func _process_next(title: String) -> void:
	var next_line = await dialogue_resource.get_next_dialogue_line(title)
	_process_dialogue_line(next_line)


func _process_dialogue_line(dialogue_line: DialogueLine) -> void:
	var character = _get_speaking_character(dialogue_line.character)
	if character == null:
		PopochiuUtils.print_error("Dialogue line character not found " + dialogue_line.character)
		return
	
	await character.say(dialogue_line.text)
	
	if dialogue_line.responses.is_empty():
		_process_next(dialogue_line.next_id)


func _get_speaking_character(character_name: String) -> PopochiuCharacter:
	var is_player_speaking = character_name.to_lower() == "player"
	return C.player if is_player_speaking else C.get_runtime_character(character_name)


#endregion
