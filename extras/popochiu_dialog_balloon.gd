class_name PopochiuDialogBalloon
extends PopochiuDialog


const PLAYER_CHARACTER_NAME = "player"
const EMOTION_TAG_NAME = "emo"

@export var dialogue_resource: DialogueResource
@export var start_title := ""

var _option_ids: Array[String] = []


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
	var character := _get_speaking_character(dialogue_line.character)
	if character == null:
		PopochiuUtils.print_error("Dialogue line character not found " + dialogue_line.character)
		return
	
	await _say_emotional(character, dialogue_line)
	
	if dialogue_line.responses.is_empty():
		await _process_next(dialogue_line.next_id)
	else:
		_sync_options_with_responses(dialogue_line.responses)
		_add_responses_not_in_options(dialogue_line.responses)


func _get_speaking_character(character_name: String) -> PopochiuCharacter:
	var is_player = character_name.to_lower() == PLAYER_CHARACTER_NAME
	return C.player if is_player else C.get_runtime_character(character_name)


func _say_emotional(character: PopochiuCharacter, dialogue_line: DialogueLine) -> void:
	var emo := dialogue_line.get_tag_value(EMOTION_TAG_NAME)
	await character.say(dialogue_line.text, emo)


func _sync_options_with_responses(responses: Array[DialogueResponse]) -> void:
	var response_ids = responses.map(func (r): return r.id)
	
	for opt: PopochiuDialogOption in options:
		if opt.id in response_ids:
			if not opt.visible:
				opt.turn_on()
		else:
			opt.turn_off()


func _add_responses_not_in_options(responses: Array[DialogueResponse]) -> void:
	for response: DialogueResponse in responses.filter(func(r): return r.id not in _option_ids):
		var new_opt := _option_from_response(response)
		options.append(new_opt)
		_option_ids.append(new_opt.id)


func _option_from_response(response: DialogueResponse) -> PopochiuDialogBalloonOption:
	var new_opt := PopochiuDialogBalloonOption.new()
	new_opt.id = response.id
	new_opt.text = response.text
	new_opt.next_id = response.next_id
	
	return new_opt


#endregion
