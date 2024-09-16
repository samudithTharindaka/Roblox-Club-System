local partyFolder = game.ReplicatedStorage:WaitForChild("Parties")
local tps = game:GetService("TeleportService")
local placeId = 139713018675339

local Party = {}
Party.__index = Party


function Party.new(numberOfPlayers,partyName,plr)
    local self = setmetatable({}, Party)
    self.numberOfPlayers = numberOfPlayers
    self.name = partyName
    self.description = "a party"
    self.plr = plr
    self.partyFile = self:setUp()
    return self
end

function Party:makeAparty()
    
    print("Party created")
    self:start()
end

function Party:setUp()
   
    local newParty = Instance.new("Folder",partyFolder)
    newParty.Name = self.name
    
    local players = Instance.new("Folder", newParty)
    players.Name = "Players"
    
    local partyLeader = Instance.new("StringValue", players)
    partyLeader.Name = "Party Leader"
    partyLeader.Value = self.plr.Name
    
    local limit = Instance.new("IntValue", newParty)
    limit.Name = "PlayerLimit"
    limit.Value = tonumber(self.numberOfPlayers) or 10

    return newParty
end

function Party:start()
    local playersToTp= {}

    for i,v in pairs(self.partyFile.Players:GetChildren()) do
        table.insert(playersToTp,game.Players[v.Value])
    end

    local tpOptions = Instance.new("TeleportOptions")
			tpOptions.ShouldReserveServer = true
			
	
    local code = tps:ReserveServer(placeId)
    print(code)
end

return Party