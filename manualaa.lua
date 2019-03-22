
--credit: Whoever made the original script,
--modified by prost to remove garbage code and add some customization

local leftKey = -1;
local backKey = -1;
local rightKey = -1;
local rageRef = gui.Reference("RAGE", "MAIN", "Anti-aim Main");
local check_indicator = gui.Checkbox( rageRef, "Enable", "Manual Anti-Aim", false);
local outline_check = gui.Checkbox( rageRef, "Outline", "Outline", false);
local antiAimLeft = gui.Keybox(rageRef, "antiAimLeft", "Left", 0);
local antiAimRight = gui.Keybox(rageRef, "antiAimRight", "Right", 0);
local antiAimBack = gui.Keybox(rageRef, "antiAimBack", "Back", 0);


local R = gui.Slider(rageRef, "R", "R", 0, 0, 255);
local G = gui.Slider(rageRef, "G", "G", 0, 0, 255);
local B = gui.Slider(rageRef, "B", "B", 0, 0, 255);
local A = gui.Slider(rageRef, "A", "A", 255, 0, 255);

local S = gui.Slider(rageRef, "S", "Indicator Size", 40, 0, 70);

local S1 = gui.Slider(rageRef, "S1", "Font Size", 40, 0, 70);




--You can change the RGBA to your liking.
arrowSize = 40;
local arrowR = 255;
local arrowG = 255;
local arrowB = 255;
local arrowA = 150;

local function main()
    if antiAimLeft:GetValue() ~= 0 then
        if input.IsButtonPressed(antiAimLeft:GetValue()) then
            leftKey = leftKey * -1; --toggle key
            backKey = -1;
            rightKey = -1;
            gui.SetValue("rbot_antiaim_stand_real_add", -90);
            gui.SetValue("rbot_antiaim_move_real_add", -90);
            gui.SetValue("rbot_antiaim_at_targets", 0);
        end
    end
    if antiAimBack:GetValue() ~= 0 then
        if input.IsButtonPressed(antiAimBack:GetValue()) then
            backKey = backKey * -1;--toggle key
            leftKey = -1;
            rightKey = -1;
            gui.SetValue("rbot_antiaim_stand_real_add", 0);
             gui.SetValue("rbot_antiaim_move_real_add", 0);
             gui.SetValue("rbot_antiaim_at_targets", 0);
        end
    end
    if antiAimRight:GetValue() ~= 0 then
        if input.IsButtonPressed(antiAimRight:GetValue()) then
            rightKey = rightKey * -1;--toggle key
            leftKey = -1;
            backKey = -1;
            gui.SetValue("rbot_antiaim_stand_real_add", 90);
            gui.SetValue("rbot_antiaim_move_real_add", 90);
            gui.SetValue("rbot_antiaim_at_targets", 0);
        end
    end
end


function SetAuto()
   gui.SetValue("rbot_antiaim_stand_real_add", 0);
   gui.SetValue("rbot_antiaim_move_real_add", 0);
   gui.SetValue("rbot_antiaim_at_targets", 1);
end

function draw_indicator()

  arrowR = gui.GetValue("R");
  arrowG = gui.GetValue("G");
  arrowB = gui.GetValue("B");
  arrowA = gui.GetValue("A");

    arrowSize = math.floor(gui.GetValue("S"));
    textSize = math.floor(gui.GetValue("S1"));



    local active = check_indicator:GetValue();

    if active then
    local arrowFont = draw.CreateFont("Arial", arrowSize, 30);
      local textFont = draw.CreateFont("Arial", textSize, 30);
       draw.SetFont(arrowFont);
    local w, h = draw.GetScreenSize();
        if (leftKey == 1) then
            draw.Color(arrowR, arrowG, arrowB, arrowA);

            if(outline_check:GetValue()) then
                draw.TextShadow( w/2 - w/14.7692307692, h/2 - arrowSize/2, "◄"); --Uncomment if u want arrows to have an outline. I personally don't like it. (Also delete previous line so you dont draw twice).
			      else
			         draw.Text( w/2 - w/14.7692307692, h/2 - arrowSize/2, "◄");
            end


        elseif (backKey == 1) then

            draw.Color(arrowR, arrowG, arrowB, arrowA);

            if(outline_check:GetValue()) then
              draw.TextShadow( w/2 - arrowSize/2.4, h/2 + h/11.7391304348, "▼"); --Uncomment if u want arrows to have an outline. I personally don't like it. (Also delete previous line so you dont draw twice).
            else
			          draw.Text( w/2 - arrowSize/2.35, h/2 + h/11.7391304348, "▼");
            end


        elseif (rightKey == 1) then


            draw.Color(arrowR, arrowG, arrowB, arrowA);
            if(outline_check:GetValue()) then
              draw.TextShadow( w/2 + w/20.2105263158, h/2 - arrowSize/2, "►"); --Uncomment if u want arrows to have an outline. I personally don't like it. (Also delete previous line so you dont draw twice).
            else
      		    draw.Text( w/2 + w/20.2105263158, h/2 - arrowSize/2, "►");
            end

        else
            draw.SetFont(textFont);
            draw.Color(arrowR, arrowG, arrowB, 200);
            draw.TextShadow(15, h/2, "AUTO");
            SetAuto();
        end
    end
end

callbacks.Register( "Draw", "main", main);
callbacks.Register( "Draw", "draw_indicator", draw_indicator);
