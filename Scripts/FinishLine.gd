extends Area

onready var Joey = get_node("/root/Game/Paths/Path4/PathFollow/JoeyGinger/")
onready var Ryan = get_node("/root/Game/P1/")
onready var TM1 = get_node("/root/Game/Paths/Path/PathFollow/Teammate1/")
onready var FastMurr = get_node("/root/Game/Paths/Path2/PathFollow/FastMurr/")
onready var TM3 = get_node("/root/Game/Paths/Path3/PathFollow/Teammate3/")
onready var RockyB = get_node("/root/Game/Paths/Path6/PathFollow/RockyB/")

onready var Clock1 = $FinishLabel

var milliseconds = 00
var seconds = 00
var minutes = 13

var Joey_Line_Crossed = false
var TM1_Line_Crossed = false
var FastMurr_Line_Crossed = false
var TM3_Line_Crossed = false
var Ryan_Line_Crossed = false
var Rocky_B_Crossed = false

func _on_Timer_timeout():
	milliseconds +=1
	if milliseconds > 9:
		seconds += 1
		milliseconds = 0
	if seconds > 59:
		minutes += 1
		seconds = 0
	#milliseconds +=1
	Clock1.time = (str(minutes)+":"+str(seconds)+"."+str(milliseconds))
	if seconds < 10:
		Clock1.time = (str(minutes)+":0"+str(seconds)+"."+str(milliseconds))


func _on_Area_body_entered(body):

	
	

	if overlaps_body(Joey) and Joey_Line_Crossed == false:
		get_node("/root/Game/Area2/ItemList/").add_item("Joey Ginger")
		get_node("/root/Game/Area2/ItemList/").add_item(Clock1.time) 
		Joey_Line_Crossed = true
	if overlaps_body(TM1) and TM1_Line_Crossed == false:
		get_node("/root/Game/Area2/ItemList/").add_item("Tim Myers")
		get_node("/root/Game/Area2/ItemList/").add_item(Clock1.time) 
		TM1_Line_Crossed = true
	if overlaps_body(FastMurr) and FastMurr_Line_Crossed == false:
		get_node("/root/Game/Area2/ItemList/").add_item("Michael Murray")
		get_node("/root/Game/Area2/ItemList/").add_item(Clock1.time) 
		FastMurr_Line_Crossed = true
	if overlaps_body(TM3) and TM3_Line_Crossed == false:
		get_node("/root/Game/Area2/ItemList/").add_item("Anthony Manfrin")
		get_node("/root/Game/Area2/ItemList/").add_item(Clock1.time) 
		TM3_Line_Crossed = true
	if overlaps_body(RockyB) and Rocky_B_Crossed == false:
		get_node("/root/Game/Area2/ItemList/").add_item("Rocky B.")
		get_node("/root/Game/Area2/ItemList/").add_item(Clock1.time) 
		Rocky_B_Crossed = true
	if overlaps_body(Ryan) and Ryan_Line_Crossed == false:
		get_node("/root/Game/Area2/ItemList/").add_item("Ryan Craven") 
		get_node("/root/Game/Area2/ItemList/").add_item(Clock1.time) 
		get_node("/root/Game/Area2/ItemList/").visible = true
		Ryan_Line_Crossed = true
	
		





	













	



	



	
