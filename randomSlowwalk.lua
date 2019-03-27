-- made by prost
miscRef = gui.Reference("MISC", "AUTOMATION", "xd");
min = gui.Slider(miscRef, "min", "Min Speed %", 0, 0, 100);
max = gui.Slider(miscRef, "min", "Max Speed %", 0, 0, 100);
function randomSlowwalk()
local entity = entities.GetLocalPlayer();

if entity ~= nil then
   local alive = entity:IsAlive();
   local health = entity:GetHealth();
   if (alive == true and health > 0 and min.GetValue() < max.GetValue()) then
     local minSpeed = math.floor(min.GetValue());
     local maxSpeed = math.floor(max.GetValue());

     gui.SetValue("misc_automation_slowwalk", math.random(minSpeed, maxSpeed));
     

   end
end
end
callbacks.Register('Draw', 'randomSlowwalk', randomSlowwalk)
