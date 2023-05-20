extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal start_game

# Called when the node enters the scene tree for the first time.


func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func show_game_over():
	show_message("Game Over")
	# Wait until the MessageTimer has counted down.
	await $MessageTimer.timeout

	$MessageLabel.text = "Dodge the\nCreeps!"
	$MessageLabel.show()
	# Make a one-shot timer and wait for it to finish.
	await get_tree().create_timer(1).timeout
	$StartButton.show()

func update_score(score):
	$ScoreLabel.text = str(score)
	

func _on_StartButton_pressed():
	$StartButton.hide()
	start_game.emit()
	print(start_game)

func _on_MessageTimer_timeout():
	$MessageLabel.hide()



