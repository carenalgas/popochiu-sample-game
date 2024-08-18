class_name PopochiuDialogBalloonOption
extends PopochiuDialogOption

var next_id := ""


#region Public #####################################################################################
## Makes the option visible and doesn't reset [member used].
func make_visible() -> void:
	if disabled: return
	
	visible = true


#endregion
