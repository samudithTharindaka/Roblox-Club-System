local replicatorStorage = game:GetService("ReplicatedStorage")
local party =require(script.Parent.party)

local createParty = Instance.new("RemoteEvent")
createParty.Name = "createParty"
createParty.Parent = replicatorStorage


createParty.OnServerEvent:Connect(function(player,partyName,playerNumber)
    local newParty = party.new(playerNumber,partyName,player)
    newParty:makeAparty()
end)