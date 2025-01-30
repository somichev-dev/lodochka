extends Node

func save(data: PlayerDataClass) -> void:
	var config = ConfigFile.new()
	
	config.set_value("Player", "highscore", data.highscore)
	config.set_value("Player", "coins", data.coins)
	
	config.save("user://data.rd")

func load() -> PlayerDataClass:
	var config = ConfigFile.new()
	var err = config.load("user://data.rd")
	var result = PlayerDataClass.new()
	
	if err != OK:
		return result
	
	var hscore = config.get_value("Player", "highscore", 0)
	var coins = config.get_value("Player", "coins", 0)
	result.coins = coins
	result.highscore = hscore
	
	return result
