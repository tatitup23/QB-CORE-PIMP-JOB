local QBCore = exports['qb-core']:GetCoreObject()

-- List of female ped models commonly used as hookers in GTA V
local hookerModels = {
    "s_f_y_hooker_01",
    "s_f_y_hooker_02",
    "s_f_y_hooker_03"
}

-- Command to spawn a hooker at your location
RegisterCommand('spawnhooker', function(source, args, rawCommand)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    local modelName = hookerModels[math.random(#hookerModels)]

    RequestModel(modelName)
    while not HasModelLoaded(modelName) do
        Wait(100)
    end

    local hookerPed = CreatePed(4, modelName, pos.x + 2.0, pos.y, pos.z, heading, true, false)

    -- Optionally, you can make the hooker wander, stand still, etc.
    TaskWanderStandard(hookerPed, 10.0, 10)
    SetPedAsNoLongerNeeded(hookerPed)
end, false)