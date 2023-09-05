local Fontifier = LibStub("AceAddon-3.0"):GetAddon("Fontifier")
local LSM       = LibStub:GetLibrary("LibSharedMedia-3.0")



-- Fontifier:InitializeConfiguration()
-- Initializes the configuration-related subsystems.

function Fontifier:InitializeConfiguration()
	-- Defaults
	self.ConfigurationDefaults = {
		global = {
			Version                           = 0,
		},
		profile = {
			EnableChatModifications           = true,
			EnableCharacterFrameModifications = true,
			FontStandard                      = "Cantarell Bold",
			FontFancy                         = "Cantarell Bold",
			FontChat                          = "Cantarell Bold",
			SizeSmall                         = 10,
			SizeMedium                        = 10,
			SizeLarge                         = 16,
			SizeHuge                          = 18
		}
	}

	-- Database
	self.db = LibStub("AceDB-3.0"):New("FontifierDB", self.ConfigurationDefaults, "Default")

	-- Configuration tables
	self.Configuration = { }

	-- Main
	self.Configuration.Main = { name = "Fontifier", handler = Fontifier, type = "group", get = "GetValue", set = "SetValue",
		args = {
			FontDefinitions = { name = "Font Definitions", type = "group", inline = true, get = "GetFontValue", set = "SetFontValue", order = 1.0,
				args = {
					FontStandard = {
						name   = "Standard",
						desc   = "The font used for everything not specified by the other font definitions.\n\nFonts rendered by the 3D engine (such as NPC names) will not be updated until you log back into your character.",
						type   = "select",
						values = LSM:List("font"),
						order  = 1.1
					},
					FontFancy = {
						name   = "Fancy",
						desc   = "The font used for the quest log, mail and books.",
						type   = "select",
						values = LSM:List("font"),
						order  = 1.2
					},
					FontChat = {
						name   = "Chat",
						desc   = "The font used for the chat frame and edit box.",
						type   = "select",
						hidden = "GetHiddenState",
						values = LSM:List("font"),
						order  = 1.3
					}
				}
			},
			FontSizes = { name = "Font Sizes", type = "group", inline = true, order = 2.0,
				args = {
					SizeSmall = {
						name   = "Small",
						desc   = "Small text size.",
						type   = "range",
						step   = 1,
						min    = 6,
						max    = 14,
						order  = 2.1
					},
					SizeMedium = {
						name   = "Medium",
						desc   = "Medium text size.",
						type   = "range",
						step   = 1,
						min    = 8,
						max    = 16,
						order  = 2.2
					},
					SizeLarge = {
						name   = "Large",
						desc   = "Large text size.",
						type   = "range",
						step   = 1,
						min    = 12,
						max    = 20,
						order  = 2.3
					},
					SizeHuge = {
						name   = "Huge",
						desc   = "Huge text size.",
						type   = "range",
						step   = 1,
						min    = 16,
						max    = 24,
						order  = 2.4
					}
				}
			}
		}
	}

	-- Tweaks node
	self.Configuration.Tweaks = { name = "Tweaks", handler = Fontifier, type = "group", get = "GetValue", set = "SetValue",
		args = {
			EnableChatModifications = {
				name   = "Enable chat modifications",
				desc   = "Modify the chat frame and edit box fonts and extend the list of available font sizes. Disable this if you use a chat addon to make these changes.\n\nReload your interface after modifying this setting.",
				width  = "full",
				type   = "toggle",
				order  = 1.1
			},
			EnableCharacterFrameModifications = {
				name   = "Enable character frame modifications",
				desc   = "Resize the character frame stat columns to make more efficient use of the available real estate.\n\nReload your interface after modifying this setting.",
				width  = "full",
				type   = "toggle",
				order  = 1.2
			}
		}
	}

	-- Profiles node
	self.Configuration.Profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
	self.Configuration.Profiles.name = "Profiles"

	-- Register configuration tables
	LibStub("AceConfig-3.0"):RegisterOptionsTable("Fontifier",          self.Configuration.Main)
	LibStub("AceConfig-3.0"):RegisterOptionsTable("Fontifier.Tweaks",   self.Configuration.Tweaks)
	LibStub("AceConfig-3.0"):RegisterOptionsTable("Fontifier.Profiles", self.Configuration.Profiles)

	-- Register callbacks
	self.db.RegisterCallback(self, "OnProfileChanged", "Update")
	self.db.RegisterCallback(self, "OnProfileCopied",  "Update")
	self.db.RegisterCallback(self, "OnProfileReset",   "Update")

	-- Register chat command
	self:RegisterChatCommand("fontifier", "ChatCommand")
	
	-- Validatation
	self:ValidateConfiguration()
