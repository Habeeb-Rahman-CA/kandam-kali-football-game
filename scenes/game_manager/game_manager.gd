extends Node

const DURATION_GAME := 1000 #2 * 60 * 1000

enum State {IN_PLAY, SCORED, RESET, KICKOFF, OVERTIME, GAMEOVER}

var clubs : Array[String] = ["EDATHODIKA FC", "REAL MADRID"]
var current_state : GameState = null
var state_factory := GameStateFactory.new()
var score := [0, 0]
var time_left: float

func _ready() -> void:
	time_left = DURATION_GAME
	switch_state(State.IN_PLAY)
	
func switch_state(state: State, data: GameStateData = GameStateData.new()) -> void:
	if current_state != null:
		current_state.queue_free()
	current_state = state_factory.get_fresh_state(state)
	current_state.setup(self, data)
	current_state.state_transition_requested.connect(switch_state.bind())
	current_state.name = "GameStateMachine " + str(state)
	call_deferred("add_child", current_state)
