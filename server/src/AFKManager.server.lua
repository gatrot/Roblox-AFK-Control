--Teleport a player to the game to avoid auto-kick
function TeleportBackToServer(payload: {player: Player})
    local teleportOptions = Instance.new("TeleportOptions")
	teleportOptions.ShouldReserveServer = true
	teleportOptions:SetTeleportData({
		ReturnPlaceId = game.PlaceId,
		CharacterCFrames = payload.player.Character.PrimaryPart.CFrame or nil
	})

	for i=1, 3 do
        local success, err = pcall(function()
            return game:GetService("TeleportService"):TeleportAsync(game.PlaceId, {payload.player}, teleportOptions)
        end)

        if not success then
            warn(err)
            task.wait(0.5)
        else
            break
        end
    end
end
--ADD HERE EVENT LISTENER FOR TELEPORT EVENT

--Auto enable AFK protection for all players (server only)
function EnableAutoAFKprotection()
    game.Players.PlayerAdded:Connect(
        function(player)
            task.wait(60)
            --ADD FIRE EVENT HERE FOR ENABLE_AFK_PROTECTION
        end)

    for _, player in pairs(game.Players:GetPlayers()) do
        task.wait(60)
        --ADD FIR EVENT HERE FOR ENABLE_AFK_PROTECTION
    end
end
--ADD HERE EVENT LISTENER FOR AUTO_ENABLE_PROTECTION