end



-- Fontifier:ValidateConfiguration()
-- Ensure that the configuration is correct. Load default values where necessary.

function Fontifier:ValidateConfiguration()
	-- Check for old or unknown configurations and reset
	if self.db.global.Version == 0 then
		self.db:ResetDB("Default")
		self:Print("Initializing configuration. Loading default values.")

		self.db.global.Version = 1
	end
end



-- Fontifier:InitializeConfigurationGUI()
-- Create the configuration frames and add them to Blizzard's addon interface.

function Fontifier:InitializeConfigurationGUI()
	-- Main
	self.ConfigurationFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("Fontifier", self.Configuration.Main.name)

	-- Tweaks and Profiles nodes
	LibStub("AceConfigDialog-3.0"):AddToBlizOptions("Fontifier.Tweaks",   self.Configuration.Tweaks.name,   "Fontifier")
	LibStub("AceConfigDialog-3.0"):AddToBlizOptions("Fontifier.Profiles", self.Configuration.Profiles.name, "Fontifier")

	-- Buttons
	self.ConfigurationFrame.okay   = function() self:OnCloseConfigurationFrame() end
	self.ConfigurationFrame.cancel = function() self:OnCloseConfigurationFrame() end
end



-- Fontifier:ChatCommand()
-- Handles the /fontifier chat command.

function Fontifier:ChatCommand()
	InterfaceOptionsFrame_OpenToCategory(self.ConfigurationFrame)
end



-- Fontifier:OnCloseConfigurationFrame
-- Event handler.

function Fontifier:OnCloseConfigurationFrame()

end



-- Fontifier:GetHiddenState()
-- Gets the hidden state of the specified field.
--
-- Infotable: See the Ace 3.0 documentation for more information.

function Fontifier:GetHiddenState(Infotable)
	if Infotable[#Infotable] == "FontChat" and not self.db.profile.EnableChatModifications then
		return true
	end

	return false
end



-- Fontifier:GetValue()
-- Gets the value of the specified field. Generic.
--
-- Infotable: See the Ace 3.0 documentation for more information.

function Fontifier:GetValue(Infotable)
	return self.db.profile[Infotable[#Infotable]]
end



-- Fontifier:SetValue()
-- Sets the value of the specified field. Generic.
--
-- Infotable: See the Ace 3.0 documentation for more information.
-- Value:     The value.

function Fontifier:SetValue(Infotable, Value)
	self.db.profile[Infotable[#Infotable]] = Value

	self:Update()
end



-- Fontifier:GetFontValue()
-- Gets the value of the specified field. Applies to LSM 3.0 font lists.
--
-- Infotable: See the Ace 3.0 documentation for more information.

function Fontifier:GetFontValue(Infotable)
	local table = LSM:List("font")

	for k, v in pairs(table) do
		if self.db.profile[Infotable[#Infotable]] == v then
			return k
		end
	end
end



-- Fontifier:SetFontValue()
-- Sets the value of the specified field. Applies to LSM 3.0 font lists.
--
-- Infotable: See the Ace 3.0 documentation for more information.
-- Value:     The value.

function Fontifier:SetFontValue(Infotable, Value)
	local table = LSM:List("font")
	self.db.profile[Infotable[#Infotable]] = table[Value]

	self:Update()
end