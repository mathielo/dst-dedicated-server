--There are two functions that will install mods, ServerModSetup and ServerModCollectionSetup. Put the calls to the functions in this file and they will be executed on boot.

--ServerModSetup takes a string of a specific mod's Workshop id. It will download and install the mod to your mod directory on boot.
	--The Workshop id can be found at the end of the url to the mod's Workshop page.
	--Example: http://steamcommunity.com/sharedfiles/filedetails/?id=350811795
	--ServerModSetup("350811795")

--ServerModCollectionSetup takes a string of a specific mod's Workshop id. It will download all the mods in the collection and install them to the mod directory on boot.
	--The Workshop id can be found at the end of the url to the collection's Workshop page.
	--Example: http://steamcommunity.com/sharedfiles/filedetails/?id=379114180
	--ServerModCollectionSetup("379114180")

-- Wormhole Marks
-- https://steamcommunity.com/sharedfiles/filedetails/?id=362175979
ServerModSetup("362175979")

-- Extra Equip Slots
-- https://steamcommunity.com/sharedfiles/filedetails/?id=375850593
ServerModSetup("375850593")

-- Health Info
-- https://steamcommunity.com/sharedfiles/filedetails/?id=375859599
ServerModSetup("375859599")

-- Global Positions
-- https://steamcommunity.com/sharedfiles/filedetails/?id=378160973
ServerModSetup("378160973")

-- Food Values - Item Tooltips (Server and Client)
-- https://steamcommunity.com/sharedfiles/filedetails/?id=458940297
ServerModSetup("458940297")

-- Quick Pick
-- https://steamcommunity.com/sharedfiles/filedetails/?id=501385076
ServerModSetup("501385076")

-- Auto Tooth Trap Reset
-- https://steamcommunity.com/sharedfiles/filedetails/?id=588560555
ServerModSetup("588560555")

-- Epic Healthbar
-- https://steamcommunity.com/sharedfiles/filedetails/?id=1185229307
ServerModSetup("1185229307")
