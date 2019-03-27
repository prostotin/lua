--code by prost
localPlayer = entities.getLocalPlayer();
-- cl_hud_color values
--   0: Default
--   1: White
--   2: Light Blue
--   3: Blue
--   4: Purple
--   5: Red
--   6: Orange
--   7: Yellow
--   8: Green
--   9: Aqua
--   10: Pink
function healthHud()
  if(entity ~= nil) then
  health = localPlayer.GetHealth();
  if(health > 99) then
  client.Command("cl_hud_color 8") --   8: Green

elseif(health > 69) then --69 makes your resolver better
  client.Command("cl_hud_color 7") --   7: Yellow

elseif(health > 49) then
  client.Command("cl_hud_color 6") --   6: Orange
else
  client.Command("cl_hud_color 5") --   5: Red
end
end
end

callbacks.Register( "Draw", "healthHud", healthHud);
