--[[

Displays character information and health bar only
when in combat

When in an instance:
-- "pvp" when in a battleground
-- "arena" when in an arena
-- "party" when in a 5-man instance
-- "raid" when in a raid instance
-- "scenario" when in a scenario

displays character information and health bar
even if not in combat

--]]

local frame = CreateFrame("Frame");
local inInstance, instanceType = IsInInstance();

frame:SetScript("OnEvent", function(self, e)
  if (inInstance == false or instanceType == none) then
    if (e == "UNIT_HEALTH") then
      PlayerFrame:SetAlpha(UnitHealth("player")
      <UnitHealthMax("player") and 1 or 0);
    elseif (e == "PLAYER_REGEN_ENABLED") then
      frame:RegisterEvent("UNIT_HEALTH");
      PlayerFrame:SetAlpha(UnitHealth("player")
      <UnitHealthMax("player") and 1 or 0);
    elseif (e == "PLAYER_REGEN_DISABLED") then
      frame:UnregisterEvent("UNIT_HEALTH");
      PlayerFrame:SetAlpha(1);
    elseif (e == "PLAYER_LOGIN") then
      PlayerFrame:SetAlpha(UnitHealth("player")
      <UnitHealthMax("player") and 1 or 0);
      end
  elseif (inInstance ~= false or instanceType ~= none) then
    frame:UnregisterEvent("UNIT_HEALTH");
    PlayerFrame:SetAlpha(1);
  end
end);

frame:RegisterEvent("UNIT_HEALTH");
frame:RegisterEvent("PLAYER_REGEN_ENABLED");
frame:RegisterEvent("PLAYER_REGEN_DISABLED");
frame:RegisterEvent("PLAYER_LOGIN");
