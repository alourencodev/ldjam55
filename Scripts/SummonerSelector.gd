extends ItemList


func _on_item_selected(index):
	assert(index >= 0)
	var globals = get_node("/root/Global")
	globals.summoned_tier = index
