local MapLoader = {}

MapLoader.loadMapOne = function() end

MapLoader.loadMapTwo = function()
	game.ReplicatedStorage.Remotes.LoadingScreen:FireAllClients(10)
end

return MapLoader
