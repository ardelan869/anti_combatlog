AddEventHandler('playerDropped', function(reason)
  local s = source;
  local coords = GetEntityCoords(GetPlayerPed(s));
  local name = GetPlayerName(s);
  TriggerClientEvent('OnPlayerDropped', -1, {
    coords = coords,
    msg = Config.Msg:format(name, s, reason)
  });
end)