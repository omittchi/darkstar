-----------------------------------
-- Area: Konschtat Highlands
--  NPC: Shattered telepoint
-- !pos 135 19 220 108
-----------------------------------
require("scripts/globals/missions");
local ID = require("scripts/zones/Konschtat_Highlands/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(COP) == BELOW_THE_ARKS and player:getVar("PromathiaStatus") == 1) then
        player:startEvent(913,0,0,1); -- first time in promy -> have you made your preparations cs
    elseif (player:getCurrentMission(COP) == THE_MOTHERCRYSTALS and (player:hasKeyItem(dsp.ki.LIGHT_OF_HOLLA) or player:hasKeyItem(dsp.ki.LIGHT_OF_MEA))) then
        if (player:getVar("cspromy2") == 1) then
            player:startEvent(912);  -- cs you get nearing second promyvion
        else
            player:startEvent(913);
        end
    elseif (player:getCurrentMission(COP) > THE_MOTHERCRYSTALS or player:hasCompletedMission(COP,THE_LAST_VERSE) or (player:getCurrentMission(COP) == BELOW_THE_ARKS and player:getVar("PromathiaStatus") > 1)) then
        player:startEvent(913); -- normal cs (third promyvion and each entrance after having that promyvion visited or mission completed)
    else
        player:messageSpecial(ID.text.TELEPOINT_HAS_BEEN_SHATTERED);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 912) then
        player:setVar("cspromy2",0);
        player:setVar("cs2ndpromy",1);
        player:setPos(-267.194, -40.634, -280.019, 0, 14); -- To Hall of Transference {R}
    elseif (csid == 913 and option == 0) then
        player:setPos(-267.194, -40.634, -280.019, 0, 14); -- To Hall of Transference {R}
    end

end;