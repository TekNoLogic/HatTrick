
local myname, ns = ...


local sounds = {
	[true] = 'igMainMenuOptionCheckBoxOn',
	[false] = 'igMainMenuOptionCheckBoxOff',
}
local function CheckSound(self) PlaySound(sounds[self:GetChecked()]) end


-- Creates a checkbox.
-- All args optional but parent is highly recommended
function ns.NewCheckBox(parent, size, ...)
	local check = CreateFrame("CheckButton", nil, parent)
	check:SetWidth(size or 26)
	check:SetHeight(size or 26)
	if select(1, ...) then check:SetPoint(...) end

	check:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up")
	check:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down")
	check:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight")
	check:SetDisabledCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
	check:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")

	check:SetScript("PreClick", CheckSound)

	return check
end
