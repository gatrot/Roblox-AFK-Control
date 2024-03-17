local AFKAttributeStr = "AFKprotection"
local MAX_AFK_TIME = 60*15

--Connect to AFK protection (teleport a player once idled > max afk time)
function ConnectToAFK(payload: {player: Player})
    if payload.player == game.Players.LocalPlayer then
        local connection 
        connection = payload.player.Idled:Connect(function(time)
            if not (payload.player:GetAttribute(AFKAttributeStr) and time < MAX_AFK_TIME) then
                connection:Disconnect()
    
                if payload.player:GetAttribute(AFKAttributeStr) then
                    --ADD FIRE EVENT TELEPORT
                end
            end
        end)
    end
end

--Enable AFK protection for a specific player (distributed)
function EnableAFKProtecttion(payload: {player: Player})
    if payload.player == game.Players.LocalPlayer then
        payload.player:SetAttribute(AFKAttributeStr, true)
        ConnectToAFK(payload)
    end
end
--ADD EVENT LISTENER FOR ENABLE_AFK_PROTECTION

--Disable AFK protection for a specific player (distributed)
function DisableAFKprotectionForPlayer(payload: {player: Player})
    if payload.player == game.Players.LocalPlayer then
        payload.player:SetAttribute(AFKAttributeStr, false)
    end
end
--ADD EVENT LISTENER FOR DISABLE_AFK_PROTECTION,

return {}