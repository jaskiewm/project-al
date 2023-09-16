extends PanelContainer

#var PlayerMessageCount: int = 0 #Used to identify what messaging stage the player is at (first message vs 3rd vs last)
var newUserMessage: Label
var newJamieMessage: Label

var UM1 = "Yeah, for sure! I would love to :)"
var UM2 = "It's alright...my manager is being terrible again"
var UM3 = "It's just a lot of expectations.\n Maybe we can chat after work about it?"
var UM4 = "Thanks Honey, I love you!"
var UM5 = "I want a divorce"
var JM1 = "How's work going?"
var JM2 = "Oh no :( What is it this time?"
var JM3 = "I'd love to :) Don't worry, you got this! <3"
var JM4 = "I love you too ^_^"
var UM_Num = [UM1,UM2,UM3,UM4]
var JM_Num = [JM1,JM2,JM3,JM4]

#Jamie Message starts at 0. Once player clicks button, global var JamieMessage = 1
#After the scenes change, Jamie's message shows and the gloabl var becomes 2

func _ready():
	$VBoxContainer2/ScrollContainer/SingleMessages/JMsg2.add_color_override("font_color",Color("ffffff"))
	match(GlobalVar.jamieMessageShown):
		1:
			_messageRepeater(1)
			GlobalVar.jamieMessageShown+=1
			messengerNotification()
		2:
			_messageRepeater(1)
		3:
			_messageRepeater(2)
			GlobalVar.jamieMessageShown+=1
			messengerNotification()
		4:
			_messageRepeater(2)
		5:
			_messageRepeater(3)
			GlobalVar.jamieMessageShown+=1
			messengerNotification()
		6:
			_messageRepeater(3)
		7:
			_messageRepeater(4)
			GlobalVar.jamieMessageShown+=1
			messengerNotification()
	changeButtonText(GlobalVar.jamieMessageShown)
	
	if(GlobalVar.timelineDialogueNumber == 4):
		$VBoxContainer2/Button.visible = false
		_duplicatePlayerMessage()
		newUserMessage.text = UM5


#Message repeater used for generating pre-existing messages when the user interacts with the messenger tool
func _messageRepeater(messageNum):
	for n in range(1,messageNum+1):
		_duplicatePlayerMessage()
		newUserMessage.text = UM_Num[n-1]
		_duplicateJamieMessage()
		newJamieMessage.text = JM_Num[n-1]


func _duplicateJamieMessage():
	newJamieMessage = $VBoxContainer2/ScrollContainer/SingleMessages/JMsg1.duplicate(1)
	$VBoxContainer2/ScrollContainer/SingleMessages.add_child(newJamieMessage)
	$VBoxContainer2/Button.visible = true


func _on_Button_pressed():
	$VBoxContainer2/Button.visible = false
	if(GlobalVar.timelineDialogueNumber != 4):
		if(GlobalVar.jamieMessageShown == 0):
			changeButtonText(GlobalVar.jamieMessageShown)
			_duplicatePlayerMessage()
			newUserMessage.text = UM1
		elif(GlobalVar.jamieMessageShown == 2):
			changeButtonText(GlobalVar.jamieMessageShown)
			_duplicatePlayerMessage()
			newUserMessage.text = UM2
		elif(GlobalVar.jamieMessageShown == 4):
			changeButtonText(GlobalVar.jamieMessageShown)
			_duplicatePlayerMessage()
			newUserMessage.text = UM3
		elif(GlobalVar.jamieMessageShown == 6):
			changeButtonText(GlobalVar.jamieMessageShown)
			_duplicatePlayerMessage()
			newUserMessage.text = UM4
		GlobalVar.jamieMessageShown+=1


func _duplicatePlayerMessage():
		newUserMessage = $VBoxContainer2/ScrollContainer/SingleMessages/JMsg2.duplicate(1)
		$VBoxContainer2/ScrollContainer/SingleMessages.add_child(newUserMessage)


#function used to change the text present on the button after it is clicked
func changeButtonText(PlayerMessageCount):
	match (PlayerMessageCount):
		0:
			$VBoxContainer2/Button/Label.text = "Hello1"
		1:
			$VBoxContainer2/Button/Label.text = "Hello2"
		2:
			$VBoxContainer2/Button/Label.text = "Hello3"
		3:
			$VBoxContainer2/Button/Label.text = "Hello4"


func messengerNotification():
	$"../../../../../../MessengerNotif".visible = true
	$"../../Messages/Message1/MessengerNotif".visible = true
