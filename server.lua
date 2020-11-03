-- Ez a függvény lerakja a hos_trolley modellt
function spawnHos() 
    x,y,z = getElementPosition(client)     -- A funkciót meghívó kliens koordinátái
    xr,yr,zr = getElementRotation(client)   -- A funkciót meghívó kliens fokokban értelmezhető elfordulásai
    hos_trolley = createObject(1997, x + 1, y, z - 1, 0,0,0)     --hos_trolley objektum spawnolása
    hosControlMarker(x + 1,y,z - 1)     --Meghívjuk a hosControlMarker függvény
end 

-- Ez a függvény létrehozza a markert a hos_trolley-hoz
function hosControlMarker ( x,y,z)
    if ( x ) then -- Ha x koordinátám nem nil akkor
        theMarker = createMarker ( x , y - 1.6, z, "cylinder", 1, 255, 255, 0, 100 ) -- Létrehozom a Markert a hos_trolley elé
    end
end

function onHosTriggered()
    attachElements(hos_trolley, client , 0,2,-1)    -- Hozzáköti a hos_trolley elementhez a playert aki a markerbe lép
    destroyElement(theMarker) -- Eltünteti a markert
end

-- Ez a függvény szünteti meg az összekötést a player és a hos_trolley között
function detachHos()
    if ( isElementAttached( hos_trolley ) ) then -- Ha hozzá van kötve a player a hos_trolley-hoz akkor
        detachElements ( hos_trolley ) -- Szétkapcsolja a hos_trolley-t a playertől
        x,y,z = getElementPosition(hos_trolley) -- lekérdezi a hos_trolley pozícióit
        hosControlMarker(x,y,z) -- Létrehozza az új markert
    end
end  

addEvent( "detachHos", true )
addEventHandler( "detachHos", resourceRoot, detachHos) 
addEvent( "onHosTriggered", true )
addEventHandler( "onHosTriggered", resourceRoot, onHosTriggered) 
addEvent( "spawnHos", true )
addEventHandler( "spawnHos", resourceRoot, spawnHos ) 