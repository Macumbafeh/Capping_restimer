local time
local init

local frame = CreateFrame("Frame","ResTimer")
local frame2 = CreateFrame("Frame","ResTimer2")

frame:SetScript("OnEvent", function(_, _, _, event, _, _, _, _, _, _, spellID)
	if event == "SPELL_AURA_APPLIED" and spellID == 44535 then
		Capping:StartBar("Spirit Resurrection", 30, 30,"Interface\\Icons\\Spell_Holy_Resurrection", "info2",0,true)
		time = GetTime()
		init = 1
	end
end)
frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")


frame2:SetScript("OnUpdate", function()
	if init == 1 and time < GetTime() - 30 then
		Capping:StartBar("Spirit Resurrection", 30, 30,"", "info2")
		time = GetTime()
	end
end)
