@tool
class_name BackBackPreStage extends Control

@onready var pre_stage_instructions: PreStageInstructions = %PreStageInstructions
@onready var proceed_button: Button = %ProceedButton

@export var problem_type: BackBackProblem.Type = BackBackProblem.Type.ONE_BACK :
	set(value):
		problem_type = value
		pre_stage_instructions.problem_type = value

var tween: Tween
var button_origin: Vector2

func _ready() -> void:
	proceed_button.pressed.connect(_transit_to_stage)
	_register_origin.call_deferred()
	_translate_in.call_deferred()

func _translate_in() -> void:
	if tween != null: tween.kill()
	tween = create_tween()
	
	pre_stage_instructions.modulate.a = 0
	tween.tween_property(proceed_button, 'position', Vector2(proceed_button.position.x, get_viewport_rect().size.y), 0)
	
	tween.chain().tween_property(pre_stage_instructions, 'modulate', Color(1,1,1,1), .5).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	tween.parallel().tween_property(proceed_button, 'position', button_origin, .5).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)

func _translate_out(callback: Callable) -> void:
	if tween != null: tween.kill()
	tween = create_tween()
	
	pre_stage_instructions.modulate.a = 1
	tween.tween_property(proceed_button, 'position', button_origin, 0)
	
	tween.chain().tween_property(pre_stage_instructions, 'modulate', Color(1,1,1,0), .5).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	tween.parallel().tween_property(proceed_button, 'position', Vector2(button_origin.x, get_viewport_rect().size.y), .5).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	
	tween.tween_callback(callback)

func _transit_to_stage() -> void:
	_translate_out(func() -> void: print('finished!'))

func _register_origin() -> void:
	button_origin = proceed_button.position
