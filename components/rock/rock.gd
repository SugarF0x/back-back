@tool
class_name BackBackRock extends TextureRect

enum RockType {
	DEFAULT,
	CORRECT,
	WRONG
}

const TYPE_TO_TEXTURE_MAP: Dictionary[RockType, Texture] = {
	RockType.DEFAULT: preload("res://components/rock/assets/rocks/default.svg"),
	RockType.CORRECT: preload("res://components/rock/assets/rocks/correct.svg"),
	RockType.WRONG: preload("res://components/rock/assets/rocks/wrong.svg"),
}

const GRAYSCALE_MATERIAL = preload("uid://y7ut0534j58n")

var icon_texture_map: Dictionary[String, Texture] = {}

@onready var icon_texture_rect: TextureRect = %IconTextureRect

@export var type: RockType = RockType.DEFAULT :
	set(value):
		type = value
		_update_texture()

const MAX_ICON_INDEX = 9
@export_range(0, MAX_ICON_INDEX) var icon_index: int = 0 :
	set(value):
		icon_index = clampi(value, 0, MAX_ICON_INDEX)
		_update_icon()

const MAX_VARIANT_INDEX = 2
@export_range(0, MAX_VARIANT_INDEX) var icon_variant_index: int = 0 :
	set(value):
		icon_variant_index = clampi(value, 0, MAX_VARIANT_INDEX)
		_update_icon()

@export var is_grayscale: bool = false :
	set(value):
		is_grayscale = value
		_update_icon_filter()

func _ready() -> void:
	_preload_images()

func _preload_images() -> void:
	for i in range(0, MAX_ICON_INDEX + 1):
		for v in range(0, MAX_VARIANT_INDEX + 1):
			icon_texture_map["%d-%d" % [i, v]] = load(_get_item_path(i, v))

func _update_texture() -> void:
	texture = TYPE_TO_TEXTURE_MAP[type]

func _update_icon() -> void:
	icon_texture_rect.texture = icon_texture_map["%d-%d" % [icon_index, icon_variant_index]]

func _update_icon_filter() -> void:
	if is_grayscale: icon_texture_rect.material = GRAYSCALE_MATERIAL
	else: icon_texture_rect.material = null

func _get_item_path(icon: int, variant: int) -> String:
	return "res://components/rock/assets/shapes/Shape%d/%s.svg" % [clampi(icon, 0, MAX_ICON_INDEX) + 1, ["Default", "Dotted", "Striped"][clampi(variant, 0, MAX_VARIANT_INDEX)]]
