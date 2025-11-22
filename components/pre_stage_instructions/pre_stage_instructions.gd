@tool
class_name PreStageInstructions extends VBoxContainer

const PROBLEM_TYPE_TO_ICON_MAP: Dictionary[BackBackProblem.Type, Texture] = {
	BackBackProblem.Type.ONE_BACK: preload("uid://carvowebnrhb6"),
	BackBackProblem.Type.TWO_BACK: preload("uid://bylaebqx3ikr5"),
	BackBackProblem.Type.THREE_BACK: preload("uid://bf1tdfc63x5hh"),
	BackBackProblem.Type.FOUR_BACK: preload("uid://lahxcpwh1cwn"),
	BackBackProblem.Type.GRAY_SCALE: preload("uid://c4hbonyny781e"),
}

const PROBLEM_TYPE_TO_TITLE_MAP: Dictionary[BackBackProblem.Type, String] = {
	BackBackProblem.Type.ONE_BACK: "This game will be 1-back",
	BackBackProblem.Type.TWO_BACK: "This game will be 2-back",
	BackBackProblem.Type.THREE_BACK: "This game will be 3-back",
	BackBackProblem.Type.FOUR_BACK: "This game will be 4-back",
	BackBackProblem.Type.GRAY_SCALE: "Get ready for greyscale!",
}

const PROBLEM_TYPE_TO_BODY_MAP: Dictionary[BackBackProblem.Type, String] = {
	BackBackProblem.Type.ONE_BACK: "Decide if the rock matches the one that came before it.",
	BackBackProblem.Type.TWO_BACK: "Decide if the rock matches the one from 2 steps earlier in the sequence.",
	BackBackProblem.Type.THREE_BACK: "Decide if the rock matches the one from 3 steps earlier in the sequence.",
	BackBackProblem.Type.FOUR_BACK: "Decide if the rock matches the one from 4 steps earlier in the sequence.",
	BackBackProblem.Type.GRAY_SCALE: "Colours are removed at this level. Focus on shapes instead.",
}

@onready var instructions_texture_rect: TextureRect = %InstructionsTextureRect
@onready var title_label: Label = %TitleLabel
@onready var body_label: Label = %BodyLabel

@export var problem_type: BackBackProblem.Type = BackBackProblem.Type.ONE_BACK :
	set(value):
		problem_type = value
		_update_elements()

func _update_elements() -> void:
	instructions_texture_rect.texture = PROBLEM_TYPE_TO_ICON_MAP[problem_type]
	title_label.text = PROBLEM_TYPE_TO_TITLE_MAP[problem_type]
	body_label.text = PROBLEM_TYPE_TO_BODY_MAP[problem_type]
