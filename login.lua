local frame = CreateFrame("Frame");
local chatMSG = DEFAULT_CHAT_FRAME;

frame:RegisterEvent("PLAYER_LOGIN");
frame:SetScript("OnEvent", function(self, e, ...)
     	chatMSG:AddMessage("Hello ".. UnitName("Player").. ". You are a ".. UnitClass("Player").. " (Level " ..UnitLevel("Player").. ").");
end);
