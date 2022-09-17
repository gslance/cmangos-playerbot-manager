-- Author      : kaizo
-- Create Date : 9/17/2022 4:25:01 PM

SLASH_PlayerBotsManager1 = '/botmanager';
SLASH_PlayerBotsManager2 = '/bm';

local miniStayingCmd;

local function PlayerBotsManager_SlashCommand(msg, editbox)
	if msg == 'mini' then		
		miniBar:Show();
	else
		BotManagerUI:Show();
	end
end
SlashCmdList["PlayerBotsManager"] = PlayerBotsManager_SlashCommand;

function interface_OnLoad()
	grpCheck:SetChecked(true)
end

function miniBtn_OnClick()
	BotManagerUI:Hide()
	miniBar:Show()
end

function quitBtn_OnClick()
	BotManagerUI:Hide()
end

function setBotBtn2_OnClick()
	selectedBot = UnitName("target")
	activeBotName2:SetText(selectedBot)
	singleCheck:SetChecked(true)
	grpCheck:SetChecked(false)

	checkEnableButtonsForWhisper()
end

function singleCheck_OnClick()
	grpCheck:SetChecked(false)
	checkEnableButtonsForWhisper()
end

function grpCheck_OnClick()
	singleCheck:SetChecked(false)
	autoEquipToggler:Enable()
	sellWhiteGreensBtn:Enable()
	repairBtn:Enable()
	questBtn:Enable()
	followModeBtn:Enable()
	completeQuestBtn:Enable()
end

function checkEnableButtonsForWhisper()
	autoEquipToggler:Disable()
	sellWhiteGreensBtn:Disable()
	repairBtn:Disable()
	questBtn:Disable()
	followModeBtn:Disable()
	completeQuestBtn:Disable()
	if selectedBot then
		autoEquipToggler:Enable()
		sellWhiteGreensBtn:Enable()
		repairBtn:Enable()
		questBtn:Enable()
		followModeBtn:Enable()
		completeQuestBtn:Enable()
	end
end

function autoEquipToggler_OnClick()
	local name, realm = UnitName("target")
	local message = "equip auto"
	if singleCheck:GetChecked() then
		if not selectedBot then return end
		SendChatMessage(message, "WHISPER", nil, selectedBot)
	else
		SendChatMessage(message, "PARTY", nil, UnitName("target"))
	end
end

function sellWhiteGreensBtn_OnClick()
	local name, realm = UnitName("target")
	local message = "sell all"
	if singleCheck:GetChecked() then
		if not selectedBot then return end
		SendChatMessage(message, "WHISPER", nil, selectedBot)
	else
		SendChatMessage(message, "PARTY", nil, UnitName("target"))
	end
end

function followModeBtn_OnClick()
	local name, realm = UnitName("target")
	local message = "follow"
	if singleCheck:GetChecked() then
		if not selectedBot then return end
		SendChatMessage(message, "WHISPER", nil, selectedBot)
	else
		SendChatMessage(message, "PARTY", nil, UnitName("target"))
	end
end

function repairBtn_OnClick()
	local name, realm = UnitName("target")
	local message = "repair all"
	if singleCheck:GetChecked() then
		if not selectedBot then return end
		SendChatMessage(message, "WHISPER", nil, selectedBot)
	else
		SendChatMessage(message, "PARTY", nil, UnitName("target"))
	end
end

function questFetchBtn_OnClick()
	local name, realm = UnitName("target")
	local message = "quest fetch"
	if singleCheck:GetChecked() then
		if not selectedBot then return end
		SendChatMessage(message, "WHISPER", nil, selectedBot)
	else
		SendChatMessage(message, "PARTY", nil, UnitName("target"))
	end
end
function completeQuestBtn_OnClick()
	local name, realm = UnitName("target")
	local message = "quest end"
	if singleCheck:GetChecked() then
		if not selectedBot then return end
		SendChatMessage(message, "WHISPER", nil, selectedBot)
	else
		SendChatMessage(message, "PARTY", nil, UnitName("target"))
	end
end

function helpBtn_OnClick()
	local name, realm = UnitName("target")
	local message = "help"
	SendChatMessage(message, "PARTY", nil, UnitName("target"))
end
