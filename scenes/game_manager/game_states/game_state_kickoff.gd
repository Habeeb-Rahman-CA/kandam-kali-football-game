class_name GameStateKickoff
extends GameState

var valid_control_schemes := []

func _enter_tree() -> void:
	var club_starting := state_data.club_scored_on
	if club_starting.is_empty():
		club_starting == manager.clubs[0]
	if club_starting == manager.player_setup[0]:
		valid_control_schemes.append(Player.ControlScheme.P1)
	if club_starting == manager.player_setup[1]:
		valid_control_schemes.append(Player.ControlScheme.P2)
	if valid_control_schemes.size() == 0:
		valid_control_schemes.append(Player.ControlScheme.P1)

func _process(_delta: float) -> void:
	for control_scheme : Player.ControlScheme in valid_control_schemes:
		if KeyUtils.is_action_just_pressed(control_scheme, KeyUtils.Action.PASS):
			GameEvents.kickoff_started.emit()
			transition_state(GameManager.State.IN_PLAY)
