
-- TODO: localize


BINDING_HEADER_PANOSHOT = "PanoShot";
BINDING_NAME_PANOSHOT_ONESHOT = "Take one screenshot (hide UI)"
BINDING_NAME_PANOSHOT_PANOSHOT = "Take multiple screenshots (hide UI)"

SLASH_PANOSHOTONCE1 = "/oneshot";
SLASH_PANOSHOT1 = "/panoshot";

--

local rate = 24;
local OPTIONS_FARCLIP_MAX = 1277

local pframe;
local cvars_saved = {}
local dynperf
local cvars = {
    UnitNameOwn = 0,
    UnitNameNPC = 0,
    UnitNamePlayerGuild = 0,
    UnitNamePlayerPVPTitle = 0,
    UnitNameEnemyPlayerName = 0,
    UnitNameEnemyPetName = 0,
    UnitNameEnemyCreationName = 0,
    UnitNameFriendlyPlayerName = 0,
    UnitNameFriendlyPetName = 0,
    UnitNameFriendlyCreationName = 0,
    UnitNameCompanionName = 0,
    farclip = OPTIONS_FARCLIP_MAX
};

--
--

PanoShot = {}
local PanoShot = PanoShot

--
--

local function hideui()
    CloseAllWindows();
    UIParent:Hide();
    ActionStatus:UnregisterEvent("SCREENSHOT_SUCCEEDED");

    --for h,v in pairs(cvars) do
    --    cvars_saved[h] = GetCVar(h);
    --    SetCVar(h, v);
    --end
end

local function showui()
    UIParent:Show();
    ActionStatus:RegisterEvent("SCREENSHOT_SUCCEEDED");

    for h,v in pairs(cvars_saved) do
        SetCVar(h, cvars_saved[h]);
    end
end

local function dynperf_off()
    if(DynPerf and DynPerf.IsActive) then
        dynperf = DynPerf:IsActive()
        if(dynperf) then
            DynPerf:SetActive(not dynperf)
        end
    end
end

local function dynperf_on()
    if(DynPerf and dynperf) then
        DynPerf:SetActive(dynperf)
    end
end

local curp = 0;
local ready, doing, onlyonce, lasttime;
local setcursor;
pframe = CreateFrame("Frame");
pframe:SetFrameStrata("FULLSCREEN");
pframe:SetParent(WorldFrame);
pframe:SetAllPoints();
pframe:RegisterEvent("SCREENSHOT_SUCCEEDED");
pframe:EnableMouse(1);
pframe:Hide();

PanoShot.mouse_frame = pframe

pframe:SetScript("OnEvent", function()
    if(event == "SCREENSHOT_SUCCEEDED") then
        if(doing and not ending) then
            ready = 1;
            curp = curp + rate;
            FlipCameraYaw(rate);
        end
    end
end);

pframe:SetScript("OnUpdate", function()
    if(ready) then
        -- don't write more than one screenshot per second
        if(lasttime == time()) then
            return;
        else
            lasttime = time();
        end

        -- this is a compressed blp, but we don't care
        SetCursor("Interface\\AddOns\\PanoShot\\NilCursor");

        -- actually take the screenshot
        TakeScreenshot();
        ready = nil;
        if(curp >= 360 or onlyonce) then
            ending = 1;
        end
    elseif(intro) then
        doing = 1;
        SetCursor("Interface\\AddOns\\PanoShot\\NilCursor");
        ready = 1;
        intro = nil
    elseif(ending) then
        PanoShot.Stop()
        ending = nil;
        doing = nil;
    end
end);

---
---

function PanoShot.IsRunning()
    return pframe:IsShown();
end

function PanoShot.Start()
    if(not PanoShot.IsRunning()) then
        hideui();
        dynperf_off()
        curp = 0;
        intro = 1;
        setcursor = nil;
        pframe:Show();
    end
end

function PanoShot.Stop()
    if(PanoShot.IsRunning()) then
        pframe:Hide();
        showui();
        dynperf_on()
        if(not onlyonce) then
            FlipCameraYaw(-curp);
        end
        onlyonce = nil;
    end
end

function PanoShot.StartStop()
    if(not PanoShot.IsRunning()) then
        PanoShot.Start();
    else
        PanoShot.Stop();
    end
end

function PanoShot.Once()
    onlyonce = 1
    PanoShot.Start();
end

function SlashCmdList.PANOSHOT(s)
    PanoShot.StartStop()
end

function SlashCmdList.PANOSHOTONCE(s)
    PanoShot.Once()
end

