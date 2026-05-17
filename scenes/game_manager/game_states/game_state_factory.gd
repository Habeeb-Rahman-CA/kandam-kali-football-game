class_name GameStateFactory

var states : Dictionary

func _init() -> void:
	states = {
		GameManager.State.IN_PLAY : GameStateInPlay,
		GameManager.State.OVERTIME : GameStateOvertime,
		GameManager.State.GAMEOVER : GameStateGameOver,
		GameManager.State.RESET : GameStateReset,
		GameManager.State.SCORED : GameStateScored,
		GameManager.State.KICKOFF : GameStateKickoff
	}
	
func get_fresh_state(state: GameManager.State) -> GameState:
	assert(states.has(state), "state does not exist")
	return states.get(state).new()
