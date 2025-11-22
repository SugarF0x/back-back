extends Node

const SCALE_FACTOR: float = .9

@onready var button: Button = get_parent()

var tween: Tween

func _ready() -> void:	
	button.button_down.connect(_on_down)
	button.button_up.connect(_on_up)
	button.pivot_offset = button.size / 2

func _on_down() -> void:
	if button.disabled: return
	if tween != null: tween.kill()
	tween = create_tween()
	tween.tween_property(button, "scale", Vector2(SCALE_FACTOR, SCALE_FACTOR), .08).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)

func _on_up() -> void:
	if button.disabled: return
	if tween != null: tween.kill()
	tween = create_tween()
	tween.tween_property(button, "scale", Vector2(1, 1), 0.1).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
