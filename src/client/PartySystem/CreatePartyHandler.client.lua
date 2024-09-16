local player = game.Players.LocalPlayer
local screenGui = player.PlayerGui:WaitForChild("PartySystemUI")
local createPartyButton = screenGui:WaitForChild("CreateParty"):WaitForChild("createBtn")
local PartyName = screenGui:WaitForChild("CreateParty"):WaitForChild("partyName")
local PlayerNumber = screenGui:WaitForChild("CreateParty"):WaitForChild("maxPlayerNumber")
local createPartyEvent = game.ReplicatedStorage:WaitForChild("createParty")

createPartyButton.MouseButton1Click:Connect(function()
    local partyName = PartyName.Text
    local playerNumber = PlayerNumber.Text
    createPartyEvent:FireServer(playerNumber,partyName)
end)