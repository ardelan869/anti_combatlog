RegisterNetEvent('OnPlayerDropped', function(data)
  local ped = PlayerPedId();
  local coords = GetEntityCoords(ped);
  local dist = #(coords - data.coords);
  if dist <= Config.Distance then
    Notify(data.msg);
    if Config.Marker.Enable then
      local draw = true;
      CreateThread(function()
        while Config.Marker.Enable and draw do
          local sleep = 1000;
          local coords = GetEntityCoords(ped);
          local dist = #(coords - data.coords);
          if dist <= Config.Distance then
            sleep = 0;
            DrawMarker(
              Config.Marker.MarkerType,
              data.coords+Config.Marker.Offset,
              0, 0, 0, 0, 0, 0,
              Config.Marker.Scale,
              Config.Marker.Color.R,
              Config.Marker.Color.G,
              Config.Marker.Color.B,
              Config.Marker.Color.A,
              0, 1
            );
            if Config.Marker.Text3D.Enable then
              if dist <= Config.Marker.Text3D.Distance then
                DrawText3D(data.coords, data.msg);
              end
            end
          end
          Wait(sleep);
        end
      end)
      Wait(Config.Marker.Time);
      draw = false;
    end
  end
end)