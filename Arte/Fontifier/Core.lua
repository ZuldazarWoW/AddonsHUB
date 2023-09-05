local Fontifier = LibStub("AceAddon-3.0"):NewAddon("Fontifier", "AceConsole-3.0", "AceEvent-3.0")
local LSM       = LibStub:GetLibrary("LibSharedMedia-3.0")



-- Fontifier:OnInitialize()
-- Initializes Fontifier. Called when the addon is loaded.

function Fontifier:OnInitialize()
	-- Configuration
	self:InitializeConfiguration()
	self:InitializeConfigurationGUI()

	-- Fonts
	self:InitializeFonts()

	-- Events
	self:RegisterEvent("VARIABLES_LOADED", "OnVariablesLoaded")
end



-- Fontifier:OnVariablesLoaded()
-- Event handler.

function Fontifier:OnVariablesLoaded()
	if self.db.profile.EnableCharacterFrameModifications then
		-- Make sure the left column is set to "Base Stats"
		SetCVar("playerStatLeftDropdown", "PLAYERSTAT_BASE_STATS")
	end
end



-- Fontifier:InitializeFonts()
-- Initializes the font-related subsystems.

function Fontifier:InitializeFonts()
	-- Register callbacks
	LSM.RegisterCallback(Fontifier, "LibSharedMedia_Registered", "LibSharedMediaCallback")
	LSM.RegisterCallback(Fontifier, "LibSharedMedia_SetGlobal" , "LibSharedMediaCallback")

	-- Fonts
	self.Fonts = {
		["Cantarell"]      = "Interface\\AddOns\\Fontifier\\Fonts\\Cantarell.ttf",
		["Cantarell Bold"] = "Interface\\AddOns\\Fontifier\\Fonts\\Cantarell Bold.ttf",
		["Luxi Sans"]      = "Interface\\AddOns\\Fontifier\\Fonts\\Luxi Sans.ttf",
		["Luxi Sans Bold"] = "Interface\\AddOns\\Fontifier\\Fonts\\Luxi Sans Bold.ttf",
		["M+ 1c"]          = "Interface\\AddOns\\Fontifier\\Fonts\\MPlus 1c.ttf",
		["M+ 1c Bold"]     = "Interface\\AddOns\\Fontifier\\Fonts\\MPlus 1c Bold.ttf"
	}

	-- Register fonts
	for k, v in pairs(self.Fonts) do
		LSM:Register("font", k, v)
	end
end



-- Fontifier:LibSharedMediaCallback()
-- Updates all fonts any time new fonts are registered with LSM 3.0. This ensures that late font registrations from
-- other addons are loaded properly. This can be made more efficient in the future.
--
-- Name:      Name of the callback calling this function.
-- MediaType: Media type string.
-- Key:       Name of the media that triggered the callback.

function Fontifier:LibSharedMediaCallback(Name, MediaType, Key)
	if MediaType == "font" then
		self:Update()
	end
end



-- Fontifier:Update()
-- Updates all fonts. Used on configuration/profile changes and new font registrations.

function Fontifier:Update()
	self:SetBaseFonts()
	self:SetChatFonts()
	self:SetCharacterFrame()
end



-- Fontifier:SetFont()
-- Sets the font, size and style of an object. This may be extended in the future to provide additional properties.
--
-- Object: Text object to modify.
-- Font:   Font to use. This is a full path string returned by LSM 3.0's Fetch() function.
-- Size:   Font size in pixels (height).
-- Style:  Style string. This can be OUTLINE, THICKOUTLINE, MONOCHROME or nil.

function Fontifier:SetFont(Object, Font, Size, Style)
	Object:SetFont(Font, Size, Style)
end



-- Fontifier:SetBaseFonts()
-- Sets all base fonts (excluding the chat frame). Generally speaking, changes to these fonts are effective
-- immediately. Some addons may require an interface reload. Fonts rendered by the game engine require a client log
-- off to take effect.

