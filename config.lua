Config = {
  Msg = 'Player %s left the Server.\nID: %s\nReason: %s', -- PlayerName, ID, Reason
  Distance = 30.0,
  Marker = {
    Enable = true, -- if a marker should be drawn when the player drops
    Time = 15000, -- in msec | 1000 = 1 sec
    MarkerType = 32, -- this is a question marker rn | https://docs.fivem.net/docs/game-references/markers/
    Scale = vector3(0.8, 0.8, 0.8), -- x, y, z
    Offset = vector3(0.0, 0.0, 0.4),
    Color = {
      R = 255,
      G = 255,
      B = 255,
      A = 255
    },
    Text3D = {
      Enable = true,
      Distance = 5.0,
      Color = {
        R = 255,
        G = 255,
        B = 255,
        A = 255
      },
    }
  }
}

if not IsDuplicityVersion() then
  Notify = function(msg)
    -- Took this from ESX https://github.com/esx-framework/esx-legacy
    AddTextEntry('NOTIFY', msg);
    BeginTextCommandThefeedPost('NOTIFY');
    EndTextCommandThefeedPostTicker(false);
  end

  DrawText3D = function(coords, msg)
    -- Took this from somewhere, idk
    SetDrawOrigin(coords.x, coords.y, coords.z, 0);
    SetTextFont(0);
    SetTextProportional(0);
    SetTextScale(0, 0.3);
    SetTextColour(
      Config.Marker.Text3D.Color.R,
      Config.Marker.Text3D.Color.G,
      Config.Marker.Text3D.Color.B,
      Config.Marker.Text3D.Color.A
    );
    SetTextDropshadow(0, 0, 0, 0, 255);
    SetTextEdge(2, 0, 0, 0, 150);
    SetTextDropShadow();
    SetTextOutline();
    SetTextEntry('STRING');
    SetTextCentre(1);
    AddTextComponentString(msg);
    DrawText(0, 0);
    ClearDrawOrigin();
  end
end