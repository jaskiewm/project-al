extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func hide_email_previews():
	for N in get_children():
		N.visible = false

func _on_Email_pressed():
	hide_email_previews()
	$EmailPreview.visible = true

func _on_Email2_pressed():
	hide_email_previews()
	$Email2Preview.visible = true


func _on_Email3_pressed():
	hide_email_previews()
	$Email3Preview.visible = true


func _on_Email4_pressed():
	hide_email_previews()
	$Email4Preview.visible = true


func _on_Email5_pressed():
	hide_email_previews()
	$Email5Preview.visible = true


func _on_Email6_pressed():
	hide_email_previews()
	$Email6Preview.visible = true
