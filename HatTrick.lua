
local GameTooltip = GameTooltip

local L = {
	helmtip = "Toggles helmet model.",
	cloaktip = "Toggles cloak model.",
}


-- I hate that I have to do this, but Blizz's option frame fucks up the setting unless it was set from their option frame
local ShowCloak, ShowHelm, noop = ShowCloak, ShowHelm, function() end
_G.ShowCloak, _G.ShowHelm = noop, noop

for _,check in pairs{InterfaceOptionsDisplayPanelShowCloak, InterfaceOptionsDisplayPanelShowHelm} do
	check:Disable()
	check.Enable = noop
end


local hcheck = CreateFrame("CheckButton", "HelmCheckBox", PaperDollFrame, "OptionsCheckButtonTemplate")
hcheck:ClearAllPoints()
hcheck:SetWidth(22)
hcheck:SetHeight(22)
hcheck:SetPoint("TOPLEFT", CharacterHeadSlot, "BOTTOMRIGHT", 5, 5)
hcheck:SetScript("OnClick", function() ShowHelm(not ShowingHelm()) end)
hcheck:SetScript("OnEnter", function()
 	GameTooltip:SetOwner(this, "ANCHOR_RIGHT")
	GameTooltip:SetText(L.helmtip)
end)
hcheck:SetScript("OnLeave", function() GameTooltip:Hide() end)
hcheck:SetScript("OnEvent", function() hcheck:SetChecked(ShowingHelm()) end)
hcheck:RegisterEvent("UNIT_MODEL_CHANGED")
hcheck:SetToplevel(true)


local ccheck = CreateFrame("CheckButton", "CloakCheckBox", PaperDollFrame, "OptionsCheckButtonTemplate")
ccheck:ClearAllPoints()
ccheck:SetWidth(22)
ccheck:SetHeight(22)
ccheck:SetPoint("TOPLEFT", CharacterBackSlot, "BOTTOMRIGHT", 5, 5)
ccheck:SetScript("OnClick", function() ShowCloak(not ShowingCloak()) end)
ccheck:SetScript("OnEnter", function()
	GameTooltip:SetOwner(this, "ANCHOR_RIGHT")
	GameTooltip:SetText(L.cloaktip)
end)
ccheck:SetScript("OnLeave", function() GameTooltip:Hide() end)
ccheck:SetScript("OnEvent", function() ccheck:SetChecked(ShowingCloak()) end)
ccheck:RegisterEvent("UNIT_MODEL_CHANGED")
ccheck:SetToplevel(true)


hcheck:SetChecked(ShowingHelm())
ccheck:SetChecked(ShowingCloak())
