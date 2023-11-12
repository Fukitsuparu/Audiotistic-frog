extends Control

@export_category("Dialog_Image")
@export var profile:ProfileIMG
@export var speed:int
@export_category("Dialog_Text")
@export var text:String
@export var character_seconds:float

var shownText:String
var i:int
var ticks:float
var anim:String
var talking:bool

# Called when the node enters the scene tree for the first time.
func _ready():
	shownText = ""
	i = -1
	ticks = 0
	talking = true
	$profileAnimated.sprite_frames = profile.talking
	$profileStatic.texture = profile.still
	$profileStatic.scale = (Vector2(1.0,1.0) / $profileStatic.texture.get_size()) * 128
	anim = $profileAnimated.sprite_frames.get_animation_names()[0]
	$profileAnimated.sprite_frames.set_animation_speed(anim, speed)
	$profileAnimated.play(anim)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if talking:
		$profileAnimated.scale = (Vector2(1.0,1.0) / $profileAnimated.sprite_frames.get_frame_texture(anim, ($profileAnimated.frame)%$profileAnimated.sprite_frames.get_frame_count(anim)).get_size()) * 128
		ticks += delta
		if ticks > character_seconds:
			var diff:int = floor(ticks/character_seconds)
			ticks -= character_seconds*diff
			for j in diff:
				i += 1
				if i < text.length():
					shownText += text[i]
				else:
					$profileStatic.show()
					$profileAnimated.hide()
					talking = false
			$text.text = shownText
