
local myname, ns = ...


local GameTooltip = GameTooltip

local L = {
	helmtip = "Toggles helmet model.",
	cloaktip = "Toggles cloak model.",
}


local hcheck = ns.NewCheckBox(PaperDollFrame, 22,
                              "TOPLEFT", CharacterHeadSlot, "BOTTOMRIGHT", 5, 5)
hcheck:SetScript("OnClick", function() ShowHelm(not ShowingHelm()) end)
hcheck:SetScript("OnEnter", function(self)
 	GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	GameTooltip:SetText(L.helmtip)
end)
hcheck:SetScript("OnLeave", function() GameTooltip:Hide() end)
hcheck:SetScript("OnEvent", function() hcheck:SetChecked(ShowingHelm()) end)
hcheck:RegisterEvent("UNIT_MODEL_CHANGED")
hcheck:SetToplevel(true)


local ccheck = ns.NewCheckBox(PaperDollFrame, 22,
                              "TOPLEFT", CharacterBackSlot, "BOTTOMRIGHT", 5, 5)
ccheck:SetScript("OnClick", function() ShowCloak(not ShowingCloak()) end)
ccheck:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	GameTooltip:SetText(L.cloaktip)
end)
ccheck:SetScript("OnLeave", function() GameTooltip:Hide() end)
ccheck:SetScript("OnEvent", function() ccheck:SetChecked(ShowingCloak()) end)
ccheck:RegisterEvent("UNIT_MODEL_CHANGED")
ccheck:SetToplevel(true)


hcheck:SetChecked(ShowingHelm())
ccheck:SetChecked(ShowingCloak())


-- Honestly not sure why this fixes it on the initial load, but whatever
hcheck:SetFrameLevel(31)
ccheck:SetFrameLevel(31)
