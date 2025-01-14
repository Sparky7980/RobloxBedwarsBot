-- AUTO resourceId [string] = game:GetService("MarketplaceService"):GetProductInfo(3285602).AssetId -- 3285602 is the resourceId for iron
-- AUTO collectSoundId [string] = "rbxassetid://6443571966" -- CHANGE TO YOUR OWN SOUND ID, OR LEAVE IT IF YOU DON'T WANT SOUND
-- AUTO waitTime [number] = 3 -- time to wait after picking up resource
-- AUTO attackRange [number] = 5 -- how close a player must be to you in order to attack them

function getPlayers()
    local players = {}
    for i,v in pairs(game.Players:GetPlayers()) do
        table.insert(players, v)
    end
    return players
end

function getClosestPlayerToMe()
    local closestPlayer = nil
    local closestDistance = math.huge
    for i,v in pairs(getPlayers()) do
        if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame - v.Character.HumanoidRootPart.CFrame).magnitude
            if distance < closestDistance then
                closestPlayer = v
                closestDistance = distance
            end
        end
    end
    return closestPlayer
end

local player = game.Players.LocalPlayer
local backpack = player.Backpack
local character = player.Character
local humanoid = character.Humanoid

while true do
    for i,v in pairs(getPlayers()) do
        if v.Character and v.Character:FindFirstChild("BedWarResourceCollector") then
            local iron = v.Character.BedWarResourceCollector:FindFirstChild("Iron")
            if iron then
                character.HumanoidRootPart.CFrame = iron.CFrame
                wait(waitTime)
                fireclickdetector(iron.ClickDetector)
                -- if collectSoundId ~= "" then
                --     playSound(collectSoundId)
                -- end
                break
            end
        end
    end

    local closestPlayer = getClosestPlayer
