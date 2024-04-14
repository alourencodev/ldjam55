extends ItemList

@export var tiers : Array[Tier]

@onready var global = get_node("/root/Global")

func _ready():
	for tier in tiers:
		var item_label = tier.label + "       " + str(tier.price) + " PB$"
		var selectable = tier.price <= global.productivity_bucks
		add_item(item_label, tier.icon, selectable)

func _on_item_selected(index):
	assert(index >= 0)
	global.summoned_tier = index


func _on_item_accepted():
	var tier = tiers[global.summoned_tier]
	global.spend_productivity_bucks(tier.price)
