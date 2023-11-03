extends Control

signal opened
signal closed

var isOpen: bool = false


func open():
	visible = true
	isOpen = true
	opened.exit()

func close():
	visible = false
	isOpen = false
	closed.exit()

func _on_closed():
	pass # Replace with function body.


func _on_opened():
	pass # Replace with function body.