function Fontifier:SetBaseFonts()
	local FontStandard = LSM:Fetch("font", self.db.profile.FontStandard)
	local FontFancy    = LSM:Fetch("font", self.db.profile.FontFancy)
	local FontSmall    = FontStandard

	local SizeSmall    = self.db.profile.SizeSmall
	local SizeMedium   = self.db.profile.SizeMedium
	local SizeLarge    = self.db.profile.SizeLarge
	local SizeHuge     = self.db.profile.SizeHuge
	local SizeInsane   = self.db.profile.SizeHuge + 8

	-- Base fonts
	self:SetFont(SystemFont_Tiny                   , FontSmall   , SizeSmall , nil)
	self:SetFont(SystemFont_Small                  , FontSmall   , SizeSmall , nil)
	self:SetFont(SystemFont_Outline_Small          , FontSmall   , SizeSmall , "OUTLINE")
	self:SetFont(SystemFont_Shadow_Small           , FontSmall   , SizeSmall , nil)
	self:SetFont(SystemFont_InverseShadow_Small    , FontSmall   , SizeSmall , nil)
	self:SetFont(SystemFont_Med1                   , FontStandard, SizeMedium, nil)
	self:SetFont(SystemFont_Shadow_Med1            , FontStandard, SizeMedium, nil)
	self:SetFont(SystemFont_Med2                   , FontStandard, SizeMedium, nil)
	self:SetFont(SystemFont_Med3                   , FontStandard, SizeMedium, nil)
	self:SetFont(SystemFont_Shadow_Med3            , FontStandard, SizeMedium, nil)
	self:SetFont(SystemFont_Large                  , FontStandard, SizeLarge , nil)
	self:SetFont(SystemFont_Shadow_Large           , FontStandard, SizeLarge , nil)
	self:SetFont(SystemFont_Shadow_Huge1           , FontStandard, SizeHuge  , nil)
	self:SetFont(SystemFont_OutlineThick_Huge2     , FontStandard, SizeHuge  , "THICKOUTLINE")
	self:SetFont(SystemFont_Shadow_Outline_Huge2   , FontStandard, SizeHuge  , "THICKOUTLINE")
	self:SetFont(SystemFont_Shadow_Huge3           , FontStandard, SizeHuge  , nil)
	self:SetFont(SystemFont_OutlineThick_Huge4     , FontStandard, SizeHuge  , "THICKOUTLINE")
	self:SetFont(SystemFont_OutlineThick_WTF       , FontStandard, SizeInsane, "THICKOUTLINE")
	self:SetFont(NumberFont_Shadow_Small           , FontSmall   , SizeSmall , nil)
	self:SetFont(NumberFont_OutlineThick_Mono_Small, FontStandard, SizeMedium, "OUTLINE")
	self:SetFont(NumberFont_Shadow_Med             , FontStandard, SizeMedium, nil)
	self:SetFont(NumberFont_Outline_Med            , FontStandard, SizeMedium, "OUTLINE")
	self:SetFont(NumberFont_Outline_Large          , FontStandard, SizeLarge , "OUTLINE")
	self:SetFont(NumberFont_Outline_Huge           , FontStandard, SizeHuge  , "OUTLINE")
	self:SetFont(QuestFont_Large                   , FontFancy   , SizeMedium, nil)
	self:SetFont(QuestFont_Shadow_Huge             , FontFancy   , SizeHuge  , nil)
	self:SetFont(GameTooltipHeader                 , FontStandard, SizeMedium, nil)
	self:SetFont(MailFont_Large                    , FontFancy   , SizeMedium, nil)
	self:SetFont(SpellFont_Small                   , FontSmall   , SizeSmall , nil)
	self:SetFont(InvoiceFont_Med                   , FontStandard, SizeMedium, nil)
	self:SetFont(InvoiceFont_Small                 , FontSmall   , SizeSmall , nil)
	self:SetFont(Tooltip_Med                       , FontStandard, SizeMedium, nil)
	self:SetFont(Tooltip_Small                     , FontSmall   , SizeSmall , nil)
	self:SetFont(AchievementFont_Small             , FontSmall   , SizeSmall , nil)
	self:SetFont(ReputationDetailFont              , FontSmall   , SizeSmall , nil)

	-- Game engine fonts
	STANDARD_TEXT_FONT = FontStandard
	UNIT_NAME_FONT     = FontStandard
	DAMAGE_TEXT_FONT   = FontStandard
	NAMEPLATE_FONT     = FontStandard
end



-- Fontifier:SetChatFonts()
-- Sets the chat frame and edit box fonts and extends the list of available chat frame font sizes. Changes to these
-- fonts are effective immediately.

function Fontifier:SetChatFonts()
	if self.db.profile.EnableChatModifications then
		local FontChat = LSM:Fetch("font", self.db.profile.FontChat)

		for i = 1, 7 do
			local Frame = _G["ChatFrame"..i]
			local Font, Size = Frame:GetFont()

			Frame:SetFont(FontChat, Size)
		end

		-- Extend the list of available font sizes
		CHAT_FONT_HEIGHTS = { 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18 }
	end
end



-- Fontifier:SetCharacterFrame()
-- Modify the character frame to allow more real estate for text that typically overlaps when using larger fonts.

function Fontifier:SetCharacterFrame()
	if self.db.profile.EnableCharacterFrameModifications then
		-- Nudge
		PlayerStatFrameLeft1 :SetPoint("TOPLEFT", 3, -3)
		PlayerStatFrameRight1:SetPoint("TOPLEFT", PlayerStatFrameLeft1, "TOPRIGHT", 6, 0)

		-- Resize
		PlayerStatLeftTop    :SetWidth(99)
		PlayerStatLeftMiddle :SetWidth(99)
		PlayerStatLeftBottom :SetWidth(99)
		PlayerStatFrameLeft1 :SetWidth(94)
		PlayerStatFrameLeft2 :SetWidth(94)
		PlayerStatFrameLeft3 :SetWidth(94)
		PlayerStatFrameLeft4 :SetWidth(94)
		PlayerStatFrameLeft5 :SetWidth(94)
		PlayerStatFrameLeft6 :SetWidth(94)
		PlayerStatRightTop   :SetWidth(131)
		PlayerStatRightMiddle:SetWidth(131)
		PlayerStatRightBottom:SetWidth(131)
		PlayerStatFrameRight1:SetWidth(124)
		PlayerStatFrameRight2:SetWidth(124)
		PlayerStatFrameRight3:SetWidth(124)
		PlayerStatFrameRight4:SetWidth(124)
		PlayerStatFrameRight5:SetWidth(124)
		PlayerStatFrameRight6:SetWidth(124)

		-- Drop downs
		UIDropDownMenu_SetWidth(PlayerStatFrameRightDropDown, 115)
		PlayerStatFrameLeftDropDown:Hide()

		-- Make sure the left column is set to "Base Stats"
		SetCVar("playerStatLeftDropdown", "PLAYERSTAT_BASE_STATS")
	end
end



-- ADDFONT()
-- User-friendly font registration function. Used in Custom.lua to add fonts. See Readme.html for more information.
--
-- Filename: Filename (excluding path) of the font.
-- Name:     Friendly name of the font.

function ADDFONT(Filename, Name)
	LSM:Register("font", Name, "Interface\\AddOns\\Fontifier\\Custom\\"..Filename)
end