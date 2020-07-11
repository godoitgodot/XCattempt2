extends Label



var milliseconds = 00
var seconds = 00
var minutes = 00

var time = (str(minutes)+":"+str(seconds)+"."+str(milliseconds))



#Had this in but doesn't seem necessary here after I hashtagged it out
#func _process(delta):
#	visible = false
#	if milliseconds > 9:
#		seconds += 01
#		milliseconds = 0
#	if seconds > 59:
#		minutes += 1
#		seconds = 00

#	set_text(str(minutes)+":"+str(seconds)+"."+str(milliseconds))
	

	#if seconds < 10:
		#set_text(str(minutes)+":0"+str(seconds)+"."+str(milliseconds))
func _on_Timer_timeout():
	milliseconds +=1