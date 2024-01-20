--[[DensityMultiplier = 0
Citizen.CreateThread(function()
	SetAudioFlag('PoliceScannerDisabled', true)
	for i = 1, 12 do
		EnableDispatchService(i, false)
	end
	while true do
	    Citizen.Wait(0)
	    SetVehicleDensityMultiplierThisFrame(DensityMultiplier)
	    SetPedDensityMultiplierThisFrame(DensityMultiplier)
	    SetRandomVehicleDensityMultiplierThisFrame(DensityMultiplier)
	    SetParkedVehicleDensityMultiplierThisFrame(DensityMultiplier)
	    SetScenarioPedDensityMultiplierThisFrame(DensityMultiplier, DensityMultiplier)

	end
end)

Citizen.CreateThread(function()
	SetGarbageTrucks(false) -- Stop garbage trucks from randomly spawning
	SetRandomBoats(false) -- Stop random boats from spawning in the water.
	SetCreateRandomCops(false) -- disable random cops walking/driving around.
	SetCreateRandomCopsNotOnScenarios(false) -- stop random cops (not in a scenario) from spawning.
	SetCreateRandomCopsOnScenarios(false) -- stop random cops (in a scenario) from spawning.
	while true do
		Citizen.Wait(25) -- prevent crashing

		
		local x,y,z = table.unpack(playerCoords)
		ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
		RemoveVehiclesFromGeneratorsInArea(x - 500.0, y - 500.0, z - 500.0, x + 500.0, y + 500.0, z + 500.0);
		
	end
end)



AddEventHandler("entityCreating", function (entity)
    if DoesEntityExist(entity) then
        local _src  = NetworkGetEntityOwner(entity) 
        if _src ~= nil then
            local model = GetEntityModel(entity)   
            if  model ==  `bf400` then
                return
            end
            --local eType = GetEntityPopulationType(entity)     
            DeleteEntity(entity)
            CancelEvent() 
        end
    end
end)--]]


ConfigRoutingBuckets = {}

ConfigRoutingBuckets.RoutingBuckets = {
    "0",
    "1",
    "352515",
    "352513245",
    "1412412412677658534",
    "141241",
    "2525230",
    "252523",
    "34567",
    "121313",
    "1241241212465678",
    "14124214",
    "49819",
    "98148",
    "49830",
    "49819",
    "9814",
    "5251",
    "42342",
    "42343",
    "12412412",
}

CreateThread(function()
    for i = 1, #ConfigRoutingBuckets.RoutingBuckets, 1 do
        SetRoutingBucketPopulationEnabled(tonumber(ConfigRoutingBuckets.RoutingBuckets[i]), false)
    end
end)