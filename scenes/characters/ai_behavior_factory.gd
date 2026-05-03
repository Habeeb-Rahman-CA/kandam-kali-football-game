class_name AIBehaviorFactory

var roles : Dictionary

func _init() -> void:
	roles = {
		Player.Role.GOALIE: AIBehaviourGoalie,
		Player.Role.DEFENCE: AIBehaviorField,
		Player.Role.MIDFIELD: AIBehaviorField,
		Player.Role.OFFENCE: AIBehaviorField
	}
	
func get_ai_behavior(role: Player.Role) -> AIBehavior:
	assert(roles.has(role), "role doesn't exists!")
	return roles.get(role).new()
