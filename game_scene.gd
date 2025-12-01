extends PanelContainer

const PRE_STAGE = preload("uid://0dov1wg01s5t")
const GAME_STAGE = preload("uid://45yo6tmju7d0")

var pre_stage_child: BackBackPreStage

func _ready() -> void:
	pre_stage_child = PRE_STAGE.instantiate()
	add_child(pre_stage_child)
	
	pre_stage_child.translated_out.connect(_start_session)

func _start_session() -> void:
	pre_stage_child.queue_free()
	add_child(GAME_STAGE.instantiate())
