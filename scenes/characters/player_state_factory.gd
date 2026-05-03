class_name PlayerStateFactory

var states : Dictionary

func _init() -> void:
	states = {
		Player.State.MOVING: PlayerStateMoving,
		Player.State.PREPPING_SHOT: PlayerStatePreppingShot,
		Player.State.SHOOTING: PlayerStateShooting, 
		Player.State.TACKLING: PlayerStateTackling,
		Player.State.RECOVERING: PlayerStateRecovering,
		Player.State.PASSING: PlayerStatePassing,
		Player.State.HEADER: PlayerStateHeader,
		Player.State.VOLLEY_KICK: PlayerStateVolleyKick,
		Player.State.BICYCLE_KICK: PlayerStateBicycleKick,
		Player.State.CHEST_CONTROL: PlayerStateChestControl,
		Player.State.HURT: PlayerStateHurt,
		Player.State.DIVING: PlayerStateDiving
	}
	
func get_fresh_state(state: Player.State) -> PlayerState:
	assert(states.has(state), "state doesn't exists")
	return states.get(state).new()
