extends Node

enum SummonedTier {
	EXECUTIVE = 0, 
	MANAGER = 1, 
	HR = 2, 
	NONE = -1,
}

var summoned_tier = SummonedTier.NONE
var productivity_bucks = 0
var player : CharacterBody2D = null


func add_productivity_bucks(amount):
	assert(amount >= 0)
	productivity_bucks += amount

func spend_productivity_bucks(amount):
	assert(amount >= 0)
	print("Spending ", amount, " PB$")
	productivity_bucks -= amount