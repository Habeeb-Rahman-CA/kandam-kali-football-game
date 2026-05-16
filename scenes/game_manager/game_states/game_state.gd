class_name GameState
extends Node

signal state_transition_requested(new_state: GameManager.State, state_data: GameStateData)

var manager : GameManager = null
var state_data : GameStateData = null

func setup(context_manager : GameManager, context_state_data: GameStateData) -> void:
	manager = context_manager
	state_data = context_state_data 
	
func transition_state(new_state: GameManager.State, data: GameStateData = GameStateData.new()) -> void:
	state_transition_requested.emit(new_state, data)
