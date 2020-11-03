--[[ A scriptben feltételezem, hogy később lehet használni a már kész scripteket így nem hozok létre saját kezelőfelületet neki --]]

function outputPressedCharacter(character)
    if character == "e" then
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

addEventHandler("onClientMarkerHit", getRootElement(), attachOnHit)
addEventHandler("onClientClick", getRootElement(), addLabelOnClick )
addEventHandler("onClientCharacter", getRootElement(), outputPressedCharacter)