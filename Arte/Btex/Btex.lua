--------------------------------------------------------------------------------------------------------
--                                            BTEX(Bottom TEXture)                                    --
--                                                V2.9.3 - 2010                                       --
--										     from Tiggy Ysondre-EU                                    --
--------------------------------------------------------------------------------------------------------
DEFAULT_CHAT_FRAME:AddMessage("|c00bfffffBtex|r " ..BTEX_VERSION..SLASHLOAD, 0.0, .80, 1);
--------------------------------------------------------------------------------------------------------
--                                          SETUP BOTTOM SKIN loading                                 --
--------------------------------------------------------------------------------------------------------
-- Set frames
-- Frame 1/4
local BtexMainFrame1 = CreateFrame("Frame",nil,UIParent);
BtexMainFrame1:SetMovable(false);
BtexMainFrame1:EnableMouse(false);
local texture1 = BtexMainFrame1:CreateTexture(nil,"BACKGROUND");
-- Frame 2/4
local BtexMainFrame2 = CreateFrame("Frame",nil,UIParent);
BtexMainFrame2:SetMovable(false);
BtexMainFrame2:EnableMouse(false);
local texture2 = BtexMainFrame2:CreateTexture(nil,"BACKGROUND");
-- Frame 3/4
local BtexMainFrame3 = CreateFrame("Frame",nil,UIParent);
BtexMainFrame3:SetMovable(false);
BtexMainFrame3:EnableMouse(false);
local texture3 = BtexMainFrame3:CreateTexture(nil,"BACKGROUND");
-- Frame 4/4
local BtexMainFrame4 = CreateFrame("Frame",nil,UIParent);
BtexMainFrame4:SetMovable(false);
BtexMainFrame4:EnableMouse(false);
local texture4 = BtexMainFrame4:CreateTexture(nil,"BACKGROUND");

--font button
local BtexFont = CreateFont("Btest");
BtexFont:SetFont("Interface\\AddOns\\Btex\\Btex.ttf", 9,"BOLD");

-- Viewport Woldframe
function BtexViewport()
	WorldFrame:ClearAllPoints();
	WorldFrame:SetPoint("TOPLEFT", TEX_VIEWPORT_TL, -TEX_VIEWPORT_TR);
	WorldFrame:SetPoint("BOTTOMRIGHT", -TEX_VIEWPORT_BL, TEX_VIEWPORT_BR);
end
--Chat strata (if layer of btex frame are modified)
function BtexChatFrame()
	if TEX_CHAT == 1 then
	ChatFrame1:SetFrameStrata("HIGH");
	ChatFrame2:SetFrameStrata("HIGH");
	end
end
-- Set Texture function
function BTexMain()
if TEX_CHOICE == nil then 
DEFAULT_CHAT_FRAME:AddMessage ( "ERROR : No texture set" );
-- no texture
	elseif TEX_CHOICE == "NONE" then
	BtexMainFrame1:Hide();
	BtexMainFrame2:Hide();
	BtexMainFrame3:Hide();
	BtexMainFrame4:Hide();
	else
-- Texture 1/4
	BtexMainFrame1:ClearAllPoints();
	BtexMainFrame1:SetFrameStrata(TEX_STRATA);
	BtexMainFrame1:SetWidth(TEX_WIDTH);
	BtexMainFrame1:SetAlpha(TEX_ALPHA); 	
	BtexMainFrame1:SetHeight(TEX_HEIGHT);
	BtexMainFrame1:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT",TEX_X, TEX_Y);
	texture1:SetTexture("Interface\\AddOns\\BTEX\\Skins\\"..TEX_CHOICE.."-1");
	texture1:SetVertexColor(TEX_VERTEX_R,TEX_VERTEX_G,TEX_VERTEX_B);
	texture1:SetAllPoints(BtexMainFrame1);
	BtexMainFrame1.texture = texture1;
	BtexMainFrame1:Show();
	BtexMainFrame1:SetScale(UI_WIDTH/1920);
-- Texture 2/4
	BtexMainFrame2:ClearAllPoints();
	BtexMainFrame2:SetFrameStrata(TEX_STRATA);
	BtexMainFrame2:SetWidth(TEX_WIDTH); 
	BtexMainFrame2:SetAlpha(TEX_ALPHA);
	BtexMainFrame2:SetHeight(TEX_HEIGHT);
	BtexMainFrame2:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT",TEX_WIDTH+TEX_X, TEX_Y);
	texture2:SetTexture("Interface\\AddOns\\BTEX\\Skins\\"..TEX_CHOICE.."-2");
	texture2:SetVertexColor(TEX_VERTEX_R,TEX_VERTEX_G,TEX_VERTEX_B);
	texture2:SetAllPoints(BtexMainFrame2);
	BtexMainFrame2.texture = texture2;
	BtexMainFrame2:Show();
	BtexMainFrame2:SetScale(UI_WIDTH/1920);
-- Texture 3/4
	BtexMainFrame3:ClearAllPoints();
	BtexMainFrame3:SetFrameStrata(TEX_STRATA);
	BtexMainFrame3:SetWidth(TEX_WIDTH); 
	BtexMainFrame3:SetAlpha(TEX_ALPHA);
	BtexMainFrame3:SetHeight(TEX_HEIGHT);
	BtexMainFrame3:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", TEX_WIDTH*2+TEX_X, TEX_Y);
	texture3:SetTexture("Interface\\AddOns\\BTEX\\Skins\\"..TEX_CHOICE.."-3");
	texture3:SetVertexColor(TEX_VERTEX_R,TEX_VERTEX_G,TEX_VERTEX_B);
	texture3:SetAllPoints(BtexMainFrame3);
	BtexMainFrame3.texture = texture3;
	BtexMainFrame3:Show();
	BtexMainFrame3:SetScale(UI_WIDTH/1920);
-- Texture 1/4
	BtexMainFrame4:ClearAllPoints();
	BtexMainFrame4:SetFrameStrata(TEX_STRATA);
	BtexMainFrame4:SetWidth(TEX_WIDTH); 
	BtexMainFrame4:SetAlpha(TEX_ALPHA);
	BtexMainFrame4:SetHeight(TEX_HEIGHT);
	BtexMainFrame4:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", TEX_WIDTH*3+TEX_X, TEX_Y);
	texture4:SetTexture("Interface\\AddOns\\BTEX\\Skins\\"..TEX_CHOICE.."-4");
	texture4:SetVertexColor(TEX_VERTEX_R,TEX_VERTEX_G,TEX_VERTEX_B);
	texture4:SetAllPoints(BtexMainFrame4);
	BtexMainFrame4.texture = texture4;
	BtexMainFrame4:Show();
	BtexMainFrame4:SetScale(UI_WIDTH/1920);
	end
	BtexViewport();
	BtexChatFrame();
end

--------------------------------------------------------------------------------------------------------
--                                                 EVENTS                                             --
--------------------------------------------------------------------------------------------------------
function OnEvent(self, event)
	if (event == "VARIABLES_LOADED") then
        if(not TEX_CHOICE) then TEX_CHOICE = 'DS3' end;
        if(not TEX_HEIGHT) then TEX_HEIGHT = '256' end;
		if(not UI_WIDTH) then UI_WIDTH = UIParent:GetWidth() end;
		if(not TEX_ALPHA) then TEX_ALPHA = '1' end;
		if(not TEX_WIDTH) then TEX_WIDTH = '512' end;
		if(not TEX_X) then TEX_X = '0' end;
		if(not TEX_Y) then TEX_Y = '0' end;
		if(not TEX_STRATA) then TEX_STRATA = "BACKGROUND" end;
		if(not TEX_VERTEX_R) then TEX_VERTEX_R = '1' end;
		if(not TEX_VERTEX_G) then TEX_VERTEX_G = '1' end;
		if(not TEX_VERTEX_B) then TEX_VERTEX_B = '1' end;
		if(not TEX_VIEWPORT_BL) then TEX_VIEWPORT_BL = 0 end;
		if(not TEX_VIEWPORT_BR) then TEX_VIEWPORT_BR = 0 end;
		if(not TEX_VIEWPORT_TL) then TEX_VIEWPORT_TL = 0 end;
		if(not TEX_VIEWPORT_TR) then TEX_VIEWPORT_TR = 0 end;
		if(not TEX_CHAT) then TEX_CHAT = 0 end;
		BTexMain();
	end
end

--------------------------------------------------------------------------------------------------------
--                                          COLORPICKER                                               --
--------------------------------------------------------------------------------------------------------
function BtexColor_OnClick()
	if ColorPickerFrame:IsShown() then
		ColorPickerFrame:Hide();
	else
		local red, green, blue = TEX_VERTEX_R, TEX_VERTEX_G, TEX_VERTEX_B
		ColorPickerFrame.func = BtexColor_ColorChange
		ColorPickerFrame.cancelFunc = BtexColor_CancelChanges
		ColorPickerFrame:SetColorRGB(red, green, blue)
		ColorPickerFrame.previousValues = {r = red,g = green ,b = blue}
		ShowUIPanel(ColorPickerFrame)
	end
