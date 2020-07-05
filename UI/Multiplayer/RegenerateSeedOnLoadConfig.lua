-- LuaScript1
-- Author: Gabriel2
-- DateCreated: 7/2/2020 8:52:38 PM
--------------------------------------------------------------
local m_kPopupDialogSeed:table;

function OnLoadConfig()
	if (m_kPopupDialogSeed == nil)
		m_kPopupDialogSeed = PopupDialog:new( "InGameTopOptionsMenu" );
	end

	local serverType = ServerTypeForMPLobbyType(m_lobbyModeName);
	LuaEvents.HostGame_SetLoadGameServerType(serverType);
	local kParameters = {};
	kParameters.FileType = SaveFileTypes.GAME_CONFIGURATION;
	UIManager:QueuePopup(Controls.LoadGameMenu, PopupPriority.Current, kParameters);
	--Checks if the host wants to keep the configuration seed or 
	if (not m_kPopupDialogSeed:IsOpen()) then
		m_kPopupDialogSeed:AddText(	  Locale.Lookup("LOC_LOAD_CONFIG_REGENERATE_SEED_WARNING"));
		m_kPopupDialogSeed:AddButton( Locale.Lookup("LOC_COMMON_DIALOG_NO_BUTTON_CAPTION"), nil );
		m_kPopupDialogSeed:AddButton( Locale.Lookup("LOC_COMMON_DIALOG_YES_BUTTON_CAPTION"), GameConfiguration.RegenerateSeeds, nil, nil, "PopupButtonInstanceRed" );
		m_kPopupDialogSeed:Open();
	end
end
