local ReplicatedStorage = game:GetService("ReplicatedStorage")
-- using wally package
--local GameAnalytics = require(ReplicatedStorage.Packages.GameAnalytics)
-- using rojo or manually copied in
local GameAnalytics = require(ReplicatedStorage.GameAnalytics)

GameAnalytics:setEnabledInfoLog(true)
GameAnalytics:setEnabledVerboseLog(true)

GameAnalytics:initServer("295fb0b9a5d7e97e133106038968f678", "64ba33e1a20eb2a989daba50504b03d341e8a9de")
