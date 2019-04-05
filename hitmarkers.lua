damageDone = 0; --dont touch
enemy = nil; --dont touch
attacked_uid = 0; --dont touch
hitTime = 0; --dont touch

delta = 0.7;  --time in secodns that the hitmarker is going to stay up, you can edit

function Hitmarkers(Event, Entity)
if ( Event:GetName() == 'player_hurt' ) then
local local_player = client.GetLocalPlayerIndex();
local attacker_uid = Event:GetInt('attacker');
 attacked_uid = Event:GetInt('userid');
 attacker_index = client.GetPlayerIndexByUserID(attacker_uid);
 attacked_index = client.GetPlayerIndexByUserID(attacked_uid);

if ( attacker_index == local_player ) then
  damageDone = Event:GetInt('dmg_health');
  enemy = entities.GetByIndex('attacked_index');
  hitTime = globals.RealTime();
end
end
end


-- made by prost
function draw_mindmg()

local font = draw.CreateFont("Consolas", 30);
draw.SetFont(font);

local players = entities.FindByClass( "CCSPlayer" );
for i = 1, #players do
local player = players[ i ];

if(player:GetIndex() == attacked_index) then
local x, y = client.WorldToScreen( player:GetAbsOrigin() );


  if(globals.RealTime() < hitTime + delta) then
    print(globals.RealTime() - hitTime * 3);
  draw.TextShadow(x,y - (globals.RealTime() - hitTime) * 50, math.floor(damageDone));
end
end
end
end




client.AllowListener('player_hurt');
callbacks.Register('Draw', 'draw_mindmg', draw_mindmg)
callbacks.Register('FireGameEvent', 'Hitmarkers', Hitmarkers);