end

function BtexColor_ColorChange()
	local r, g, b = ColorPickerFrame:GetColorRGB();
	TEX_VERTEX_R, TEX_VERTEX_G, TEX_VERTEX_B = r, g, b;
	BTexMain();
end

function BtexColor_CancelChanges()
	TEX_VERTEX_R = ColorPickerFrame.previousValues.r;
	TEX_VERTEX_G = ColorPickerFrame.previousValues.g;
	TEX_VERTEX_B = ColorPickerFrame.previousValues.b;
	BTexMain();
end

--------------------------------------------------------------------------------------------------------
--                                               Set to DEFAULT                                       --
--------------------------------------------------------------------------------------------------------
function Default()
TEX_CHOICE = 'DS3';
TEX_HEIGHT = '256';
UI_WIDTH = UIParent:GetWidth();
TEX_ALPHA = '1';
TEX_WIDTH = '512';
TEX_X = '0';
TEX_Y = '0';
TEX_STRATA = "BACKGROUND";
TEX_VERTEX_R = '1';
TEX_VERTEX_G = '1';
TEX_VERTEX_B = '1';
TEX_VIEWPORT_BL = 0;
TEX_VIEWPORT_BR = 0;
TEX_VIEWPORT_TL = 0;
TEX_VIEWPORT_TR = 0;
TEX_CHAT = 0;
BTexMain();
end

