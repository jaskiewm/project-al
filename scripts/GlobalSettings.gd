extends Node

#Global settings page to keep data saved

var timelineDialogueNumber
var soundVolume
var musicVolume

#gameEndCondition is used for checking conditions so the game ends
var gameEndCondition = false

var jamieMessageShown = 0 #Includes Jamie and Player messages. Jamie = 1, Player = 2, Jamie = 3, etc.

var emailRead = false
var email2Read = false
var email3Read = false
var emailEnd1Read = false
var emailEnd2Read = false

func _ready():
	pass
