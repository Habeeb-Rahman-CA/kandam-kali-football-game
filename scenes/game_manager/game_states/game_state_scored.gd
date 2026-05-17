class_name GameStateScored
extends GameState

const DURATION_CELEBRATION := 100

var time_since_celebration := Time.get_ticks_msec() 

func _enter_tree() -> void:
	var index_club_scoring := 1 if state_data.club_scored_on == manager.clubs[0] else 0
	manager.score[index_club_scoring] += 1
	time_since_celebration = Time.get_ticks_msec()

func _process(_delta: float) -> void:
	if Time.get_ticks_msec() - time_since_celebration > DURATION_CELEBRATION:
		transition_state(GameManager.State.RESET, state_data)
