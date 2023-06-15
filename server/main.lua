local VORPInv = {}
VORPInv = exports.vorp_inventory:vorp_inventoryApi()
local VORPcore = {}
TriggerEvent("getCore", function(core)
  VORPcore = core
end)

RegisterServerEvent('samet:kisiseldepo', function(charid)
    VORPInv.registerInventory('Player_' .. charid .. '_samet-inv', Config.Language.InventoryName, Config.InventoryLimit)
  end)

RegisterServerEvent('samet:kisiselenvanter', function()
    local _source = source
    local Character = VORPcore.getUser(_source).getUsedCharacter
    VORPInv.OpenInv(_source, 'Player_' .. Character.charIdentifier.. '_samet-inv')
  end)

