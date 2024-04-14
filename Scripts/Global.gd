extends Node

enum SummonedTier {
	EXECUTIVE = 0, 
	MANAGER = 1, 
	HR = 2, 
	NONE = -1,
}

var summoned_tier = SummonedTier.NONE
var productivity_bucks = 0


func add_productivity_bucks(amount):
	productivity_bucks += amount
