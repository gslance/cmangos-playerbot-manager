-- Author      : kaizo
-- Create Date : 9/17/2022 7:57:18 PM


function miniBar_OnLoad()
	if checkBotSet() == false then 
		activeBotName:SetText('(bot not set)') 
		miniAssist:Disable()
		miniCC:Disable()
		miniDefend:Disable()
		miniFollow:Disable()
		miniPull:Disable()
		tankBtn:Disable()
		healBtn:Disable()
		dpsBtn:Disable()
		miniStay:Disable()
		miniFollow:Disable()
	else
		activeBotName:SetText(selectedBot)
		setBot()
	end
end

function setBot()
	miniAssist:Enable()
	miniCC:Enable()
	miniDefend:Enable()
	miniFollow:Enable()
	miniPull:Enable()
	tankBtn:Enable()
	healBtn:Enable()
	dpsBtn:Enable()
	miniStay:Enable()
	miniFollow:Enable()
end

function miniQuitBtn_OnClick()
	BotManagerUI:Show();
	miniBar:Hide()
end

function checkBotSet()
	if selectedBot then
		return true
	else
		return false
	end
end

function miniPull_OnClick()
	if checkBotSet() == false then return end
	
	local name, realm = UnitName("target")
	local message = "pull"
	if singleCheck:GetChecked() then
		SendChatMessage(message, "WHISPER", nil, selectedBot)
	elseif grpCheck:GetChecked() then
		SendChatMessage(message, "PARTY", nil, selectedBot)
	end
end

function setBotBtn_OnClick()
	selectedBot = UnitName("target")
	activeBotName:SetText(selectedBot)
	setBot()
end

function miniStay_OnClick()
	if checkBotSet() == false then return end
	
	local message = "stay"
	SendChatMessage(message, "WHISPER", nil, selectedBot)
end

function tankBtn_OnClick()
	if checkBotSet() == false then return end
	
	local message = "orders combat tank"
	SendChatMessage(message, "WHISPER", nil, selectedBot)
end

function healBtn_OnClick()
	if checkBotSet() == false then return end
	
	local message = "orders combat heal"
	SendChatMessage(message, "WHISPER", nil, selectedBot)
end

function dpsBtn_OnClick()
	if checkBotSet() == false then return end
	
	local message = "attack"
	SendChatMessage(message, "WHISPER", nil, selectedBot)
end

function miniFollow_OnClick()
	if checkBotSet() == false then return end
	
	local message = "follow"
	SendChatMessage(message, "WHISPER", nil, selectedBot)
end

function miniDefend_OnClick()
	if checkBotSet() == false then return end
	
	local name, realm = UnitName("target")
	local message = "orders combat protect"
	SendChatMessage(message, "WHISPER", nil, selectedBot)
end

function miniAssist_OnClick()
	if checkBotSet() == false then return end
	
	local name, realm = UnitName("target")
	local message = "assist"
	SendChatMessage(message, "WHISPER", nil, selectedBot)
end

function miniCC_OnClick()
	if checkBotSet() == false then return end
	
	local name, realm = UnitName("target")
	local message = "neutralize"
	SendChatMessage(message, "WHISPER", nil, selectedBot)
end
