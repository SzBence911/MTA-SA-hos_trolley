--[[ 
    
A scriptben feltételezem, hogy később lehet használni a már kész scripteket 
így nem hozok létre saját kezelőfelületet neki, az e betüre írt spawnolás a tesztelés miatt kell
    
--]]

spawnHos = false

local opened = {0,0}

function outputPressedCharacter(character)
    if character == "e" and spawnHos == true then
        outputChatBox("Trigered")
        triggerServerEvent("spawnHos", resourceRoot)
    end
    if character == "q" then
        triggerServerEvent ( "detachHos", resourceRoot)
    end
end

function attachOnHit(player)
    if getElementType(player)=="player" then
        triggerServerEvent ( "onHosTriggered", resourceRoot)
    end
end

function spawnAmb ()
    local x, y, z = getElementPosition ( localPlayer )
    vehicle = createVehicle ( 416, x + 3, y, z)
end

addCommandHandler ( "open", function ()
    if vehicle then
        outputChatBox("Openup")
        for i=4,5 do
            opened[i - 3] = 1
            outputChatBox(opened[i - 3])
            setVehicleDoorOpenRatio( vehicle, i, 1, 20 )
        end
        outputChatBox(outputChatBox[1] .. outputChatBox[2])
	end
end )

function updateCamera ()
    if vehicle then
	    local x, y, z = getElementPosition ( localPlayer )
        local vx, vy, vz = getElementPosition ( vehicle )
        if opened[1] == 1 and opened[2] == 1 and spawnHos == false and (getDistanceBetweenPoints3D ( x, y, z, vx,vy, vz )) < 6 then
            spawnHos = true
        end
        if (getDistanceBetweenPoints3D ( x, y, z, vx,vy, vz )) > 6 or opened[1] == 0 or opened[2] == 0 then
            spawnHos = false
        end
    end
end




 addEventHandler ( "onClientRender", root, updateCamera )
addCommandHandler ( "amb", spawnAmb )
addEventHandler("onClientMarkerHit", getRootElement(), attachOnHit)
addEventHandler("onClientClick", getRootElement(), addLabelOnClick )
addEventHandler("onClientCharacter", getRootElement(), outputPressedCharacter)