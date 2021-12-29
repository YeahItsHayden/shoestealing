function stealShoes(ent)
    stealShoesEmote()
    SetPedComponentVariation(ent, 6, 34, 0, 0)
end

function getPedPlayerIsLookingAt()
	local plyPos = GetEntityCoords(PlayerPedId())
	local plyOffset = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.3, 0.0)
	local rH = StartShapeTestCapsule(plyPos.x, plyPos.y, plyPos.z, plyOffset.x, plyOffset.y, plyOffset.z, 1.0, 12, PlayerPedId(), 7)
	local _, _, _, _, ent = GetShapeTestResult(rH)
	return ent
end

function stealShoesEmote()
	local Ped = PlayerPedId()
    local dict = "random@domestic"

    RequestAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do Wait(0) end
	TaskPlayAnim(Ped, dict, "pickup_low", 3.0, 3.0, 1200, 0, 0, false, false, false)
end

RegisterCommand("stealshoes", function()
    local player = getPedPlayerIsLookingAt()
    local ply = PlayerPedId()

    if IsPedAPlayer(player) then
       stealShoes(player)
    end
end, false)
