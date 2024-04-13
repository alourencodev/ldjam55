extends Node

enum SummonedTier {
	EXECUTIVE = 2, 
	MANAGER = 1, 
	HR = 0, 
	NONE = -1,
}

var summoned_tier = SummonedTier.NONE