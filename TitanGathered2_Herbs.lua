TITAN_ORES_ID = "Herbalism"
tghPluginDb = {}

TitanGathered2_Herbalism = {}
-- Reduce the chance of functions and variables colliding with another addon.
local tgh = TitanGathered2_Herbalism
local infoBoardData = {}
local tg = TitanGathered2
local gtt = GameTooltip

tgh.id = TITAN_ORES_ID
tgh.addon = "TitanGathered2_Herbs"
tgh.email = "bajtlamer@gmail.com"
tgh.www = "www.rrsoft.cz"

--  Get data from the TOC file.
tgh.version = tostring(GetAddOnMetadata(tgh.addon, "Version")) or "Unknown"
tgh.author = tostring(GetAddOnMetadata(tgh.addon, "Author")) or "Unknown"


for _, _category in pairs(TGH_PLUGIN_CATEGORIES) do
    table.insert(TG_CATEGORIES, _category)
end


function tgh.Button_OnLoad(self)
	echo(tgh.addon.." ("..TitanUtils_GetGreenText(tgh.version).."|cffff8020) loaded! Created By "..tgh.author)

	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("PLAYER_LEAVING_WORLD")
    self:RegisterEvent("LOOT_OPENED")
    tgh.registerPlugin()
    tgh.registerPluginMinable()
end

function tgh.registerPlugin()
    table.insert(tgPlugins, tgh)
end

function tgh.registerPluginMinable()
    for _, _m in pairs(TGH_MINABLES)do
        table.insert(TG_MINABLES, _m)
    end
end

-- Event
function tgh.Button_OnEvent(self, event)
    -- EMPTY
end

function tgh.getGatherableSourceObject(objectId)
    for _, _m in pairs(TGH_MINABLES) do
        if (_m.id == objectId) then
            return { id = _m.id, name = _m.name }
        end
    end
    return {id = objectId, name = nil}
end

