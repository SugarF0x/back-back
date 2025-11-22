@tool
extends Control

@onready var progress_bar: ProgressBar = %ProgressBar
@onready var multiplier_label: Label = %MultiplierLabel
@onready var score_label: Label = %ScoreLabel
@onready var pause_button: Button = %PauseButton

@export var progress: float = .9 :
	set(value):
		progress = value
		progress_bar.value = value

@export var multiplier: int = 4 :
	set(value):
		multiplier = value
		multiplier_label.text = "x{value}".format({"value":value})

@export var score: int = 625 :
	set(value):
		score = value
		score_label.text = str(value)

signal pause_pressed

func _ready() -> void:
	_register_signals()

func _register_signals() -> void:
	if Engine.is_editor_hint(): return
	pause_button.pressed.connect(pause_pressed.emit)