--------------------------------------------------------------------------------------------------------
--                                             LUA FRAME MENU                                         --
--------------------------------------------------------------------------------------------------------
-- main frame menu
local BtexMenuFrame = CreateFrame("Frame","btexframeconfig",UIParent);
BtexMenuFrame:SetWidth(400);
BtexMenuFrame:SetHeight(480);
BtexMenuFrame:SetBackdrop({ bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", tile = true, tileSize = 8, edgeSize = 12, insets = { left = 2, right = 2, top = 2, bottom = 2 } });
BtexMenuFrame:SetBackdropColor(0.1,0.1,0.2,1);
BtexMenuFrame:SetBackdropBorderColor(0.1,0.1,0.1,1);
BtexMenuFrame:SetMovable(1);
BtexMenuFrame:EnableMouse(1);
BtexMenuFrame:SetToplevel(1);
BtexMenuFrame:SetClampedToScreen(1);
BtexMenuFrame:SetPoint("CENTER");
BtexMenuFrame:Hide();

-- Events
BtexMenuFrame:RegisterEvent("VARIABLES_LOADED");
BtexMenuFrame:SetScript("OnEvent",OnEvent);

-- text
BtexMenuFrame.text1 = BtexMenuFrame:CreateFontString(nil,"ARTWORK");
BtexMenuFrame.text1:SetFont("Interface\\AddOns\\Btex\\Menu.ttf", 18, "");
BtexMenuFrame.text1:SetPoint("TOP",0,-10);
BtexMenuFrame.text1:SetText("BTex Menu");
BtexMenuFrame.vers = BtexMenuFrame:CreateFontString(nil,"ARTWORK");
BtexMenuFrame.vers:SetFont("Interface\\AddOns\\Btex\\Btex.ttf", 8, "");
BtexMenuFrame.vers:SetPoint("TOPRIGHT",-20,-16);
BtexMenuFrame.vers:SetText("Version :"..BTEX_VERSION);
BtexMenuFrame.vers:SetTextColor(1,1,0.5);
BtexMenuFrame.text2 = BtexMenuFrame:CreateFontString(nil,"ARTWORK");
BtexMenuFrame.text2:SetFont("Interface\\AddOns\\Btex\\Btex.ttf", 8, "");
BtexMenuFrame.text2:SetPoint("TOPLEFT",10,-60);
BtexMenuFrame.text2:SetText(SKINCHOOSE);
BtexMenuFrame.text3 = BtexMenuFrame:CreateFontString(nil,"ARTWORK");
BtexMenuFrame.text3:SetFont("Interface\\AddOns\\Btex\\Btex.ttf", 8, "");
BtexMenuFrame.text3:SetPoint("TOPLEFT",10,-90);
BtexMenuFrame.text3:SetText(SETHEIGHT);
BtexMenuFrame.text4 = BtexMenuFrame:CreateFontString(nil,"ARTWORK");
BtexMenuFrame.text4:SetFont("Interface\\AddOns\\Btex\\Btex.ttf", 8, "");
BtexMenuFrame.text4:SetPoint("TOPLEFT",180,-90);
BtexMenuFrame.text4:SetText(HEIGHTDEFAULT);
BtexMenuFrame.text5 = BtexMenuFrame:CreateFontString(nil,"ARTWORK");
BtexMenuFrame.text5:SetFont("Interface\\AddOns\\Btex\\Btex.ttf", 8, "");
BtexMenuFrame.text5:SetPoint("TOPLEFT",10,-150);
BtexMenuFrame.text5:SetText(SETALPHA);
BtexMenuFrame.text6 = BtexMenuFrame:CreateFontString(nil,"ARTWORK");
BtexMenuFrame.text6:SetFont("Interface\\AddOns\\Btex\\Btex.ttf", 8, "");
BtexMenuFrame.text6:SetPoint("TOPLEFT",180,-150);
BtexMenuFrame.text6:SetText(ALPHADEFAULT);
BtexMenuFrame.text7 = BtexMenuFrame:CreateFontString(nil,"ARTWORK");
BtexMenuFrame.text7:SetFont("Interface\\AddOns\\Btex\\Btex.ttf", 8, "");
BtexMenuFrame.text7:SetPoint("TOPLEFT",10,-120);
BtexMenuFrame.text7:SetText(SETWIDTH);
BtexMenuFrame.text8 = BtexMenuFrame:CreateFontString(nil,"ARTWORK");
BtexMenuFrame.text8:SetFont("Interface\\AddOns\\Btex\\Btex.ttf", 8, "");
BtexMenuFrame.text8:SetPoint("TOPLEFT",180,-120);
BtexMenuFrame.text8:SetText(WIDHTDEFAULT);
BtexMenuFrame.placementx = BtexMenuFrame:CreateFontString(nil,"ARTWORK");
BtexMenuFrame.placementx:SetFont("Interface\\AddOns\\Btex\\Btex.ttf", 8, "");
BtexMenuFrame.placementx:SetPoint("TOPLEFT",10,-180);
BtexMenuFrame.placementx:SetText(BTEXTUREPLACEX);
BtexMenuFrame.placementy = BtexMenuFrame:CreateFontString(nil,"ARTWORK");
BtexMenuFrame.placementy:SetFont("Interface\\AddOns\\Btex\\Btex.ttf", 8, "");
BtexMenuFrame.placementy:SetPoint("TOPLEFT",180,-180);
BtexMenuFrame.placementy:SetText(BTEXTUREPLACEY);
BtexMenuFrame.Strata = BtexMenuFrame:CreateFontString(nil,"ARTWORK");
BtexMenuFrame.Strata:SetFont("Interface\\AddOns\\Btex\\Btex.ttf", 8, "");
BtexMenuFrame.Strata:SetPoint("TOPLEFT",10,-210);
BtexMenuFrame.Strata:SetText(BTEXSTRATA);
-- moving
BtexMenuFrame:SetScript("OnMouseDown",function() BtexMenuFrame:StartMoving() end);
BtexMenuFrame:SetScript("OnMouseUp",function() BtexMenuFrame:StopMovingOrSizing() end);

-- EditBox Texture Height
local function BtexEdit1(self)
TEMP_TEX_HEIGHT = BtexMenuFrame.edit1:GetNumber();
	if TEMP_TEX_HEIGHT > 1200 then 
	DEFAULT_CHAT_FRAME:AddMessage("BTEX >> HEIGHT: Value MUST be lower or equal to 1200.");
	elseif TEMP_TEX_HEIGHT <= 1 then
	DEFAULT_CHAT_FRAME:AddMessage("BTEX >> HEIGHT: Value MUST be superior to 1.");
	else
	TEX_HEIGHT = TEMP_TEX_HEIGHT;
	end
end
BtexMenuFrame.edit1 = CreateFrame("EditBox","BtexEdit1",BtexMenuFrame,"InputBoxTemplate");
BtexMenuFrame.edit1:SetWidth(45);
BtexMenuFrame.edit1:SetHeight(21);
BtexMenuFrame.edit1:SetPoint("TOPLEFT",130,-85);
BtexMenuFrame.edit1:SetAutoFocus(nil);
BtexMenuFrame.edit1:SetMaxLetters(4);
BtexMenuFrame.edit1:SetTextColor(1.0,0.82,0);
BtexMenuFrame.edit1:SetText(256);

-- EditBox Set Alpha
local function BtexEdit4(self)
TEMP_TEX_ALPHA = BtexMenuFrame.edit2:GetNumber();
	if TEMP_TEX_ALPHA > 101 then 
	DEFAULT_CHAT_FRAME:AddMessage("BTEX >> TRANSPARENCY: Value MUST be lower or equal to 100.");
	elseif TEMP_TEX_ALPHA <= 1 then
	DEFAULT_CHAT_FRAME:AddMessage("BTEX >> TRANSPARENCY: Value MUST be superior to 1.");
	else
	TEX_ALPHA = TEMP_TEX_ALPHA/100;
	end
end
BtexMenuFrame.edit2 = CreateFrame("EditBox","BtexEdit4",BtexMenuFrame,"InputBoxTemplate");
BtexMenuFrame.edit2:SetWidth(45);
BtexMenuFrame.edit2:SetHeight(21);
BtexMenuFrame.edit2:SetPoint("TOPLEFT",130,-145);
BtexMenuFrame.edit2:SetAutoFocus(nil);
BtexMenuFrame.edit2:SetMaxLetters(4);
BtexMenuFrame.edit2:SetTextColor(1.0,0.82,0);
BtexMenuFrame.edit2:SetText(100);

-- EditBox Set Width
local function BtexEditWidth(self)
TEMP_TEX_WIDTH = BtexMenuFrame.edit3:GetNumber();
	if TEMP_TEX_WIDTH <= 1 then
	DEFAULT_CHAT_FRAME:AddMessage("BTEX >> WIDTH: Value MUST be superior to 1.");
	else
	TEX_WIDTH  = TEMP_TEX_WIDTH;
	end
end
BtexMenuFrame.edit3 = CreateFrame("EditBox","BtexEditWidth",BtexMenuFrame,"InputBoxTemplate");
BtexMenuFrame.edit3:SetWidth(45);
BtexMenuFrame.edit3:SetHeight(21);
BtexMenuFrame.edit3:SetPoint("TOPLEFT",130,-115);
BtexMenuFrame.edit3:SetAutoFocus(nil);
BtexMenuFrame.edit3:SetMaxLetters(4);
BtexMenuFrame.edit3:SetTextColor(1.0,0.82,0);
BtexMenuFrame.edit3:SetText(512);

-- EditBox Set placement X
local function BtexEditPlacementX(self)
TEMP_TEX_X = BtexMenuFrame.EditPlacementX:GetNumber();
TEX_X = TEMP_TEX_X;
end
BtexMenuFrame.EditPlacementX = CreateFrame("EditBox","BtexEditPlacementX",BtexMenuFrame,"InputBoxTemplate");
BtexMenuFrame.EditPlacementX:SetWidth(45);
BtexMenuFrame.EditPlacementX:SetHeight(21);
BtexMenuFrame.EditPlacementX:SetPoint("TOPLEFT",130,-175);
BtexMenuFrame.EditPlacementX:SetAutoFocus(nil);
BtexMenuFrame.EditPlacementX:SetMaxLetters(4);
BtexMenuFrame.EditPlacementX:SetTextColor(1.0,0.82,0);
BtexMenuFrame.EditPlacementX:SetText(0);

-- EditBox Set placement Y
local function BtexEditPlacementY(self)
TEMP_TEX_Y = BtexMenuFrame.EditPlacementY:GetNumber();
TEX_Y = TEMP_TEX_Y;
end
BtexMenuFrame.EditPlacementY = CreateFrame("EditBox","BtexEditPlacementY",BtexMenuFrame,"InputBoxTemplate");
BtexMenuFrame.EditPlacementY:SetWidth(45);
BtexMenuFrame.EditPlacementY:SetHeight(21);
BtexMenuFrame.EditPlacementY:SetPoint("TOPLEFT",210,-175);
BtexMenuFrame.EditPlacementY:SetAutoFocus(nil);
BtexMenuFrame.EditPlacementY:SetMaxLetters(4);
BtexMenuFrame.EditPlacementY:SetTextColor(1.0,0.82,0);
BtexMenuFrame.EditPlacementY:SetText(0);

-- ColorPicker
BtexMenuFrame.colorPickerButton = CreateFrame("Button",nil,BtexMenuFrame,"UIPanelButtonTemplate");
BtexMenuFrame.colorPickerButton:SetNormalFontObject(BtexFont);
BtexMenuFrame.colorPickerButton:SetWidth(100);
BtexMenuFrame.colorPickerButton:SetHeight(24);
BtexMenuFrame.colorPickerButton:SetPoint("TOPLEFT",290,-173);
BtexMenuFrame.colorPickerButton:SetScript("OnClick", function() BtexColor_OnClick(); end);
BtexMenuFrame.colorPickerButton:SetText(BTEXCOLOR);

-- Close button
BtexMenuFrame.btnClose = CreateFrame("Button",nil,BtexMenuFrame,"UIPanelButtonTemplate");
BtexMenuFrame.btnClose:SetNormalFontObject(BtexFont);
BtexMenuFrame.btnClose:SetWidth(75);
BtexMenuFrame.btnClose:SetHeight(24);
BtexMenuFrame.btnClose:SetPoint("BOTTOMRIGHT",-15,15);
BtexMenuFrame.btnClose:SetScript("OnClick",function() BtexMenuFrame:Hide(); end);
BtexMenuFrame.btnClose:SetText(BTNCLOSE);

-- Apply skin button
BtexMenuFrame.Apply = CreateFrame("Button",nil,BtexMenuFrame,"UIPanelButtonTemplate");
BtexMenuFrame.Apply:SetNormalFontObject(BtexFont);
BtexMenuFrame.Apply:SetWidth(140);
BtexMenuFrame.Apply:SetHeight(24);
BtexMenuFrame.Apply:SetPoint("BOTTOMRIGHT",-100,15);
BtexMenuFrame.Apply:SetScript("OnClick",function() BtexEdit1();BtexEdit4();BtexEditWidth(); BtexEditPlacementX(); BtexEditPlacementY(); BTexMain(); end);
BtexMenuFrame.Apply:SetText(APPLYSKIN);

-- Reset config
BtexMenuFrame.reset = CreateFrame("Button",nil,BtexMenuFrame,"UIPanelButtonTemplate");
BtexMenuFrame.reset:SetNormalFontObject(BtexFont);
BtexMenuFrame.reset:SetWidth(75);
BtexMenuFrame.reset:SetHeight(24);
BtexMenuFrame.reset:SetPoint("BOTTOMRIGHT",-240,15);
BtexMenuFrame.reset:SetScript("OnClick",function() Default(); end);
BtexMenuFrame.reset:SetText(DEFAULT);

-- Viewport config
BtexMenuFrame.Viewport = CreateFrame("Button",nil,BtexMenuFrame,"UIPanelButtonTemplate");
BtexMenuFrame.Viewport:SetNormalFontObject(BtexFont);
BtexMenuFrame.Viewport:SetWidth(75);
BtexMenuFrame.Viewport:SetHeight(24);
BtexMenuFrame.Viewport:SetPoint("BOTTOMRIGHT",-320,15);
BtexMenuFrame.Viewport:SetScript("OnClick",function() BtexViewportFrame:Show(); BtexMenuFrame:Hide(); end);
BtexMenuFrame.Viewport:SetText(BTEXVIEWPORT);

--------------------------------------------------------------------------------------------------------
--                                          TEXTURE PREVIEW AND FRAME                                 --
--------------------------------------------------------------------------------------------------------
local TexturePreviewFrame = CreateFrame("Frame",nil,BtexMenuFrame);
TexturePreviewFrame:SetPoint("BOTTOMLEFT", BtexMenuFrame, "BOTTOMLEFT", 20, 45);
TexturePreviewFrame:SetWidth(360);
TexturePreviewFrame:SetHeight(200);
local texture = TexturePreviewFrame:CreateTexture(nil,"BACKGROUND");
function TexturePreview()
	texture:SetTexture("Interface\\AddOns\\BTEX\\Skins\\"..TEX_CHOICE.."-1");
	texture:SetAllPoints(TexturePreviewFrame);
	TexturePreviewFrame.texture = texture;
	TexturePreviewFrame:Show();
end

--------------------------------------------------------------------------------------------------------
--                                          Viewport                                                  --
--------------------------------------------------------------------------------------------------------
-- frame
BtexViewportFrame = CreateFrame("Frame","BtexViewportFrame",UIParent);
BtexViewportFrame:SetWidth(330);
BtexViewportFrame:SetHeight(200);
BtexViewportFrame:SetBackdrop({ bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", tile = true, tileSize = 8, edgeSize = 12, insets = { left = 2, right = 2, top = 2, bottom = 2 } });
BtexViewportFrame:SetBackdropColor(0.1,0.1,0.2,1);
BtexViewportFrame:SetBackdropBorderColor(0.1,0.1,0.1,1);
BtexViewportFrame:SetMovable(1);
BtexViewportFrame:EnableMouse(1);
BtexViewportFrame:SetToplevel(1);
BtexViewportFrame:SetClampedToScreen(1);
BtexViewportFrame:SetPoint("CENTER");
BtexViewportFrame:Hide();
-- moving
BtexViewportFrame:SetScript("OnMouseDown",function() BtexViewportFrame:StartMoving() end);
BtexViewportFrame:SetScript("OnMouseUp",function() BtexViewportFrame:StopMovingOrSizing() end);

-- text
BtexViewportFrame.text1 = BtexViewportFrame:CreateFontString(nil,"ARTWORK");
BtexViewportFrame.text1:SetFont("Interface\\AddOns\\Btex\\Menu.ttf", 12, "");
BtexViewportFrame.text1:SetPoint("TOP",0,-10);
BtexViewportFrame.text1:SetText("Viewport settings");
BtexViewportFrame.text2 = BtexViewportFrame:CreateFontString(nil,"ARTWORK");
BtexViewportFrame.text2:SetFont("Interface\\AddOns\\Btex\\Btex.ttf", 8, "");
BtexViewportFrame.text2:SetPoint("TOPLEFT",30,-30);
BtexViewportFrame.text2:SetText(VIEWPORTTXT1);
BtexViewportFrame.right = BtexViewportFrame:CreateFontString(nil,"ARTWORK");
BtexViewportFrame.right:SetFont("Interface\\AddOns\\Btex\\Btex.ttf", 8, "");
BtexViewportFrame.right:SetPoint("TOPLEFT",50,-85);
BtexViewportFrame.right:SetText(VIEWPORTRIGHT);
BtexViewportFrame.left = BtexViewportFrame:CreateFontString(nil,"ARTWORK");
BtexViewportFrame.left:SetFont("Interface\\AddOns\\Btex\\Btex.ttf", 8, "");
BtexViewportFrame.left:SetPoint("TOPLEFT",50,-110);
BtexViewportFrame.left:SetText(VIEWPORTLEFT);
BtexViewportFrame.bottom = BtexViewportFrame:CreateFontString(nil,"ARTWORK");
BtexViewportFrame.bottom:SetFont("Interface\\AddOns\\Btex\\Btex.ttf", 8, "");
BtexViewportFrame.bottom:SetPoint("TOPLEFT",190,-85);
BtexViewportFrame.bottom:SetText(VIEWPORTBOTTOM);
BtexViewportFrame.top = BtexViewportFrame:CreateFontString(nil,"ARTWORK");
BtexViewportFrame.top:SetFont("Interface\\AddOns\\Btex\\Btex.ttf", 8, "");
BtexViewportFrame.top:SetPoint("TOPLEFT",190,-110);
BtexViewportFrame.top:SetText(VIEWPORTTOP);

-- EditBox Set viewport RIGHT
local function BtexEditViewportBL(self)
TEMP_TEX_VIEWPORT_BL = BtexViewportFrame.EditBL:GetNumber();
	if TEMP_TEX_VIEWPORT_BL  < 0 then
	DEFAULT_CHAT_FRAME:AddMessage("BTEX >> VIEWPORT: Value MUST be superior to -1.");
	else
	TEX_VIEWPORT_BL  = TEMP_TEX_VIEWPORT_BL ;
	end
end
BtexViewportFrame.EditBL = CreateFrame("EditBox","BtexEditViewportBL",BtexViewportFrame,"InputBoxTemplate");
BtexViewportFrame.EditBL:SetWidth(45);
BtexViewportFrame.EditBL:SetHeight(21);
BtexViewportFrame.EditBL:SetPoint("TOPLEFT",130,-80);
BtexViewportFrame.EditBL:SetAutoFocus(nil);
BtexViewportFrame.EditBL:SetMaxLetters(4);
BtexViewportFrame.EditBL:SetTextColor(1.0,0.82,0);
BtexViewportFrame.EditBL:SetText(0);

-- EditBox Set Set viewport BOTTOM
local function BtexEditViewportBR(self)
TEMP_TEX_VIEWPORT_BR = BtexViewportFrame.EditBR:GetNumber();
	if TEMP_TEX_VIEWPORT_BR  < 0 then
	DEFAULT_CHAT_FRAME:AddMessage("BTEX >> VIEWPORT: Value MUST be superior to -1.");
	else
	TEX_VIEWPORT_BR  = TEMP_TEX_VIEWPORT_BR ;
	end
end
BtexViewportFrame.EditBR = CreateFrame("EditBox","BtexEditViewportBR",BtexViewportFrame,"InputBoxTemplate");
BtexViewportFrame.EditBR:SetWidth(45);
BtexViewportFrame.EditBR:SetHeight(21);
BtexViewportFrame.EditBR:SetPoint("TOPLEFT",230,-80);
BtexViewportFrame.EditBR:SetAutoFocus(nil);
BtexViewportFrame.EditBR:SetMaxLetters(4);
BtexViewportFrame.EditBR:SetTextColor(1.0,0.82,0);
BtexViewportFrame.EditBR:SetText(0);

-- EditBox Set viewport LEFT
local function BtexEditViewportTL(self)
TEMP_TEX_VIEWPORT_TL = BtexViewportFrame.EditTL:GetNumber();
	if TEMP_TEX_VIEWPORT_TL  < 0 then
	DEFAULT_CHAT_FRAME:AddMessage("BTEX >> VIEWPORT: Value MUST be superior to -1.");
	else
	TEX_VIEWPORT_TL  = TEMP_TEX_VIEWPORT_TL ;
	end
end
BtexViewportFrame.EditTL = CreateFrame("EditBox","BtexEditViewportTL",BtexViewportFrame,"InputBoxTemplate");
BtexViewportFrame.EditTL:SetWidth(45);
BtexViewportFrame.EditTL:SetHeight(21);
BtexViewportFrame.EditTL:SetPoint("TOPLEFT",130,-105);
BtexViewportFrame.EditTL:SetAutoFocus(nil);
BtexViewportFrame.EditTL:SetMaxLetters(4);
BtexViewportFrame.EditTL:SetTextColor(1.0,0.82,0);
BtexViewportFrame.EditTL:SetText(0);

-- EditBox Set Set viewport TOP
local function BtexEditViewportTR(self)
TEMP_TEX_VIEWPORT_TR = BtexViewportFrame.EditTR:GetNumber();
	if TEMP_TEX_VIEWPORT_TR  < 0 then
	DEFAULT_CHAT_FRAME:AddMessage("BTEX >> VIEWPORT: Value MUST be superior to -1.");
	else
	TEX_VIEWPORT_TR  = TEMP_TEX_VIEWPORT_TR ;
	end
end
BtexViewportFrame.EditTR = CreateFrame("EditBox","BtexEditViewportTR",BtexViewportFrame,"InputBoxTemplate");
BtexViewportFrame.EditTR:SetWidth(45);
BtexViewportFrame.EditTR:SetHeight(21);
BtexViewportFrame.EditTR:SetPoint("TOPLEFT",230,-105);
BtexViewportFrame.EditTR:SetAutoFocus(nil);
BtexViewportFrame.EditTR:SetMaxLetters(4);
BtexViewportFrame.EditTR:SetTextColor(1.0,0.82,0);
BtexViewportFrame.EditTR:SetText(0);

-- Close button
BtexViewportFrame.btnClose = CreateFrame("Button",nil,BtexViewportFrame,"UIPanelButtonTemplate");
BtexViewportFrame.btnClose:SetNormalFontObject(BtexFont);
BtexViewportFrame.btnClose:SetWidth(75);
BtexViewportFrame.btnClose:SetHeight(24);
BtexViewportFrame.btnClose:SetPoint("BOTTOMRIGHT",-15,15);
BtexViewportFrame.btnClose:SetScript("OnClick",function() BtexViewportFrame:Hide(); BtexMenuFrame:Show(); end);
BtexViewportFrame.btnClose:SetText(BTNCLOSE);

-- Apply viewport button
BtexViewportFrame.Apply = CreateFrame("Button",nil,BtexViewportFrame,"UIPanelButtonTemplate");
BtexViewportFrame.Apply:SetNormalFontObject(BtexFont);
BtexViewportFrame.Apply:SetWidth(140);
BtexViewportFrame.Apply:SetHeight(24);
BtexViewportFrame.Apply:SetPoint("BOTTOMRIGHT",-100,15);
BtexViewportFrame.Apply:SetScript("OnClick",function() BtexEditViewportBL();BtexEditViewportBR();BtexEditViewportTL();BtexEditViewportTR(); BtexViewport(); end);
BtexViewportFrame.Apply:SetText(SETVIEWPORT);

-- Reset config
BtexViewportFrame.reset = CreateFrame("Button",nil,BtexViewportFrame,"UIPanelButtonTemplate");
BtexViewportFrame.reset:SetNormalFontObject(BtexFont);
BtexViewportFrame.reset:SetWidth(75);
BtexViewportFrame.reset:SetHeight(24);
BtexViewportFrame.reset:SetPoint("BOTTOMRIGHT",-240,15);
BtexViewportFrame.reset:SetScript("OnClick",function() TEX_VIEWPORT_BL = 0; TEX_VIEWPORT_BR = 0; TEX_VIEWPORT_TL = 0; TEX_VIEWPORT_TR = 0; BtexViewport(); end);
BtexViewportFrame.reset:SetText(DEFAULT);
--------------------------------------------------------------------------------------------------------
--                                          LOAD CUSTOM TEXTURE                                       --
--------------------------------------------------------------------------------------------------------
-- frame
local BtexCustomFrame = CreateFrame("Frame","btexframeconfig",UIParent);
BtexCustomFrame:SetWidth(450);
BtexCustomFrame:SetHeight(340);
BtexCustomFrame:SetBackdrop({ bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", tile = true, tileSize = 8, edgeSize = 12, insets = { left = 2, right = 2, top = 2, bottom = 2 } });
BtexCustomFrame:SetBackdropColor(0.1,0.1,0.2,1);
BtexCustomFrame:SetBackdropBorderColor(0.1,0.1,0.1,1);
BtexCustomFrame:SetMovable(1);
BtexCustomFrame:EnableMouse(1);
BtexCustomFrame:SetToplevel(1);
BtexCustomFrame:SetClampedToScreen(1);
BtexCustomFrame:SetPoint("CENTER");
BtexCustomFrame:Hide();
-- moving
BtexCustomFrame:SetScript("OnMouseDown",function() BtexCustomFrame:StartMoving() end);
BtexCustomFrame:SetScript("OnMouseUp",function() BtexCustomFrame:StopMovingOrSizing() end);

-- text
BtexCustomFrame.text1 = BtexCustomFrame:CreateFontString(nil,"ARTWORK");
BtexCustomFrame.text1:SetFont("Interface\\AddOns\\Btex\\Menu.ttf", 12, "");
BtexCustomFrame.text1:SetPoint("TOP",0,-10);
BtexCustomFrame.text1:SetText("Load Custom Texture pack");
BtexCustomFrame.text2 = BtexCustomFrame:CreateFontString(nil,"ARTWORK");
BtexCustomFrame.text2:SetFont("Interface\\AddOns\\Btex\\Btex.ttf", 8, "");
BtexCustomFrame.text2:SetPoint("TOPLEFT",10,-50);
BtexCustomFrame.text2:SetText(CUSTOMRULES1);
BtexCustomFrame.text3 = BtexCustomFrame:CreateFontString(nil,"ARTWORK");
BtexCustomFrame.text3:SetFont("Interface\\AddOns\\Btex\\Btex.ttf", 8, "");
BtexCustomFrame.text3:SetPoint("TOPLEFT",10,-65);
BtexCustomFrame.text3:SetText(CUSTOMRULES2);
BtexCustomFrame.text4 = BtexCustomFrame:CreateFontString(nil,"ARTWORK");
BtexCustomFrame.text4:SetFont("Interface\\AddOns\\Btex\\Btex.ttf", 8, "");
BtexCustomFrame.text4:SetPoint("TOPLEFT",10,-80);
BtexCustomFrame.text4:SetText(CUSTOMRULES3);
BtexCustomFrame.text5 = BtexCustomFrame:CreateFontString(nil,"ARTWORK");
BtexCustomFrame.text5:SetFont("Interface\\AddOns\\Btex\\Btex.ttf", 8, "");
BtexCustomFrame.text5:SetPoint("TOPLEFT",10,-95);
BtexCustomFrame.text5:SetText(CUSTOMRULES4);
BtexCustomFrame.text6 = BtexCustomFrame:CreateFontString(nil,"ARTWORK");
BtexCustomFrame.text6:SetFont("Interface\\AddOns\\Btex\\Btex.ttf", 8, "");
BtexCustomFrame.text6:SetPoint("TOPLEFT",10,-110);
BtexCustomFrame.text6:SetText(CUSTOMRULES5);
BtexCustomFrame.text7 = BtexCustomFrame:CreateFontString(nil,"ARTWORK");
BtexCustomFrame.text7:SetFont("Interface\\AddOns\\Btex\\Btex.ttf", 8, "");
BtexCustomFrame.text7:SetPoint("TOPLEFT",10,-125);
BtexCustomFrame.text7:SetText(CUSTOMRULES6);
BtexCustomFrame.text8 = BtexCustomFrame:CreateFontString(nil,"ARTWORK");
BtexCustomFrame.text8:SetFont("Interface\\AddOns\\Btex\\Btex.ttf", 8, "");
BtexCustomFrame.text8:SetPoint("TOPLEFT",10,-150);
BtexCustomFrame.text8:SetText(CUSTOMSETNAME );
BtexCustomFrame.text9 = BtexCustomFrame:CreateFontString(nil,"ARTWORK");
BtexCustomFrame.text9:SetFont("Interface\\AddOns\\Btex\\Btex.ttf", 8, "");
BtexCustomFrame.text9:SetPoint("TOPLEFT",10,-170);
BtexCustomFrame.text9:SetText(SETHEIGHT );
BtexCustomFrame.text10 = BtexCustomFrame:CreateFontString(nil,"ARTWORK");
BtexCustomFrame.text10:SetFont("Interface\\AddOns\\Btex\\Btex.ttf", 8, "");
BtexCustomFrame.text10:SetPoint("TOPLEFT",10,-210);
BtexCustomFrame.text10:SetText(SETALPHA);
BtexCustomFrame.text11 = BtexCustomFrame:CreateFontString(nil,"ARTWORK");
BtexCustomFrame.text11:SetFont("Interface\\AddOns\\Btex\\Btex.ttf", 8, "");
BtexCustomFrame.text11:SetPoint("TOPLEFT",10,-190);
BtexCustomFrame.text11:SetText(SETWIDTH);
BtexCustomFrame.placementx = BtexCustomFrame:CreateFontString(nil,"ARTWORK");
BtexCustomFrame.placementx:SetFont("Interface\\AddOns\\Btex\\Btex.ttf", 8, "");
BtexCustomFrame.placementx:SetPoint("TOPLEFT",10,-230);
BtexCustomFrame.placementx:SetText(BTEXTUREPLACEX);
BtexCustomFrame.placementy = BtexCustomFrame:CreateFontString(nil,"ARTWORK");
BtexCustomFrame.placementy:SetFont("Interface\\AddOns\\Btex\\Btex.ttf", 8, "");
BtexCustomFrame.placementy:SetPoint("TOPLEFT",180,-230);
BtexCustomFrame.placementy:SetText(BTEXTUREPLACEY);
BtexCustomFrame.Strata = BtexCustomFrame:CreateFontString(nil,"ARTWORK");
BtexCustomFrame.Strata:SetFont("Interface\\AddOns\\Btex\\Btex.ttf", 8, "");
BtexCustomFrame.Strata:SetPoint("TOPLEFT",10,-250);
BtexCustomFrame.Strata:SetText(BTEXSTRATA);

-- editbox Set Custom texture
BtexCustomFrame.edit1 = CreateFrame("EditBox","BtexEdit2",BtexCustomFrame,"InputBoxTemplate");
BtexCustomFrame.edit1:SetWidth(120);
BtexCustomFrame.edit1:SetHeight(20);
BtexCustomFrame.edit1:SetPoint("TOPLEFT",130,-145);
BtexCustomFrame.edit1:SetAutoFocus(nil);
BtexCustomFrame.edit1:SetTextColor(1.0,0.82,0);
BtexCustomFrame.edit1:SetText("Custom Texure");
local function BtexEdit2(self)
TEMP_TEX_CHOICE = BtexCustomFrame.edit1:GetText();
	if TEMP_TEX_CHOICE == nil then 
	DEFAULT_CHAT_FRAME:AddMessage("BTEX >> TEXTURE NAME: Value cannot be nil.");
	else
	TEX_CHOICE = TEMP_TEX_CHOICE;
	end
end

-- editbox Set Custom Height
BtexCustomFrame.edit2 = CreateFrame("EditBox","BtexEdit3",BtexCustomFrame,"InputBoxTemplate");
BtexCustomFrame.edit2:SetWidth(45);
BtexCustomFrame.edit2:SetHeight(20);
BtexCustomFrame.edit2:SetPoint("TOPLEFT",130,-165);
BtexCustomFrame.edit2:SetAutoFocus(nil);
BtexCustomFrame.edit2:SetTextColor(1.0,0.82,0);
BtexCustomFrame.edit2:SetText(256);
local function BtexEdit3(self)
TEMP_TEX_HEIGHT = BtexCustomFrame.edit2:GetNumber();
	if TEMP_TEX_HEIGHT >= 1200 then 
	DEFAULT_CHAT_FRAME:AddMessage("BTEX >> HEIGHT: Value MUST be lower or equal to 1200.");
	elseif TEMP_TEX_HEIGHT <= 1 then
	DEFAULT_CHAT_FRAME:AddMessage("BTEX >> HEIGHT: Value MUST be superior to 1.");
	else
	TEX_HEIGHT = TEMP_TEX_HEIGHT;
	end
end

-- EditBox Set Custom Width
local function BtexEditCustomWidth(self)
TEMP_TEX_WIDTH = BtexCustomFrame.edit4:GetNumber();
	if TEMP_TEX_WIDTH <= 1 then
	DEFAULT_CHAT_FRAME:AddMessage("BTEX >> WIDTH: Value MUST be superior to 1.");
	else
	TEX_WIDTH  = TEMP_TEX_WIDTH;
	end
end
BtexCustomFrame.edit4 = CreateFrame("EditBox","BtexEditCustomWidth",BtexCustomFrame,"InputBoxTemplate");
BtexCustomFrame.edit4:SetWidth(45);
BtexCustomFrame.edit4:SetHeight(21);
BtexCustomFrame.edit4:SetPoint("TOPLEFT",130,-185);
BtexCustomFrame.edit4:SetAutoFocus(nil);
BtexCustomFrame.edit4:SetMaxLetters(4);
BtexCustomFrame.edit4:SetTextColor(1.0,0.82,0);
BtexCustomFrame.edit4:SetText(512);

-- EditBox Set Custom Alpha
local function BtexEdit5(self)
TEMP_TEX_ALPHA = BtexCustomFrame.edit3:GetNumber();
	if TEMP_TEX_ALPHA > 101 then 
	DEFAULT_CHAT_FRAME:AddMessage("BTEX >> TRANSPARENCY: Value MUST be lower or equal to 100.");
	elseif TEMP_TEX_ALPHA <= 1 then
	DEFAULT_CHAT_FRAME:AddMessage("BTEX >> TRANSPARENCY: Value MUST be superior to 1.");
	else
	TEX_ALPHA = TEMP_TEX_ALPHA/100;
	end
end
BtexCustomFrame.edit3 = CreateFrame("EditBox","BtexEdit5",BtexCustomFrame,"InputBoxTemplate");
BtexCustomFrame.edit3:SetWidth(45);
BtexCustomFrame.edit3:SetHeight(21);
BtexCustomFrame.edit3:SetPoint("TOPLEFT",130,-205);
BtexCustomFrame.edit3:SetAutoFocus(nil);
BtexCustomFrame.edit3:SetMaxLetters(4);
BtexCustomFrame.edit3:SetTextColor(1.0,0.82,0);
BtexCustomFrame.edit3:SetText(100);

-- EditBox Set Custom placement X
local function BtexEditPlacementXCustom(self)
TEMP_TEX_X = BtexCustomFrame.EditPlacementX:GetNumber();
	if TEMP_TEX_X  < 0 then
	DEFAULT_CHAT_FRAME:AddMessage("BTEX >> POSITION X :Value MUST be superior to -1.");
	else
	TEX_X  = TEMP_TEX_X ;
	end
end
BtexCustomFrame.EditPlacementX = CreateFrame("EditBox","BtexEditPlacementXCustom",BtexCustomFrame,"InputBoxTemplate");
BtexCustomFrame.EditPlacementX:SetWidth(45);
BtexCustomFrame.EditPlacementX:SetHeight(21);
BtexCustomFrame.EditPlacementX:SetPoint("TOPLEFT",130,-225);
BtexCustomFrame.EditPlacementX:SetAutoFocus(nil);
BtexCustomFrame.EditPlacementX:SetMaxLetters(4);
BtexCustomFrame.EditPlacementX:SetTextColor(1.0,0.82,0);
BtexCustomFrame.EditPlacementX:SetText(0);

-- EditBox Set Custom placement Y
local function BtexEditPlacementYCustom(self)
TEMP_TEX_Y = BtexCustomFrame.EditPlacementY:GetNumber();
	if TEMP_TEX_Y  < 0 then
	DEFAULT_CHAT_FRAME:AddMessage("BTEX >> POSITION Y :Value MUST be superior to -1.");
	else
	TEX_Y  = TEMP_TEX_Y ;
	end
end
BtexCustomFrame.EditPlacementY = CreateFrame("EditBox","BtexEditPlacementYCustom",BtexCustomFrame,"InputBoxTemplate");
BtexCustomFrame.EditPlacementY:SetWidth(45);
BtexCustomFrame.EditPlacementY:SetHeight(21);
BtexCustomFrame.EditPlacementY:SetPoint("TOPLEFT",210,-225);
BtexCustomFrame.EditPlacementY:SetAutoFocus(nil);
BtexCustomFrame.EditPlacementY:SetMaxLetters(4);
BtexCustomFrame.EditPlacementY:SetTextColor(1.0,0.82,0);
BtexCustomFrame.EditPlacementY:SetText(0);

-- ColorPicker
BtexCustomFrame.colorPickerButton = CreateFrame("Button",nil,BtexCustomFrame,"UIPanelButtonTemplate");
BtexCustomFrame.colorPickerButton:SetNormalFontObject(BtexFont);
BtexCustomFrame.colorPickerButton:SetWidth(100);
BtexCustomFrame.colorPickerButton:SetHeight(24);
BtexCustomFrame.colorPickerButton:SetPoint("TOPLEFT",290,-245);
BtexCustomFrame.colorPickerButton:SetScript("OnClick", function() BtexColor_OnClick(); end);
BtexCustomFrame.colorPickerButton:SetText(BTEXCOLOR);

-- Close button
BtexCustomFrame.btnClose = CreateFrame("Button",nil,BtexCustomFrame,"UIPanelButtonTemplate");
BtexCustomFrame.btnClose:SetNormalFontObject(BtexFont);
BtexCustomFrame.btnClose:SetWidth(75);
BtexCustomFrame.btnClose:SetHeight(24);
BtexCustomFrame.btnClose:SetPoint("BOTTOMRIGHT",-15,15);
BtexCustomFrame.btnClose:SetScript("OnClick",function() BtexCustomFrame:Hide(); end);
BtexCustomFrame.btnClose:SetText(BTNCLOSE);

-- Cancel button
BtexCustomFrame.btnCanc = CreateFrame("Button",nil,BtexCustomFrame,"UIPanelButtonTemplate");
BtexCustomFrame.btnCanc:SetNormalFontObject(BtexFont);
BtexCustomFrame.btnCanc:SetWidth(75);
BtexCustomFrame.btnCanc:SetHeight(24);
BtexCustomFrame.btnCanc:SetPoint("BOTTOMRIGHT",-100,15);
BtexCustomFrame.btnCanc:SetScript("OnClick",function() BtexCustomFrame:Hide(); BtexMenuFrame:Show(); end);
BtexCustomFrame.btnCanc:SetText(BTNCANCEL);

-- Apply skin button
BtexCustomFrame.Apply = CreateFrame("Button",nil,BtexCustomFrame,"UIPanelButtonTemplate");
BtexCustomFrame.Apply:SetNormalFontObject(BtexFont);
BtexCustomFrame.Apply:SetWidth(140);
BtexCustomFrame.Apply:SetHeight(24);
BtexCustomFrame.Apply:SetPoint("BOTTOMRIGHT",-190,15);
BtexCustomFrame.Apply:SetScript("OnClick",function() BtexEdit2(); BtexEdit3(); BtexEdit5(); BtexEditCustomWidth(); BtexEditPlacementXCustom(); BtexEditPlacementYCustom(); BTexMain(); end);
BtexCustomFrame.Apply:SetText(APPLYSKIN);

--------------------------------------------------------------------------------------------------------
--                                             DROPDOWN MENU SKIN CHOOSE                              --
--------------------------------------------------------------------------------------------------------
local BtexDropDownMenu = CreateFrame("Frame", "BtexDropDownMenu", BtexMenuFrame, "UIDropDownMenuTemplate"); 
BtexDropDownMenu:SetPoint("TOPLEFT",106,-55);
UIDropDownMenu_SetWidth(BtexDropDownMenu, 155);
-- initialise fonction
function BtexDropDownMenu_Initialise()
	level = 1 ;
	info = UIDropDownMenu_CreateInfo();
	--menu item1
	info.text = "Dark Shadow 1"; 
	info.value = 0; 
	info.func = function() BtexDropDownMenuItem_OnClick() end; 
	info.owner = BtexDropDownMenu; 
	info.checked = nil; 
	info.icon = nil; 
	UIDropDownMenu_AddButton(info, level); 
	--menu item2
	info.text = "Dark Shadow 2";
	info.value = 1;
	info.func = function() BtexDropDownMenuItem_OnClick() end;
	info.owner = BtexDropDownMenu;
	info.checked = nil;
	info.icon = nil;
	UIDropDownMenu_AddButton(info, level);
	--menu item3
	info.text = "Dark Shadow 3";
	info.value = 2;
	info.func = function() BtexDropDownMenuItem_OnClick() end;
	info.owner = BtexDropDownMenu;
	info.checked = nil;
	info.icon = nil;
	UIDropDownMenu_AddButton(info, level);
	--menu item4
	info.text = "IceDragon";
	info.value = 3;
	info.func = function() BtexDropDownMenuItem_OnClick() end;
	info.owner = BtexDropDownMenu;
	info.checked = nil;
	info.icon = nil;
	UIDropDownMenu_AddButton(info, level);
	--menu item5
	info.text = "IceDragon remake with pet Bar";
	info.value = 4;
	info.func = function() BtexDropDownMenuItem_OnClick() end;
	info.owner = BtexDropDownMenu;
	info.checked = nil;
	info.icon = nil;
	UIDropDownMenu_AddButton(info, level);
	--menu item5
	info.text = "IceDragon remake no pet Bar";
	info.value = 5;
	info.func = function() BtexDropDownMenuItem_OnClick() end;
	info.owner = BtexDropDownMenu;
	info.checked = nil;
	info.icon = nil;
	UIDropDownMenu_AddButton(info, level);
	--menu item6
	info.text = "Warcraft Classic";
	info.value = 6;
	info.func = function() BtexDropDownMenuItem_OnClick() end;
	info.owner = BtexDropDownMenu;
	info.checked = nil;
	info.icon = nil;
	UIDropDownMenu_AddButton(info, level);
	--menu item7
	info.text = "RedFury";
	info.value = 7;
	info.func = function() BtexDropDownMenuItem_OnClick() end;
	info.owner = BtexDropDownMenu;
	info.checked = nil;
	info.icon = nil;
	UIDropDownMenu_AddButton(info, level);
	--menu item8
	info.text = "Fade Black";
	info.value = 8;
	info.func = function() BtexDropDownMenuItem_OnClick() end;
	info.owner = BtexDropDownMenu;
	info.checked = nil;
	info.icon = nil;
	UIDropDownMenu_AddButton(info, level);
	--menu item9
	info.text = "Simple Black";
	info.value = 9;
	info.func = function() BtexDropDownMenuItem_OnClick() end;
	info.owner = BtexDropDownMenu;
	info.checked = nil;
	info.icon = nil;
	UIDropDownMenu_AddButton(info, level);
	--menu item10
	info.text = "Wall";
	info.value = 10;
	info.func = function() BtexDropDownMenuItem_OnClick() end;
	info.owner = BtexDropDownMenu;
	info.checked = nil;
	info.icon = nil;
	UIDropDownMenu_AddButton(info, level);
	--menu item11
	info.text = "White Dragon";
	info.value = 11;
	info.func = function() BtexDropDownMenuItem_OnClick() end;
	info.owner = BtexDropDownMenu;
	info.checked = nil;
	info.icon = nil;
	UIDropDownMenu_AddButton(info, level);
	--menu item12
	info.text = "<CUSTOM SKIN> (open a new window)";
	info.value = 12;
	info.func = function() BtexDropDownMenuItem_OnClick() end;
	info.owner = BtexDropDownMenu;
	info.checked = nil;
	info.icon = nil;
	UIDropDownMenu_AddButton(info, level);
	--menu item13
	info.text = "No Texture";
	info.value = 13;
	info.func = function() BtexDropDownMenuItem_OnClick() end;
	info.owner = BtexDropDownMenu;
	info.checked = nil;
	info.icon = nil;
	UIDropDownMenu_AddButton(info, level);
	--menu item14
	info.text = "Demonic";
	info.value = 14;
	info.func = function() BtexDropDownMenuItem_OnClick() end;
	info.owner = BtexDropDownMenu;
	info.checked = nil;
	info.icon = nil;
	UIDropDownMenu_AddButton(info, level);
end
-- Initialise
UIDropDownMenu_Initialize(BtexDropDownMenu, BtexDropDownMenu_Initialise);
ToggleDropDownMenu(1, nil, BtexDropDownMenu, self, -20, 0);
-- Choice
function BtexDropDownMenuItem_OnClick()
  UIDropDownMenu_SetSelectedValue(this.owner, this.value);
  if (this.value == 0) then
  TEX_CHOICE = "DS1";
  TexturePreview();
  elseif (this.value == 1) then
  TEX_CHOICE = "DS2";
  TexturePreview();
  elseif (this.value == 2) then
  TEX_CHOICE = "DS3";
  TexturePreview();
  elseif (this.value == 3) then
  TEX_CHOICE = "ID";
  TexturePreview();
  elseif (this.value == 4) then
  TEX_CHOICE = "IDrP";
  TexturePreview();
  elseif (this.value == 5) then
  TEX_CHOICE = "IDr";
  TexturePreview();
  elseif (this.value == 6) then
  TEX_CHOICE = "WC";
  TexturePreview();
  elseif (this.value == 7) then
  TEX_CHOICE = "RF";
  TexturePreview();
  elseif (this.value == 8) then
  TEX_CHOICE = "FB";
  TexturePreview();
  elseif (this.value == 9) then
  TEX_CHOICE = "B";
  TexturePreview();
  elseif (this.value == 10) then
  TEX_CHOICE = "Wall";
  TexturePreview();
  elseif (this.value == 11) then
  TEX_CHOICE = "WD";
  TexturePreview();
  elseif (this.value == 12) then
  TEX_CHOICE = "Custom Texture"
  BtexMenuFrame:Hide();
  BtexCustomFrame:Show();
  elseif (this.value == 13) then
  TEX_CHOICE = "NONE"
  TexturePreviewFrame:Hide();
  elseif (this.value == 14) then
  TEX_CHOICE = "D"
  TexturePreviewFrame:Hide();
  end
end

--------------------------------------------------------------------------------------------------------
--                                          DropDown FRAME STRATA MENU                                --
--------------------------------------------------------------------------------------------------------
local BtexSTRATADropDownMenu = CreateFrame("Frame", "BtexSTRATADropDownMenu", BtexMenuFrame, "UIDropDownMenuTemplate"); 
BtexSTRATADropDownMenu:SetPoint("TOPLEFT",106,-200);
UIDropDownMenu_SetWidth(BtexSTRATADropDownMenu, 145);
-- initialise fonction
function BtexSTRATADropDownMenu_Initialise()
	level = 1 ;
	info = UIDropDownMenu_CreateInfo();
	--menu item0
	info.text = "BACKGROUND(recommanded)"; 
	info.value = 0; 
	info.func = function() BtexSTRATADropDownMenu_OnClick() end; 
	info.owner = BtexSTRATADropDownMenu; 
	info.checked = nil; 
	info.icon = nil; 
	UIDropDownMenu_AddButton(info, level);
	--menu item1
	info.text = "LOW"; 
	info.value = 1; 
	info.func = function() BtexSTRATADropDownMenu_OnClick() end; 
	info.owner = BtexSTRATADropDownMenu; 
	info.checked = nil; 
	info.icon = nil; 
	UIDropDownMenu_AddButton(info, level);
	--menu item2
	info.text = "MEDIUM"; 
	info.value = 2; 
	info.func = function() BtexSTRATADropDownMenu_OnClick() end; 
	info.owner = BtexSTRATADropDownMenu; 
	info.checked = nil; 
	info.icon = nil; 
	UIDropDownMenu_AddButton(info, level);
end
-- Initialise
UIDropDownMenu_Initialize(BtexSTRATADropDownMenu, BtexSTRATADropDownMenu_Initialise);
ToggleDropDownMenu(1, nil, BtexSTRATADropDownMenu, self, -20, 0);
-- Choice
function BtexSTRATADropDownMenu_OnClick()
  UIDropDownMenu_SetSelectedValue(this.owner, this.value);
  if (this.value == 0) then
  TEX_STRATA = "BACKGROUND";
  TEX_CHAT = 0;
  elseif (this.value == 1) then
  TEX_STRATA = "LOW";
  TEX_CHAT = 1;
  elseif (this.value == 2) then
  TEX_STRATA = "MEDIUM";
  TEX_CHAT = 1;
  end
end

--------------------------------------------------------------------------------------------------------
--                                          DropDown FRAME STRATA CUSTOM                              --
--------------------------------------------------------------------------------------------------------
local BtexSTRATADropDownMenuCUSTOM = CreateFrame("Frame", "BtexSTRATADropDownMenuCUSTOM", BtexCustomFrame, "UIDropDownMenuTemplate"); 
BtexSTRATADropDownMenuCUSTOM:SetPoint("TOPLEFT",106,-245);
UIDropDownMenu_SetWidth(BtexSTRATADropDownMenuCUSTOM, 145);
-- initialise fonction
function BtexSTRATADropDownMenuCUSTOM_Initialise()
	level = 1 ;
	info = UIDropDownMenu_CreateInfo();
	--menu item0
	info.text = "BACKGROUND(recommanded)"; 
	info.value = 0; 
	info.func = function() BtexSTRATADropDownMenuCUSTOM_OnClick() end; 
	info.owner = BtexSTRATADropDownMenuCUSTOM; 
	info.checked = nil; 
	info.icon = nil; 
	UIDropDownMenu_AddButton(info, level);
	--menu item1
	info.text = "LOW"; 
	info.value = 1; 
	info.func = function() BtexSTRATADropDownMenuCUSTOM_OnClick() end; 
	info.owner = BtexSTRATADropDownMenuCUSTOM; 
	info.checked = nil; 
	info.icon = nil; 
	UIDropDownMenu_AddButton(info, level);
	--menu item2
	info.text = "MEDIUM"; 
	info.value = 2; 
	info.func = function() BtexSTRATADropDownMenuCUSTOM_OnClick() end; 
	info.owner = BtexSTRATADropDownMenuCUSTOM; 
	info.checked = nil; 
	info.icon = nil; 
	UIDropDownMenu_AddButton(info, level);
end
-- Initialise
UIDropDownMenu_Initialize(BtexSTRATADropDownMenuCUSTOM, BtexSTRATADropDownMenuCUSTOM_Initialise);
ToggleDropDownMenu(1, nil, BtexSTRATADropDownMenuCUSTOM, self, -20, 0);
-- Choice
function BtexSTRATADropDownMenuCUSTOM_OnClick()
  UIDropDownMenu_SetSelectedValue(this.owner, this.value);
  if (this.value == 0) then
  TEX_STRATA = "BACKGROUND";
  TEX_CHAT = 0;
  elseif (this.value == 1) then
  TEX_STRATA = "LOW";
  TEX_CHAT = 1;
  elseif (this.value == 2) then
  TEX_STRATA = "MEDIUM";
  TEX_CHAT = 1;
  end
end

--------------------------------------------------------------------------------------------------------
--                                              SLASH MENU                                            --
--------------------------------------------------------------------------------------------------------
_G["SLASH_Btex1"] = "/btex";
_G["SLASH_Btex2"] = "/bx";
SlashCmdList["Btex"] = function(cmd)
	-- Extract Parameters
	local param1, param2 = cmd:match("^([^%s]+)%s*(.*)$");
	param1 = (param1 and param1:lower() or cmd:lower());
	-- Options
	if (param1 == "") then
		DEFAULT_CHAT_FRAME:AddMessage("|c00bfffffBtex|r " ..BTEX_VERSION.." Slash command :", 0.0, .80, 1);
		DEFAULT_CHAT_FRAME:AddMessage(SLASHBX);
		DEFAULT_CHAT_FRAME:AddMessage(SLASHCONF);
		DEFAULT_CHAT_FRAME:AddMessage(SLASHRESET);
		DEFAULT_CHAT_FRAME:AddMessage(SLASHREMOVE);
		DEFAULT_CHAT_FRAME:AddMessage(SLASHCUSTOM);
		DEFAULT_CHAT_FRAME:AddMessage(SLASHVIEWPORT);
	end
	if cmd == "menu" then
		BtexMenuFrame:Show();
	end	
	if cmd == "reset" then
		Default();
	end	
	if cmd == "remove" then
		TEX_CHOICE = "NONE";
		BTexMain();
	end	
	if cmd == "custom" then
		BtexCustomFrame:Show();
	end	
	if cmd == "viewport" then
		BtexViewportFrame:Show();
	end	
end

--------------------------------------------------------------------------------------------------------
--                                          DISPLAY GRID                                              --
--------------------------------------------------------------------------------------------------------
-- frame
PanelGridConfigFrame = CreateFrame("Frame","PanelGridConfigFrame",BtexMenuFrame);
PanelGridConfigFrame:SetWidth(90);
PanelGridConfigFrame:SetHeight(60);
PanelGridConfigFrame:SetBackdrop({ edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", tile = true, tileSize = 8, edgeSize = 12, insets = { left = 2, right = 2, top = 2, bottom = 2 } });
PanelGridConfigFrame:SetBackdropColor(0.1,0.1,0.2,1);
PanelGridConfigFrame:SetBackdropBorderColor(0.1,0.1,0.1,1);
PanelGridConfigFrame:SetToplevel(1);
PanelGridConfigFrame:SetPoint("TOPRIGHT",-10,-55);
PanelGridConfigFrame:Show();
-- editbox button size
PanelGridConfigFrame.Size = CreateFrame("EditBox","BtexEditBtexMenuFrameGridSize",PanelGridConfigFrame,"InputBoxTemplate");
PanelGridConfigFrame.Size:SetWidth(20);
PanelGridConfigFrame.Size:SetHeight(20);
PanelGridConfigFrame.Size:SetPoint("TOPLEFT",55,-30);
PanelGridConfigFrame.Size:SetAutoFocus(nil);
PanelGridConfigFrame.Size:SetTextColor(1.0,0.82,0);
PanelGridConfigFrame.Size:SetText(50);
PanelGridConfigFrame.btnCheckGridText = PanelGridConfigFrame:CreateFontString(nil,"ARTWORK");
PanelGridConfigFrame.btnCheckGridText:SetFont("Interface\\AddOns\\Btex\\Btex.ttf", 8, "");
PanelGridConfigFrame.btnCheckGridText:SetPoint("TOPLEFT",10,-35);
PanelGridConfigFrame.btnCheckGridText:SetText(BTEXBOXSTEP);

--Check button grid
local function CheckButton_OnClick(self)
	local status = self:GetChecked() and true or false;
	if status then
		PlaySound('igMainMenuOptionCheckBoxOn');
		BtexDisplayGrid();
	else
		PlaySound('igMainMenuOptionCheckBoxOff');
		BtexGrid:Hide();
	end
end
PanelGridConfigFrame.btnCheckGrid = CreateFrame("CheckButton", nil, PanelGridConfigFrame);
PanelGridConfigFrame.btnCheckGrid:SetWidth(26);
PanelGridConfigFrame.btnCheckGrid:SetHeight(26);
PanelGridConfigFrame.btnCheckGrid:SetPoint("TOPLEFT",5,-5);
PanelGridConfigFrame.btnCheckGrid:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up");
PanelGridConfigFrame.btnCheckGrid:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down");
PanelGridConfigFrame.btnCheckGrid:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight");
PanelGridConfigFrame.btnCheckGrid:SetDisabledCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled");
PanelGridConfigFrame.btnCheckGrid:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check");
PanelGridConfigFrame.btnCheckGrid:SetScript("OnClick", CheckButton_OnClick);
PanelGridConfigFrame.btnCheckGridText = PanelGridConfigFrame:CreateFontString(nil,"ARTWORK");
PanelGridConfigFrame.btnCheckGridText:SetFont("Interface\\AddOns\\Btex\\Btex.ttf", 8, "");
PanelGridConfigFrame.btnCheckGridText:SetPoint("TOPLEFT",30,-10);
PanelGridConfigFrame.btnCheckGridText:SetText(BTEXSHOWGRID);

function BtexDisplayGrid()
	local BtexGridBoxSize = PanelGridConfigFrame.Size:GetNumber();
	if BtexGridBoxSize <= 1 then
	DEFAULT_CHAT_FRAME:AddMessage("BTEX >> Value MUST be superior to 1.");
	return;
	end
	local BtexGridWidthStep = GetScreenWidth() / BtexGridBoxSize;
	local BtexGridHeightStep = (GetScreenHeight() * (GetScreenWidth() / GetScreenHeight())) / BtexGridBoxSize;
	-- frame
	BtexGrid = CreateFrame('Frame', nil, UIParent);
	BtexGrid:SetAllPoints(UIParent);
	-- drawing
	for i = 0, BtexGridBoxSize do 
		local BtexGridTexture = BtexGrid:CreateTexture(nil, 'BACKGROUND');
		if i == BtexGridBoxSize / 2 then BtexGridTexture:SetTexture(1, 0, 0, 0.5); 
		else BtexGridTexture:SetTexture(0, 0, 0, 0.5);
		end 
		BtexGridTexture:SetPoint("TOPLEFT", BtexGrid, "TOPLEFT", i*BtexGridWidthStep - 1, 0); 
		BtexGridTexture:SetPoint('BOTTOMRIGHT', BtexGrid, 'BOTTOMLEFT', i*BtexGridWidthStep + 1, 0); 
	end 
	do
		local BtexGridTexture = BtexGrid:CreateTexture(nil, 'BACKGROUND') 
		BtexGridTexture:SetTexture(1, 0, 0, 0.5)
		BtexGridTexture:SetPoint("TOPLEFT", BtexGrid, "TOPLEFT", 0, -(GetScreenHeight()/2) + 1)
		BtexGridTexture:SetPoint('BOTTOMRIGHT', BtexGrid, 'TOPRIGHT', 0, -(GetScreenHeight()/2 + 1))
	end
	for i = 1, math.floor((GetScreenHeight()/2)/BtexGridHeightStep) do
		local BtexGridTexture = BtexGrid:CreateTexture(nil, 'BACKGROUND') 
		BtexGridTexture:SetTexture(0, 0, 0, 0.5)
		BtexGridTexture:SetPoint("TOPLEFT", BtexGrid, "TOPLEFT", 0, -(GetScreenHeight()/2+i*BtexGridHeightStep) + 1)
		BtexGridTexture:SetPoint('BOTTOMRIGHT', BtexGrid, 'TOPRIGHT', 0, -(GetScreenHeight()/2+i*BtexGridHeightStep + 1))
		BtexGridTexture = BtexGrid:CreateTexture(nil, 'BACKGROUND') 
		BtexGridTexture:SetTexture(0, 0, 0, 0.5)	
		BtexGridTexture:SetPoint("TOPLEFT", BtexGrid, "TOPLEFT", 0, -(GetScreenHeight()/2-i*BtexGridHeightStep) + 1)
		BtexGridTexture:SetPoint('BOTTOMRIGHT', BtexGrid, 'TOPRIGHT', 0, -(GetScreenHeight()/2-i*BtexGridHeightStep + 1))
	end
end
