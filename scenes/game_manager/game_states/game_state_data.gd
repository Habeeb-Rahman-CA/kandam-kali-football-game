class_name GameStateData

var club_scored_on : String

static func build() -> GameStateData:
	return GameStateData.new()
	
func set_club_scored_on(club: String) -> GameStateData:
	club_scored_on = club
	return self
