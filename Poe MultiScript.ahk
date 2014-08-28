;██████╗ ██╗   ██╗     ██████╗ ██╗   ██╗██████╗ ██╗   ██╗██████╗ 
;██╔══██╗╚██╗ ██╔╝    ██╔════╝ ██║   ██║██╔══██╗██║   ██║██╔══██╗
;██████╔╝ ╚████╔╝     ██║  ███╗██║   ██║██████╔╝██║   ██║██║  ██║
;██╔══██╗  ╚██╔╝      ██║   ██║██║   ██║██╔══██╗██║   ██║██║  ██║
;██████╔╝   ██║       ╚██████╔╝╚██████╔╝██║  ██║╚██████╔╝██████╔╝
;╚═════╝    ╚═╝        ╚═════╝  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ 
                                                                
;-------GUI-----------------GUI-----------------GUI-----------------GUI-----------------GUI----------

#SingleInstance force

IniRead, LastTab, Config.ini, Config, LastTab, Settings

If LastTab = AutoFlask
{
   Gui,Add,Tab2, x0 y0 w474 h525 gTabFunc vTabChoice,AutoFlask||AutoQuit|Others|Settings|
}
else If LastTab = AutoQuit
{
   Gui,Add,Tab2, x0 y0 w474 h525 gTabFunc vTabChoice,AutoFlask|AutoQuit||Others|Settings|
}
else If LastTab = Others
{
   Gui,Add,Tab2, x0 y0 w474 h525 gTabFunc vTabChoice,AutoFlask|AutoQuit|Others||Settings|
}
else If LastTab = Settings
{
   Gui,Add,Tab2, x0 y0 w474 h525 gTabFunc vTabChoice,AutoFlask|AutoQuit|Others|Settings||
}

Gui, Tab, Settings

Gui, Add, GroupBox, x12 y110 w220 h60, AutoFlask/AutoQuit Profile

IniRead, ConfigNumber , Config.ini, Config, ConfigNumber, 1

If ConfigNumber = 1
{
   Gui, Add, DropDownList, x22 y130 w200 h21 AltSubmit gConfigList vConfigChoice R5 , Profile 1||Profile 2|Profile 3|Profile 4|Profile 5
}
else If ConfigNumber = 2
{
   Gui, Add, DropDownList, x22 y130 w200 h21 AltSubmit gConfigList vConfigChoice R5 , Profile 1|Profile 2||Profile 3|Profile 4|Profile 5
}
else If ConfigNumber = 3
{
   Gui, Add, DropDownList, x22 y130 w200 h21 AltSubmit gConfigList vConfigChoice R5 , Profile 1|Profile 2|Profile 3||Profile 4|Profile 5
}
else If ConfigNumber = 4
{
   Gui, Add, DropDownList, x22 y130 w200 h21 AltSubmit gConfigList vConfigChoice R5 , Profile 1|Profile 2|Profile 3|Profile 4||Profile 5
}
else If ConfigNumber = 5
{
   Gui, Add, DropDownList, x22 y130 w200 h21 AltSubmit gConfigList vConfigChoice R5 , Profile 1|Profile 2|Profile 3|Profile 4|Profile 5||
}

Loop, 5
{
	If ConfigNumber = %A_Index%
	{
		IniRead, minLifePercentToQuit , Config.ini, Config%A_Index%, minLifePercentToQuit, 35
		IniRead, minESPercentToQuit , Config.ini, Config%A_Index%, minESPercentToQuit, 0
		IniRead, minLifePercentToJade , Config.ini, Config%A_Index%, minLifePercentToJade, 70
		IniRead, minLifePercentToJade , Config.ini, Config%A_Index%, minLifePercentToJade, 70
		IniRead, minESPercentToJade , Config.ini, Config%A_Index%, minESPercentToJade, 0
		IniRead, minLifePercentToElementalResist , Config.ini, Config%A_Index%, minLifePercentToElementalResist, 70
		IniRead, minESPercentToElementalResist , Config.ini, Config%A_Index%, minESPercentToElementalResist, 0
		IniRead, minLifePercentToDrink , Config.ini, Config%A_Index%, minLifePercentToDrink, 55
		IniRead, minManaPercentToDrink , Config.ini, Config%A_Index%, minManaPercentToDrink, 25
		IniRead, minManaToDrinkPot , Config.ini, Config%A_Index%, minManaToDrinkPot, 15
		IniRead, minLifePercentToSpam, Config.ini, Config%A_Index%, minLifePercentToSpam, 35
		IniRead, ResyncSpam, Config.ini, Config%A_Index%, ResyncSpam, 0
		IniRead, InstantFlaskDelay, Config.ini, Config%A_Index%, InstantFlaskDelay, 0
		IniRead, QuickSilverMovementTimer , Config.ini, Config%A_Index%, QuickSilverMovementTimer, 15
	}	
}

IniRead, QuickSilverCheck , Config.ini, Config, QuickSilverCheck, 0

IniRead, QuickSilverCheck2 , Config.ini, Config, QuickSilverCheck2, 0

IniRead, AutoShiftCheck , Config.ini, Config, AutoShiftCheck, 0

Gui, Tab, AutoFlask

Gui, Add, GroupBox, x12 y250 w220 h60 , Min Life `% to Use Jade/Granite Flask
Gui, Add, Slider, x22 y270 w170 h30 gGuiUpdate vminLifePercentToJade +ToolTip TickInterval25, %minLifePercentToJade%
Gui, Add, Text, x192 y270 w20 h30 vminLifePercentToJadeUpdate , %minLifePercentToJade%
Gui, Add, Text, x212 y270 w10 h30 , `%

Gui, Add, GroupBox, x242 y250 w220 h60 , Min E.Shield `% to Use Jade/Granite Flask
Gui, Add, Slider, x252 y270 w170 h30 gGuiUpdate vminESPercentToJade +ToolTip TickInterval25, %minESPercentToJade%
Gui, Add, Text, x422 y270 w20 h30 vminESPercentToJadeUpdate, %minESPercentToJade%
Gui, Add, Text, x442 y270 w10 h30 , `%

Gui, Add, GroupBox, x12 y320 w220 h60 , Min Life `% to Use Elemental Resist Flask
Gui, Add, Slider, x22 y340 w170 h30 gGuiUpdate vminLifePercentToElementalResist +ToolTip TickInterval25, %minLifePercentToElementalResist%
Gui, Add, Text, x192 y340 w20 h30 vminLifePercentToElementalResistUpdate, %minLifePercentToElementalResist%
Gui, Add, Text, x212 y340 w10 h30 , `%

Gui, Add, GroupBox, x242 y320 w220 h60 , Min E.Shield `% to Use Element. Resist Flask
Gui, Add, Slider, x252 y340 w170 h30 gGuiUpdate vminESPercentToElementalResist +ToolTip TickInterval25, %minESPercentToElementalResist%
Gui, Add, Text, x422 y340 w20 h30 vminESPercentToElementalResistUpdate, %minESPercentToElementalResist%
Gui, Add, Text, x442 y340 w10 h30 , `%

Gui, Add, GroupBox, x12 y40 w220 h60 , Min Life `% to Drink Health Potion
Gui, Add, Slider, x22 y60 w170 h30 gGuiUpdate vminLifePercentToDrink +ToolTip TickInterval25, %minLifePercentToDrink%
Gui, Add, Text, x192 y60 w20 h30 vminLifePercentToDrinkUpdate, %minLifePercentToDrink%
Gui, Add, Text, x212 y60 w10 h30 , `%

Gui, Add, GroupBox, x242 y40 w220 h60 , Min Mana `% to Drink Mana Potion
Gui, Add, Slider, x252 y60 w170 h30 gGuiUpdate vminManaPercentToDrink +ToolTip TickInterval25, %minManaPercentToDrink%
Gui, Add, Text, x422 y60 w20 h30 vminManaPercentToDrinkUpdate, %minManaPercentToDrink%
Gui, Add, Text, x442 y60 w10 h30 , `%

Gui, Add, GroupBox, x12 y180 w220 h60 , Min Life `% to Spam Instant Flasks
Gui, Add, Slider, x22 y200 w170 h30 gGuiUpdate vminLifePercentToSpam +ToolTip TickInterval25, %minLifePercentToSpam%
Gui, Add, Text, x192 y200 w20 h30 vminLifePercentToSpamUpdate, %minLifePercentToSpam%
Gui, Add, Text, x212 y200 w10 h30 , `%

Gui, Add, GroupBox, x242 y110 w220 h60 , Min Mana to Drink Mana Potion
Gui, Add, Slider, x252 y130 w170 h30 Range0-300 gGuiUpdate vminManaToDrinkPot +ToolTip TickInterval50, %minManaToDrinkPot%
Gui, Add, Text, x422 y130 w30 h30 vminManaToDrinkPotUpdate, %minManaToDrinkPot%

Gui, Add, GroupBox, x242 y180 w220 h60 , Instant Flask Spam Delay  ;x12 y149 w220 h60
IniRead, InstantFlaskDelay , Config.ini, Config, InstantFlaskDelay, 0
Gui, Add, Slider, x252 y200 w170 h30 Range0-50 gGuiUpdate vInstantFlaskDelay +ToolTip TickInterval50, %InstantFlaskDelay%
Gui, Add, Text, x422 y200 w25 h30 vInstantFlaskDelayUpdate, % Round(InstantFlaskDelay/100,2)
Gui, Add, Text, x447 y200 w10 h30 , s

Gui, Add, GroupBox, x12 y390 w220 h60 , Only QuickSilver if Moving for X Seconds
Gui, Add, Slider, x22 y410 w170 h30 Range0-100 gGuiUpdate vQuickSilverMovementTimer +ToolTip TickInterval20, %QuickSilverMovementTimer%
Gui, Add, Text, x192 y410 w22 h30 vQuickSilverMovementTimerUpdate, % Round(QuickSilverMovementTimer/10,1)
Gui, Add, Text, x214 y410 w10 h30 , s

Gui, Add, GroupBox, x12 y110 w220 h60 , Disable AutoFlask on Slot ;x12 y359 w220 h60

Loop, 5
{
	IniRead, Slot%A_Index%Disabled, Config.ini, DisableSlot, DisableSlot%A_Index%, 0
	XSlot:=((A_Index*40)-18)
	X=x%XSlot%
	If (Slot%A_Index%Disabled = 0)
	Gui, Add, CheckBox, %X% y130 w30 h30 vDisableSlot%A_Index% gDisableSlot, %A_Index%
	Else If (Slot%A_Index%Disabled = 1)
	Gui, Add, CheckBox, %X% y130 w30 h30 checked vDisableSlot%A_Index% gDisableSlot, %A_Index%
}

If QuickSilverCheck = 0
{
   Gui, Add, CheckBox, x242 y385 w220 h30 vQuickSilverCheckBox gQuickSilverCheck, Use QuickSilver Flask When 40+ Charges
}
If QuickSilverCheck = 1
{
   Gui, Add, CheckBox, x242 y385 w220 h30  vQuickSilverCheckBox gQuickSilverCheck Checked, Use QuickSilver Flask When 40+ Charges
}

If QuickSilverCheck2 = 0
{
   Gui, Add, CheckBox, x242 y415 w220 h30 vQuickSilverCheckBox2 gQuickSilverCheck2, Use QuickSilver Flask When 20+ Charges
}
If QuickSilverCheck2 = 1
{
   Gui, Add, CheckBox, x242 y415 w220 h30  vQuickSilverCheckBox2 gQuickSilverCheck2 Checked, Use QuickSilver Flask When 20+ Charges
}

Gui, Tab, AutoQuit

Gui, Add, GroupBox, x12 y110 w220 h60, Auto Quit Method
IniRead, AutoQuitMethod , Config.ini, Config, AutoQuitMethod, 1
If AutoQuitMethod = 1
{
   Gui, Add, DropDownList, x22 y130 w200 h21 AltSubmit gAutoQuitList vAutoQuitChoice R5, Exit to Login Screen (Fastest)||Kill Process|Use a Portal (On Testing)|Disabled
   autoQuitMode:=1
}
else If AutoQuitMethod = 2
{
   Gui, Add, DropDownList, x22 y130 w200 h21 AltSubmit gAutoQuitList vAutoQuitChoice R5, Exit to Login Screen (Fastest)|Kill Process||Use a Portal (On Testing)|Disabled
   autoQuitMode:=0
}
else If AutoQuitMethod = 3
{
   Gui, Add, DropDownList, x22 y130 w200 h21 AltSubmit gAutoQuitList vAutoQuitChoice R5, Exit to Login Screen (Fastest)|Kill Process|Use a Portal (On Testing)||Disabled
   autoQuitMode:=3
}
else If AutoQuitMethod = 4
{
   Gui, Add, DropDownList, x22 y130 w200 h21 AltSubmit gAutoQuitList vAutoQuitChoice R5, Exit to Login Screen (Fastest)|Kill Process|Use a Portal (On Testing)|Disabled||
   autoQuitMode:=4
}

Gui, Add, GroupBox, x12 y40 w220 h60 , Min Life `% to Quit
Gui, Add, Slider, x22 y60 w170 h30 gGuiUpdate vminLifePercentToQuit +ToolTip TickInterval25, %minLifePercentToQuit%
Gui, Add, Text, x192 y60 w20 h30 vminLifePercentToQuitUpdate, %minLifePercentToQuit%
Gui, Add, Text, x212 y60 w10 h30 , `%

Gui, Add, GroupBox, x242 y40 w220 h60 , Min Energy Shield `% to Quit
Gui, Add, Slider, x252 y60 w170 h30 gGuiUpdate vminESPercentToQuit +ToolTip TickInterval25, %minESPercentToQuit%
Gui, Add, Text, x422 y60 w20 h30 vminESPercentToQuitUpdate, %minESPercentToQuit%
Gui, Add, Text, x442 y60 w10 h30 , `%

Gui, Tab, Settings

IniRead, DPSCheck , Config.ini, Config, DPSCheck, 0
If DPSCheck = 0
{
   Gui, Add, CheckBox, x272 y70 w190 h30 vDPSCheckBox gDPSCheck, Disable DPS Calculator
   global DPS:=false
}
If DPSCheck = 1
{
   Gui, Add, CheckBox, x272 y70 w190 h30  vDPSCheckBox gDPSCheck Checked, Disable DPS Calculator
   global DPS:=true
}

;display tray notifications about script actions : drinking potions, autoquitting
IniRead, TrayNotificationsCheck , Config.ini, Config, TrayNotificationsCheck, 0
If TrayNotificationsCheck = 0
{
   Gui, Add, CheckBox, x272 y40 w190 h30 vTrayCheckBox gTrayNotificationsCheck, Disable Tray Notifications
   global trayNotifications:=true
}
If TrayNotificationsCheck = 1
{
   Gui, Add, CheckBox, x272 y40 w190 h30 vTrayCheckBox gTrayNotificationsCheck Checked, Disable Tray Notifications
   global trayNotifications:=false
}

Gui, Add, GroupBox, x12 y40 w220 h60 , Base Pointer
Gui, Add, Text, x92 y60 w130 h30, Will Automatically Find Itself On New Client/Patch
IniRead, baseMgrPtr , Config.ini, Config, baseMgrPtr, 0
Gui, Add, Text, x22 y70 w70 h20 vbasePtrText , %baseMgrPtr%


Gui, Tab, Others

IniRead, TradeSpam, Config.ini, Config, TradeSpam, 0
Gui, Add, GroupBox, x12 y40 w220 h60 , Send Trade Message Every X Minutes*
Gui, Add, Slider, x22 y60 w170 h30 gGuiUpdate vTradeSpam +ToolTip TickInterval1 Range0-10, %TradeSpam%
Gui, Add, Text, x192 y60 w20 h30 vTradeSpamUpdate, %TradeSpam%
Gui, Add, Text, x212 y60 w10 h30 , m

Gui, Add, Text,  x22 y425 w400 h21, *Opening the chat will stop and reset the trade spam.

Gui, Add, GroupBox, x242 y40 w220 h60 , Send Resync Command Every X Seconds
Gui, Add, Slider, x252 y60 w170 h30 gGuiUpdate vResyncSpam +ToolTip TickInterval30 Range0-120, %ResyncSpam%
Gui, Add, Text, x422 y60 w20 h30 vResyncSpamUpdate, %ResyncSpam%
Gui, Add, Text, x442 y60 w10 h30 , s

If AutoShiftCheck = 0
{
   Gui, Add, CheckBox, x22 y110 w170 h30 vAutoShiftCheckBox gAutoShiftCheck, Auto Hold Shift When Attacking
}
If AutoShiftCheck = 1
{
   Gui, Add, CheckBox, x22 y110 w170 h30  vAutoShiftCheckBox gAutoShiftCheck Checked, Auto Hold Shift When Attacking
}


Gui, Tab

Gui, Add, Button, x22 y469 w130 h40 gDefault, Reset Profile
Gui, Add, Button, x182 y469 w120 h40 gReadMe, ReadMe
Gui, Add, Button, x332 y469 w120 h40 gDonate, Donate

Gui, Add, Text, x380 y1 w110 h18 vguicontroled, Created by Gurud.

Gui, Add, GroupBox, x0 y450 w472 h74 ,
Gui, Add, GroupBox, x1 y451 w470 h72 ,
Gui, Add, GroupBox, x2 y452 w468 h70 ,
Gui, Add, GroupBox, x3 y453 w466 h68 ,
Gui, Add, GroupBox, x4 y454 w464 h66 ,

Gui, Add, GroupBox, x0 y21 w472 h435 ,
Gui, Add, GroupBox, x1 y22 w470 h434 ,
Gui, Add, GroupBox, x2 y23 w468 h433 ,
Gui, Add, GroupBox, x3 y24 w466 h432 ,
Gui, Add, GroupBox, x4 y25 w464 h431 ,

Menu, Tray, Add, Configuration Window, showgui

Gui, Submit

Gui, Show, x760 y198 h525 w474, PoE MultiScript v08.27.2014

;---------------------START DYNAMIC HOTKEYS---------------------

 IniRead, savedHK1, Config.ini, Hotkeys, 1, F1
 IniRead, savedHK2, Config.ini, Hotkeys, 2, ~F2
 IniRead, savedHK3, Config.ini, Hotkeys, 3, ~F3
 IniRead, savedHK4, Config.ini, Hotkeys, 4, ~^F3
 IniRead, savedHK5, Config.ini, Hotkeys, 5, ~F4
 IniRead, savedHK6, Config.ini, Hotkeys, 6, ~^F4
 IniRead, savedHK7, Config.ini, Hotkeys, 7, ~F10
 IniRead, savedHK8, Config.ini, Hotkeys, 8, ~!w
 loop, 8
 {
 	 Gui, 2:Add, Text, xm, Enter Hotkey #%A_Index%:
	 If savedHK%A_Index%                                       ;Check for saved hotkeys in INI file.
	 Hotkey,% savedHK%A_Index%, Label%A_Index%                 ;Activate saved hotkeys if found.
	 StringReplace, noMods, savedHK%A_Index%, ~                  ;Remove tilde (~) and Win (#) modifiers...
	 StringReplace, noMods, noMods, #,,UseErrorLevel              ;They are incompatible with hotkey controls (cannot be shown).
	 Gui, 2:Add, Hotkey, x+5 vHK%A_Index% gGuiLabel, %noMods%        ;Add hotkey controls and show saved hotkeys.
	 Gui, 2:Add, CheckBox, x+5 vCB%A_Index% Checked%ErrorLevel%, Win  ;Add checkboxes to allow the Windows key (#) as a modifier...
 }
Menu, Tray, Add, Configure Hotkeys, showgui2                                                      ;Check the box if Win modifier is used.
Gui, 2:Submit, Hide

Menu Tray, NoStandard

Menu Tray, Standard

Menu Tray,Check, Configure Hotkeys
Menu Tray,Check, Configuration Window
;---------------------END DYNAMIC HOTKEYS---------------------

;-------GUI-----------------GUI-----------------GUI-----------------GUI-----------------GUI----------

;-------START VARIABLES-----------------START VARIABLES-----------------START VARIABLES--------------

SetBatchLines, -1
DetectHiddenWindows, On

if not A_IsAdmin
{
	DllCall("shell32\ShellExecuteA", uint, 0, str, "RunAs", str, A_ScriptFullPath, str, """" . PARAM1 . """", str, A_WorkingDir, int, 1) ; Last parameter: SW_SHOWNORMAL = 1
	ExitApp
}

cliname=Path of Exile

cliexesteam=PathOfExileSteam.exe

cliexe=PathOfExile.exe
AutoFlaskWatchdogPeriod:=10 ;milliseconds, time to have script recheck life/mana/flasks availability more often/increase chances of getting saved from death in time, increase this if fps drop.
lagCompensation:=50
; Font size for the tooltip, leave empty for default(part of DPSCalc)
FontSize := 12
; Create font for later use(part of DPSCalc)
FixedFont := CreateFont()

ResyncTimer:= A_TickCount
ChatStatusTimer:= A_TickCount+99999999999
TradeTimer:= 0
TradeChannel:= 0
tradechat:= 0
TradeStep:= 3
TradeSpamTimer:= 3
ShiftDownOn:=0
ChatCheckTimer:= 1
10secsTimer:=A_TickCount-10000
20secsTimer:=A_TickCount-20000
PanickedTimer:=40

autoQuitPauseBeforeClick:=100
autoQuitSoftToleranceBeforeKill:=2000 ; try to quit to loginscreen at most milliseconds before killing game window(in case we can't quit by clicking menu option for some reason)

PlayerConfig:={}

PlayerConfig["Default"]:={QuickSilverTimer:QuickSilverMovementTimer*100,minLifeRatioToInstant: minLifePercentToSpam/100, IFlaskDelay: InstantFlaskDelay,minLifeRatioToDrink: minLifePercentToDrink/100, minManaRatioToDrink: minManaPercentToDrink/100, minManaToDrink: minManaToDrinkPot, minLifeRatioToPopElementalResist: minLifePercentToElementalResist/100, minLifeRatioToPopJade: minLifePercentToJade/100, minLifeRatioToQuit: minLifePercentToQuit/100, minNShieldRatioToQuit: minESPercentToQuit/100, minNShieldRatioToPopElementalResist: minESPercentToElementalResist/100, minNShieldRatioToPopJade: minESPercentToJade/100}

PlayerConfig["Default"].FlaskConfig:=[]

/*
PlayerConfig["Default"].FlaskConfig[1]:={Hotkey:"{1 Down 1 UP}"} ; ,OverrideFlaskDuration: 70, instantRecoveryOnLowLife:true, } ;specify override recovery time in deciseconds, e.g. 7 seconds = 70
PlayerConfig["Default"].FlaskConfig[2]:={Hotkey:"{2 Down 2 UP}"}
PlayerConfig["Default"].FlaskConfig[3]:={Hotkey:"{3 Down 3 UP}"}
PlayerConfig["Default"].FlaskConfig[4]:={Hotkey:"{4 Down 4 UP}"}
PlayerConfig["Default"].FlaskConfig[5]:={Hotkey:"{5 Down 5 UP}"}
*/

attachedtext=:false

WindowQueuedFlaskEffects:=[] ;keyed by "%hwnd%%CurrPid%", hpQueueEndtime, manaQueueEndtime


basePtrAoBArray:=[0x53,0x55,0x56,0x57,0x33,0xFF,0x3B,0xC7]
basePtrAobOffset:=-0x0A

WindowBasicsCache:=[] ; keyed by "%hwnd%%CurrPid%", entries are objects with properties processHandle, moduleBase, moduleSize, baseFramePtr

#Include AutoHotkeyMemoryLib.ahk

OnExit, ExitSub

Loop
{
   Main()
}

;-------START VARIABLES-----------------START VARIABLES-----------------START VARIABLES--------------

;-------MAIN FUNCTIONS-----------------MAIN FUNCTIONS-----------------MAIN FUNCTIONS-----------------

GetWindowBasics(hwnd, byref mB="", byref pH="", byref mS="")
{
   
   global WindowBasicsCache
   global cliexe
   
   WinGet, CurrPid, PID, ahk_id %hwnd%
   
   k="%hwnd%%CurrPid%"
   
   mB:=WindowBasicsCache[k].mBase
   mS:=WindowBasicsCache[k].mSize
   
   if mB=
   {
      WindowBasicsCache[k]:=Object()
      GetModuleInfo(cliexe, CurrPid, mB, mS)
      if (mB="" || mS="")
      {
         MsgBox, Failed to obtain moduleBase or moduleSize for PID %CurrPid%, script will now terminate
         ExitApp
      }      
      WindowBasicsCache[k].mBase:=mB
      WindowBasicsCache[k].mSize:=mS
   }

   pH:=WindowBasicsCache[k].ProcessHandle
   if pH=
   {
      pH:=GetProcessHandle(CurrPid)
      if (pH="" || pH=-1)
      {
         MsgBox, Invalid process handle obtained for PID %CurrPid%, script will now terminate
         ExitApp
      }      
      WindowBasicsCache[k].ProcessHandle:=pH
   }
}

ScanBaseMgrPtr(mBase,pH,moduleSize)
{
   global basePtrAoBArray
   global basePtrAobOffset
   global baseMgrPtr
   aobResult:=AobScan(pH,mBase,moduleSize,basePtrAoBArray)

   if aobResult
   {
      SetFormat, IntegerFast, hex
      baseMgrPtr:=ReadMemUInt(pH,mBase+aobResult+basePtrAobOffset)-mBase
      if (trayNotifications)
     TrayTip, New Base Pointer Found, baseMgrPtr = %baseMgrPtr%
     IniWrite, %baseMgrPtr% , Config.ini, Config, baseMgrPtr
     GuiControl, , basePtrText, %baseMgrPtr%
     SetFormat, IntegerFast, dec

   }
   else
   {
      MsgBox, baseMgrPtr not found with AoBScan, script will now terminate
      ExitApp
   }   
}

GetFrameBase(hwnd)
{
   global baseMgrPtr
   global WindowBasicsCache
   global cliname
   global 10secsTimer

   WinGet, CurrPid, PID, ahk_id %hwnd%
   k="%hwnd%%CurrPid%"

   fB:=WindowBasicsCache[k].fBase

   if fB=
   {
   		If (A_TickCount>=10secsTimer+10000)
   		{
	   		IniRead, MD5Hash , Config.ini, Config, MD5Hash, 0
			WinGet FullEXEPath, ProcessPath, %cliname%
			NewMD5Hash:=FileMD5(FullEXEPath)

			If (NewMD5Hash!=MD5Hash)
			{
				IniWrite, 0 , Config.ini, Config, baseMgrPtr
				baseMgrPtr:= 0
				IniWrite, %NewMD5Hash% , Config.ini, Config, MD5Hash
			}
			10secsTimer:=A_TickCount
   		}

		GetWindowBasics(hwnd, mBase, pH, mSize)


      if baseMgrPtr= 0
      {
         ScanBaseMgrPtr(mBase, pH, mSize)
      }

      fB:=GetMultilevelPointer(pH,[mBase+baseMgrPtr,4,0x7C,0x9c])
      WindowBasicsCache[k].fBase:=fB
   }
   return fB
}

GetUiBase(hwnd)
{
   global baseMgrPtr
   global cliname
   global 10secsTimer
   global Steam


	If (A_TickCount>=10secsTimer+10000)
	{
		IniRead, MD5Hash , Config.ini, Config, MD5Hash, 0
		WinGet FullEXEPath, ProcessPath, %cliname%
		NewMD5Hash:=FileMD5(FullEXEPath)

		If (NewMD5Hash!=MD5Hash)
		{
			IniWrite, 0 , Config.ini, Config, baseMgrPtr
			baseMgrPtr:= 0
			IniWrite, %NewMD5Hash% , Config.ini, Config, MD5Hash
		}
		10secsTimer:=A_TickCount
	}


	GetWindowBasics(hwnd, mBase, pH, mSize)
      
      if baseMgrPtr= 0
      {
         ScanBaseMgrPtr(mBase, pH, mSize)
      }
      
   FrameBase:=GetFrameBase(hwnd)
   if (FrameBase="" || FrameBase=0)
      return
   if (Steam)
   {
      uiBase:=GetMultilevelPointer(pH,[FrameBase+0x15c,0x220,0x4C])
   }
   else
   uiBase:=GetMultilevelPointer(pH,[FrameBase+0x140,0x220,0x4C])
   return uiBase
}

ReadClientResolution(hwnd, ByRef w, ByRef h)
{
   global Steam

   GetWindowBasics(hwnd,mBase,pH)
   if (mBase!=0 && pH && pH!=-1)
   {
      FrameBase:=GetFrameBase(hwnd)
      if (Steam)
      {
         w:=ReadMemUInt(pH,FrameBase+0x15D0)
         h:=ReadMemUInt(pH,FrameBase+0x15D4)
      }
      else
      {
         w:=ReadMemUInt(pH,FrameBase+0x15B8)
         h:=ReadMemUInt(pH,FrameBase+0x15BC)
      }
      return true
   }   
}



ReadPlayerStats(hwnd, byRef PlayerStats)
{
   global baseMgrPtr
   global Steam

   GetWindowBasics(hwnd, mBase, pH)
   fBase:=GetFrameBase(hwnd)
   BaseMgr:=ReadMemUInt(pH,mBase+baseMgrPtr)
   if (Steam) 
   PlayerBase:=GetMultilevelPointer(pH,[fBase+0x158,0x5A0])
   else 
   PlayerBase:=GetMultilevelPointer(pH,[fBase+0x13C,0x5A0])
   Config:=GetMultilevelPointer(pH,[BaseMgr+0x180,0x108,0x8c])
   PlayerStats.ConfigPath:=ReadMemStr(ph,Config+0xa4,255,"UTF-16")
   PlayerMain:=ReadMemUInt(pH,PlayerBase+4)
   PlayerStatsOffset:=ReadMemUInt(pH,PlayerMain+0xC)
   PlayerStats.MaxHP:=ReadMemUInt(pH,PlayerStatsOffset+0x50)
   PlayerStats.CurrHP:=ReadMemUInt(pH,PlayerStatsOffset+0x54)  
   PlayerStats.ReservedHPFlat:=ReadMemUInt(pH,PlayerStatsOffset+0x5C)
   PlayerStats.ReservedHPPercent:=ReadMemUInt(pH,PlayerStatsOffset+0x60)
   PlayerStats.MaxMana:=ReadMemUInt(pH,PlayerStatsOffset+0x74)
   PlayerStats.ReservedManaFlat:=ReadMemUInt(pH,PlayerStatsOffset+0x80)
   PlayerStats.ReservedManaPercent:=ReadMemUInt(pH,PlayerStatsOffset+0x84)
   PlayerStats.CurrMana:=ReadMemUInt(pH,PlayerStatsOffset+0x78)
   PlayerStats.MaxNShield:=ReadMemUInt(pH,PlayerStatsOffset+0x98)
   PlayerStats.CurrNShield:=ReadMemUInt(pH,PlayerStatsOffset+0x9C)
   PlayerActionIDOffset:=ReadMemUInt(pH,PlayerMain+0x1C)
   PlayerActionID:=ReadMemUInt(pH,PlayerActionIDOffset+0x9C)
   SetFormat, IntegerFast, hex
   PlayerActionID += 0
   PlayerActionID .= ""
   StringRight, PlayerActionID2, PlayerActionID, 2
   SetFormat, IntegerFast, d
   PlayerStats.PlayerActionID:=PlayerActionID2
   if (Steam)
   {
      CheckBase:=GetMultilevelPointer(pH,[fBase+0x15c,0x220])
   }
   else
   CheckBase:=GetMultilevelPointer(pH,[fBase+0x140,0x220])
   ChatStatusOffset:=GetMultilevelPointer(pH,[CheckBase+0xd8,0x808,0x0])
   PlayerStats.ChatStatus:=ReadMemUInt(pH,ChatStatusOffset+0x860)
   MouseOnMonsterOffset:=ReadMemUInt(pH,CheckBase+0x184)
   PlayerStats.MouseOnMonsterStatus:=ReadMemUInt(pH,MouseOnMonsterOffset+0x860)

   PanelWaypointOffset:=ReadMemUInt(pH,CheckBase+0x118)
   PlayerStats.PanelWaypoint:=ReadMemUInt(pH,PanelWaypointOffset+0x860)
   PanelInventoryOffset:=ReadMemUInt(pH,CheckBase+0xF4)
   PlayerStats.PanelInventory:=ReadMemUInt(pH,PanelInventoryOffset+0x860)
   PanelSkillTreeOffset:=ReadMemUInt(pH,CheckBase+0x108)
   PlayerStats.PanelSkillTree:=ReadMemUInt(pH,PanelSkillTreeOffset+0x860)
   PanelSocialOffset:=ReadMemUInt(pH,CheckBase+0x104)
   PlayerStats.PanelSocial:=ReadMemUInt(pH,PanelSocialOffset+0x860)

   InCityOffset:=GetMultilevelPointer(pH,[CheckBase+0x11C,0x788,0x200])
   PlayerStats.InCity:=ReadMemUInt(pH,InCityOffset+0x860)
   EntityNamePtr:=GetMultilevelPointer(ph,[CheckBase+0x184,0x978,0xC10])
   EntityName:=ReadMemStr(ph,EntityNamePtr,70,"UTF-16")
   PlayerStats.EntityName:=EntityName
   EntityNamePtr2:=GetMultilevelPointer(ph,[CheckBase+0x184,0x978,0xB90])
   EntityName2:=ReadMemStr(ph,EntityNamePtr2+0x32,70,"UTF-16")
   PlayerStats.EntityName2:=EntityName2
}

ReadFlasksData(hwnd, byRef FlasksData)
{
   GetWindowBasics(hwnd, mBase, pH)
   
   UiBase:=GetUiBase(hwnd)
   
   if (!UiBase) ;not InGame
      return
   
   FlaskInvBase:=GetMultilevelPointer(pH,[UiBase+0x968,0x980,0x20])

   Loop, 5
   {
      currFlaskPtr:=ReadMemUInt(pH,FlaskInvBase+(A_Index-1)*4)

      if (currFlaskPtr!=0) ; there's a flask in said slot
      {
         FlasksData[A_Index]:={}

         If A_Index = 1
         {
            IniRead, Slot1Disabled, Config.ini, DisableSlot, DisableSlot1, 0
            If Slot1Disabled = 1
            continue
         }
         else If A_Index = 2
         {
            IniRead, Slot2Disabled, Config.ini, DisableSlot, DisableSlot2, 0
            If Slot2Disabled = 1
            continue
         }
         else If A_Index = 3
         {
            IniRead, Slot3Disabled, Config.ini, DisableSlot, DisableSlot3, 0
            If Slot3Disabled = 1
            continue
         }
         else If A_Index = 4
         {
            IniRead, Slot4Disabled, Config.ini, DisableSlot, DisableSlot4, 0
            If Slot4Disabled = 1
            continue
         }
         else If A_Index = 5
         {
            IniRead, Slot5Disabled, Config.ini, DisableSlot, DisableSlot5, 0
            If Slot5Disabled = 1
            continue
         }


         FlaskChargesPtr:=GetMultilevelPointer(ph,[currFlaskPtr,4,0x1C,4,4,0xC])
         FlasksData[A_Index].ChargesCurrent:=ReadMemUInt(pH,FlaskChargesPtr+0xC)
         FlasksData[A_Index].ChargesPerUse:=ReadMemUInt(pH,ReadMemUInt(pH,FlaskChargesPtr+8)+0xC)

         FlaskMod1Ptr:=GetMultilevelPointer(ph,[currFlaskPtr,4,0x1C,4,4,0x10,0x44,0x14,0x30])
         FlaskMod1Str:=ReadMemStr(ph,FlaskMod1Ptr,70,"UTF-16")
         FlasksData[A_Index].mod1:=FlaskMod1Str

         FlaskMod2Ptr:=GetMultilevelPointer(ph,[currFlaskPtr,4,0x1C,4,4,0x10,0x44,0x2c,0x30])
         FlaskMod2Str:=ReadMemStr(ph,FlaskMod2Ptr,70,"UTF-16")
         FlasksData[A_Index].mod2:=FlaskMod2Str

         if (FlasksData[A_Index].ChargesCurrent < FlasksData[A_Index].ChargesPerUse) ; not enough charges in this flask to use it, don't bother
            continue

         FlaskMetadataPtr:=GetMultilevelPointer(ph,[currFlaskPtr,0,8])
         FlaskMetadataStr:=ReadMemStr(ph,FlaskMetadataPtr,70,"UTF-16")
         FlaskTypeStr:=SubStr(FlaskMetadataStr,23)
         FlasksData[A_Index].type:=FlaskTypeStr

         FlaskLocalstatsPtr:=GetMultilevelPointer(ph,[currFlaskPtr,4,0x18,0x20,0xC])
         
         if InStr(FlaskTypeStr, "FlaskLife")
         {
            FlasksData[A_Index].HPRegAmount:=ReadMemUInt(pH,FlaskLocalstatsPtr+4)
            
            if (InStr(FlasksData[A_Index].mod1,"Bubbling"))
            FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0xC)/2.35)
            else if (InStr(FlasksData[A_Index].mod2,"Bubbling"))
            FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0xC)/2.35)
            else if (InStr(FlasksData[A_Index].mod1,"Saturated"))
            FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0xC)/0.67)
            else if (InStr(FlasksData[A_Index].mod2,"Saturated"))
            FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0xC)/0.67)
            else if (InStr(FlasksData[A_Index].mod1,"Catalysed"))
            FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0xC)/1.5)
            else if (InStr(FlasksData[A_Index].mod2,"Catalysed"))
            FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0xC)/1.5)
            else
            FlasksData[A_Index].EffectDuration:=ReadMemUInt(pH,FlaskLocalstatsPtr+0xC)

         }

         if InStr(FlaskTypeStr, "FlaskMana")
         {
            FlasksData[A_Index].ManaRegAmount:=ReadMemUInt(pH,FlaskLocalstatsPtr+4)

            if (InStr(FlasksData[A_Index].mod1,"Bubbling"))
            FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0xC)/2.35)
            else if (InStr(FlasksData[A_Index].mod2,"Bubbling"))
            FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0xC)/2.35)
            else if (InStr(FlasksData[A_Index].mod1,"Saturated"))
            FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0xC)/0.67)
            else if (InStr(FlasksData[A_Index].mod2,"Saturated"))
            FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0xC)/0.67)
            else if (InStr(FlasksData[A_Index].mod1,"Catalysed"))
            FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0xC)/1.5)
            else if (InStr(FlasksData[A_Index].mod2,"Catalysed"))
            FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0xC)/1.5)
            else
            FlasksData[A_Index].EffectDuration:=ReadMemUInt(pH,FlaskLocalstatsPtr+0xC)

         }
         
         if InStr(FlaskTypeStr, "FlaskHybrid")
         {
            FlasksData[A_Index].HPRegAmount:=ReadMemUInt(pH,FlaskLocalstatsPtr+4)
            FlasksData[A_Index].ManaRegAmount:=ReadMemUInt(pH,FlaskLocalstatsPtr+0xC)
            if (InStr(FlasksData[A_Index].mod1,"Bubbling"))
            FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0x14)/2.35)
            else if (InStr(FlasksData[A_Index].mod2,"Bubbling"))
            FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0x14)/2.35)
            else if (InStr(FlasksData[A_Index].mod1,"Saturated"))
            FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0x14)/0.67)
            else if (InStr(FlasksData[A_Index].mod2,"Saturated"))
            FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0x14)/0.67)
            else if (InStr(FlasksData[A_Index].mod1,"Catalysed"))
            FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0x14)/1.5)
            else if (InStr(FlasksData[A_Index].mod2,"Catalysed"))
            FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0x14)/1.5)
            else
            FlasksData[A_Index].EffectDuration:=ReadMemUInt(pH,FlaskLocalstatsPtr+0x14)
         }

         if InStr(FlaskTypeStr, "FlaskUtility")
         {
            FlasksData[A_Index].EffectDuration:=ReadMemUInt(pH,FlaskLocalstatsPtr+0x4)
         }
      }
   }
}

IsInGame(hwnd)
{
	global Steam
   if (hwnd=0 || hwnd="")
      return false
   GetWindowBasics(hwnd,mBase,pH)
   if (mBase="" || mBase=0 || pH="" || pH=-1)
      return false
   fBase:=GetFrameBase(hwnd)
   if (fBase="" || fBase=0)
      return false
   if (Steam)
   {
      localConnection:=ReadMemUInt(pH,fBase+0x15c)
   }
   else
   localConnection:=ReadMemUInt(pH,fBase+0x140)
   if (localConnection=0 || localConnection="")
      return false
   else
      return true
}

SetGameStateMenu(hwnd)
{
   global Steam
   if (hwnd=0 || hwnd="")
      return false
   GetWindowBasics(hwnd,mBase,pH)
   if (mBase="" || mBase=0 || pH="" || pH=-1)
      return false
   fBase:=GetFrameBase(hwnd)
   if (fBase="" || fBase=0)
      return false
   if (Steam)
   {
      localConnection:=ReadMemUInt(pH,fBase+0x15c)
   }
   else
   localConnection:=ReadMemUInt(pH,fBase+0x140)
   if (localConnection!="" && localConnection!=0)
   {
      WriteMemUInt(pH,localConnection+0x2A78,1)
   }
}

ReadHeroPos(hwnd,ByRef x, ByRef y)
{
   global Steam
   GetWindowBasics(hwnd,mBase,pH)
   if (mBase!=0 && pH && pH!=-1)
   {
      FrameBase:=GetFrameBase(hwnd)

      if (Steam) 
   	  PlayerPosBase:=GetMultilevelPointer(pH,[FrameBase+0x158,0x5A0,24])
      else 
      PlayerPosBase:=GetMultilevelPointer(pH,[FrameBase+0x13C,0x5A0,24])

      x:=ReadMemFloat(pH,PlayerPosBase+0x2c)
      y:=ReadMemFloat(pH,PlayerPosBase+0x30)

      return true
   }   
}

ScreenToClient(hwnd, ByRef x, ByRef y)
{
    VarSetCapacity(pt, 8)
    NumPut(x, pt, 0)
    NumPut(y, pt, 4)
    DllCall("ScreenToClient", "uint", hwnd, "uint", &pt)
    x := NumGet(pt, 0, "int")
    y := NumGet(pt, 4, "int")
   VarSetCapacity(pt, 0)
}

GetClientCoords(byRef mx, byRef my)
{
   hwnd:=WinActive("A")   
   CoordMode, Mouse, Screen
   MouseGetPos, mx, my
   ScreenToClient(hwnd,mx,my) ;  x 580   y 435
}

QuitToLoginScreen(hwnd)
{  
   if (!IsInGame(hwnd))
   {
      return
   }
   SetGameStateMenu(hwnd)
}

GetMaxChargesFlaskOfType(ByRef FlasksData,TypeStr)
{
   currMaxCharges:=0
   Loop, 5
      if (InStr(FlasksData[A_Index].type,TypeStr))
      {
         if FlasksData[A_Index].ChargesCurrent>currMaxCharges
         {
            currMaxI:=A_Index
            currMaxCharges:=FlasksData[A_Index].ChargesCurrent
         }
      }
   return currMaxI
}

GetMaxChargesFlaskQuickSilver(ByRef FlasksData,TypeStr)
{
   currMaxCharges:=0
   Loop, 5
      if (InStr(FlasksData[A_Index].type,TypeStr))
      {
         if FlasksData[A_Index].ChargesCurrent>=40
         {
            if FlasksData[A_Index].ChargesCurrent>currMaxCharges
            {
               currMaxI:=A_Index
               currMaxCharges:=FlasksData[A_Index].ChargesCurrent
            }
         }
      }
   return currMaxI
}

GetMaxChargesFlaskQuickSilver2(ByRef FlasksData,TypeStr)
{
   currMaxCharges:=0
   Loop, 5
      if (InStr(FlasksData[A_Index].type,TypeStr))
      {
         if FlasksData[A_Index].ChargesCurrent>=20
         {
            if FlasksData[A_Index].ChargesCurrent>currMaxCharges
            {
               currMaxI:=A_Index
               currMaxCharges:=FlasksData[A_Index].ChargesCurrent
            }
         }
      }
   return currMaxI
}

GetMaxChargesOfInstantFlask(ByRef FlasksData,TypeStr)
{
   global PanickedTimer
   currMaxCharges:=0
   Loop, 5
      if (InStr(FlasksData[A_Index].type,TypeStr))
      {
         if (InStr(FlasksData[A_Index].mod1,"Seething"))
         {
            if FlasksData[A_Index].ChargesCurrent>currMaxCharges
            {
               currMaxI:=A_Index
               currMaxCharges:=FlasksData[A_Index].ChargesCurrent
            }
         }
         else if (InStr(FlasksData[A_Index].mod2,"Seething"))
         {
            if FlasksData[A_Index].ChargesCurrent>currMaxCharges
            {
               currMaxI:=A_Index
               currMaxCharges:=FlasksData[A_Index].ChargesCurrent
            }
         }
         else if (InStr(FlasksData[A_Index].mod1,"Bubbling"))
         {
            if FlasksData[A_Index].ChargesCurrent>currMaxCharges
            {
               currMaxI:=A_Index
               currMaxCharges:=FlasksData[A_Index].ChargesCurrent
            }
         }
         else if (InStr(FlasksData[A_Index].mod2,"Bubbling"))
         {
            if FlasksData[A_Index].ChargesCurrent>currMaxCharges
            {
               currMaxI:=A_Index
               currMaxCharges:=FlasksData[A_Index].ChargesCurrent
            }
         }
         else if ((InStr(FlasksData[A_Index].mod1,"Panicked")) And ((PlayerStats.CurrHP/PlayerStats.MaxHP)<=0.35)) ; "Low life" can be caused by auras hp reservation from blood magic
         {
            if FlasksData[A_Index].ChargesCurrent>currMaxCharges
            {
               If (PanickedTimer>35)
               {
                  currMaxI:=A_Index
                  currMaxCharges:=FlasksData[A_Index].ChargesCurrent
                  PanickedTimer:= 0
               }
            }
         }
         else if ((InStr(FlasksData[A_Index].mod2,"Panicked")) And ((PlayerStats.CurrHP/PlayerStats.MaxHP)<=0.35)) ; "Low life" can be caused by auras hp reservation from blood magic
         {
            if FlasksData[A_Index].ChargesCurrent>currMaxCharges
            {
               If (PanickedTimer>35)
               {
                  currMaxI:=A_Index
                  currMaxCharges:=FlasksData[A_Index].ChargesCurrent
                  PanickedTimer:= 0
               }
            }
         }
      }
   return currMaxI
}

FileMD5( sFile="", cSz=4 )
{  ; by SKAN www.autohotkey.com/community/viewtopic.php?t=64211
	cSz := (cSz<0||cSz>8) ? 2**22 : 2**(18+cSz), VarSetCapacity( Buffer,cSz,0 ) ; 18-Jun-2009
	hFil := DllCall( "CreateFile", Str,sFile,UInt,0x80000000, Int,3,Int,0,Int,3,Int,0,Int,0 )
	IfLess,hFil,1, Return,hFil
	hMod := DllCall( "LoadLibrary", Str,"advapi32.dll" )
	DllCall( "GetFileSizeEx", UInt,hFil, UInt,&Buffer ),    fSz := NumGet( Buffer,0,"Int64" )
	VarSetCapacity( MD5_CTX,104,0 ),    DllCall( "advapi32\MD5Init", UInt,&MD5_CTX )
	Loop % ( fSz//cSz + !!Mod( fSz,cSz ) )
	DllCall( "ReadFile", UInt,hFil, UInt,&Buffer, UInt,cSz, UIntP,bytesRead, UInt,0 )
	, DllCall( "advapi32\MD5Update", UInt,&MD5_CTX, UInt,&Buffer, UInt,bytesRead )
	DllCall( "advapi32\MD5Final", UInt,&MD5_CTX )
	DllCall( "CloseHandle", UInt,hFil )
	Loop % StrLen( Hex:="123456789ABCDEF0" )
	N := NumGet( MD5_CTX,87+A_Index,"Char"), MD5 .= SubStr(Hex,N>>4,1) . SubStr(Hex,N&15,1)
	Return MD5, DllCall( "FreeLibrary", UInt,hMod )
}


Main()
{
   global AutoFlaskWatchdogPeriod
   global lagCompensation
   global PlayerConfig
   global WindowQueuedFlaskEffects
   global cliname
   global cliexe
   global cliexesteam
   global trayNotifications
   global autoQuitMode
   global desync
   global remaining
   global tradechat
   global borderless
   global ResyncTimer
   global ResyncSpam
   global tradechat
   global TradeSpam
   global TradeSpamTimer
   global TradeTimer
   global TradeChannel
   global TradeStep
   global PanickedTimer
   global QuickSilverCheck
   global QuickSilverCheck2
   global AutoShiftCheck
   global ShiftDownOn
   global ChatStatusTimer
   global ChatCheckTimer
   global Steam
   global MovementTimer
   global 20secsTimer
   global FLaskHotkey1
   global FLaskHotkey2
   global FLaskHotkey3
   global FLaskHotkey4
   global FLaskHotkey5

   WinGet, WinID, List, %cliname%
   
   Loop, %WinID%
   {
      
      WinGet, ProcModuleName, ProcessName,  % "ahk_id" WinID%A_Index%

      If (ProcModuleName!="PathOfExile.exe") And (ProcModuleName!="PathOfExileSteam.exe") ; got a window with title "Path of Exile" but exe is not Client.exe, perhaps we have browser window open with PoE site, ignore it
         continue

		If (ProcModuleName="PathOfExileSteam.exe")
		{
			Steam:=True
			cliexe:="PathOfExileSteam.exe"
		}
		Else If (ProcModuleName="PathOfExile.exe")
		{
			Steam:=False
			cliexe=PathOfExile.exe
		}


      if (!IsInGame(WinID%A_Index%)) ;not ingame
         continue
       
      if (WinID%A_Index%=WinActive("A"))
      ThisID:=WinActive("A")

      PlayerStats:={}
      ReadPlayerStats(WinID%A_Index%, PlayerStats)
      if (PlayerStats.MaxHP<1 || PlayerStats.CurrHP=0) ;dead, don't bother
         continue

      CurrentConfig:=PlayerConfig["Default"]

      If (A_TickCount>=20secsTimer+20000)
      {
         Loop, 5
         {
            ConfigPath:= PlayerStats.ConfigPath
            if (InStr(PlayerStats.ConfigPath,".ini"))
            {
               IniRead, HotkeyFlask%A_Index%, %ConfigPath%, ACTION_KEYS, use_flask_in_slot%A_Index%, %A_Index%
               vk:=HotkeyFlask%A_Index%
               SetFormat, IntegerFast, hex
               vk += 0
               vk .= ""
               SetFormat, IntegerFast, d
               FlaskHotkey%A_Index%={vk%vk% Down vk%vk% UP}
            }
            Else
            {
               FlaskHotkey%A_Index%={%A_Index% Down %A_Index% UP}
            }
         }
         20secsTimer:=A_TickCount
      }
      
      

      
      if PlayerStats.MaxNShield>0
      {
         currNShieldRatio:=PlayerStats.CurrNShield/PlayerStats.MaxNShield
      }
      else 
      currNShieldRatio:= 1
      
      if (PlayerStats.MaxHP>1)
      {
         currLifeRatio:=PlayerStats.CurrHP/(PlayerStats.MaxHP-PlayerStats.ReservedHPFlat-PlayerStats.MaxHP*PlayerStats.ReservedHPPercent/100)
      }
      else 
      currLifeRatio:= 1
      
      if (PlayerStats.MaxMana>0)
      {
         currManaRatio:=PlayerStats.CurrMana/(PlayerStats.MaxMana-PlayerStats.ReservedManaFlat-PlayerStats.MaxMana*PlayerStats.ReservedManaPercent/100)
      }
      

      if (currLifeRatio<CurrentConfig.minLifeRatioToQuit || currNShieldRatio<CurrentConfig.minNShieldRatioToQuit)
      {
         if (autoQuitMode=0)
         {
            TrayTip, PoE AutoQuit by Killing the Process, Specified min life reached, %A_Space% , 2
            WinKill, % "ahk_id" WinID%A_Index%
            continue
         }
         else if (autoQuitMode=1)
         {
            QuitToLoginScreen(WinID%A_Index%)
            continue
         }
         else if (autoQuitMode=3)
         {
            UsePortal()
            continue
         }
         else if (autoQuitMode=4)
         {

         }
      }
      
      FlasksData:=[]
      ReadFlasksData(WinID%A_Index%,FlasksData)
      
      WinGet, CurrPID, PID,  % "ahk_id" WinID%A_Index%
      hwnd:=WinID%A_Index%
      k="%hwnd%%CurrPid%"
      if (!WindowQueuedFlaskEffects.HasKey(k))
      {
         WindowQueuedFlaskEffects[k]:={}
      }
      
      if (currLifeRatio>=1)
         WindowQueuedFlaskEffects[k].hpQueueEndtime:=A_TickCount

      if (currLifeRatio>=1)
         WindowQueuedFlaskEffects[k].InstantQueueEndtime:=A_TickCount

      if (currManaRatio>=1)
         WindowQueuedFlaskEffects[k].ManaQueueEndtime:=A_TickCount



      
      if (currLifeRatio<CurrentConfig.minLifeRatioToDrink)
      {

         if ((!WindowQueuedFlaskEffects[k].HasKey("hpQueueEndtime")) || (A_TickCount>=(WindowQueuedFlaskEffects[k].hpQueueEndtime-lagCompensation)))
         {
            tflaskNum2:=GetMaxChargesFlaskOfType(FlasksData,"FlaskLife")
            tflaskNum1:=GetMaxChargesFlaskOfType(FlasksData,"FlaskHybrid")
            if ((tflaskNum1!=) && (tflaskNum2!=))
               flaskNum:=(FlasksData[tflaskNum1].ChargesCurrent>FlasksData[tflaskNum2].ChargesCurrent) ? tflaskNum1 : tflaskNum2
            else
            {
               if (tflaskNum1!="")
                  flaskNum:=tflaskNum1
               if (tflaskNum2!="")
                  flaskNum:=tflaskNum2
            }
            if (flaskNum!="")
            {  
               EffectDuration:=FlasksData[flaskNum].EffectDuration

               if (InStr(FlasksData[flaskNum].mod1,"Seething"))
                  WindowQueuedFlaskEffects[k].hpQueueEndtime:=A_TickCount+500

               else if (InStr(FlasksData[flaskNum].mod2,"Seething"))
                  WindowQueuedFlaskEffects[k].hpQueueEndtime:=A_TickCount+500

               else if ((InStr(FlasksData[flaskNum].mod1,"Panicked")) And ((PlayerStats.CurrHP/PlayerStats.MaxHP)<=0.35)) ; "Low life" can be caused by auras hp reservation from blood magic
                  WindowQueuedFlaskEffects[k].hpQueueEndtime:=A_TickCount+500

               else if ((InStr(FlasksData[flaskNum].mod2,"Panicked")) And ((PlayerStats.CurrHP/PlayerStats.MaxHP)<=0.35)) ; "Low life" can be caused by auras hp reservation from blood magic
                  WindowQueuedFlaskEffects[k].hpQueueEndtime:=A_TickCount+500

               else
               WindowQueuedFlaskEffects[k].hpQueueEndtime:=A_TickCount+EffectDuration*100


               if (trayNotifications)
               {
                  TrayTip, PoE AutoFlask Using HP flask %flaskNum%, %A_Space% , 2
               }
               hKey:=FlaskHotkey%flaskNum%
               ControlSend,,%hkey%, % "ahk_id" hwnd
               Break
            }
         }
      }

      if (currLifeRatio<CurrentConfig.minLifeRatioToInstant)
      {
         if ((!WindowQueuedFlaskEffects[k].HasKey("InstantQueueEndtime")) || (A_TickCount>=(WindowQueuedFlaskEffects[k].InstantQueueEndtime)))
         {
            tflaskNum2:=GetMaxChargesOfInstantFlask(FlasksData,"FlaskLife") ;need to change this
            if (tflaskNum2!="")
               flaskNum:=tflaskNum2
            if (flaskNum!="")
            {  
               IFDelay:= (CurrentConfig.IFlaskDelay*10)
               WindowQueuedFlaskEffects[k].InstantQueueEndtime:=A_TickCount+IFDelay
               if (trayNotifications)
               {
                  TrayTip, PoE AutoFlask Using HP Flask %flaskNum%, %A_Space% , 2
               }
               hKey:=FlaskHotkey%flaskNum%
               ControlSend,,%hkey%, % "ahk_id" hwnd
               break
            }
         }
      }

      if (currLifeRatio<CurrentConfig.minLifeRatioToPopJade || currNShieldRatio<CurrentConfig.minNShieldRatioToPopJade)
      {
         if ((!WindowQueuedFlaskEffects[k].HasKey("jadeQueueEndtime")) || (A_TickCount>=(WindowQueuedFlaskEffects[k].jadeQueueEndtime-lagCompensation)))
         {
            flaskNum:=GetMaxChargesFlaskOfType(FlasksData,"FlaskUtility9") ; Jade Flask
            if (flaskNum!="")
            {
               EffectDuration:=FlasksData[flaskNum].EffectDuration
               WindowQueuedFlaskEffects[k].jadeQueueEndtime:=A_TickCount+EffectDuration*100
               if (trayNotifications)
               {
                  TrayTip, PoE AutoFlask Using Jade Flask %flaskNum%, %A_Space% , 2
               }
               hKey:=FlaskHotkey%flaskNum%
               ControlSend,,%hkey%, % "ahk_id" hwnd
               break
            }
         }

         if ((!WindowQueuedFlaskEffects[k].HasKey("GraniteQueueEndtime")) || (A_TickCount>=(WindowQueuedFlaskEffects[k].GraniteQueueEndtime-lagCompensation)))
         {
            flaskNum:=GetMaxChargesFlaskOfType(FlasksData,"FlaskUtility5") ; Granite Flask
            if (flaskNum!="")
            {
               EffectDuration:=FlasksData[flaskNum].EffectDuration
               WindowQueuedFlaskEffects[k].GraniteQueueEndtime:=A_TickCount+EffectDuration*100
               if (trayNotifications)
               {
                  TrayTip, PoE AutoFlask Using Granite Flask %flaskNum%, %A_Space% , 2
               }
               hKey:=FlaskHotkey%flaskNum%
               ControlSend,,%hkey%, % "ahk_id" hwnd
               break
            }
         }
      }

      if (currLifeRatio<CurrentConfig.minLifeRatioToPopElementalResist || currNShieldRatio<CurrentConfig.minNShieldRatioToPopElementalResist)
      {
         if ((!WindowQueuedFlaskEffects[k].HasKey("RubyQueueEndtime")) || (A_TickCount>=(WindowQueuedFlaskEffects[k].RubyQueueEndtime-lagCompensation)))
         {
            flaskNum:=GetMaxChargesFlaskOfType(FlasksData,"FlaskUtility2") ; Ruby flask
            if (flaskNum!="")
            {
               EffectDuration:=FlasksData[flaskNum].EffectDuration
               WindowQueuedFlaskEffects[k].RubyQueueEndtime:=A_TickCount+EffectDuration*100
               if (trayNotifications)
               {
                  TrayTip, PoE AutoFlask Using Ruby Flask %flaskNum%, %A_Space% , 2
               }
               hKey:=FlaskHotkey%flaskNum%
               ControlSend,,%hkey%, % "ahk_id" hwnd
               break
            }
         }

         if ((!WindowQueuedFlaskEffects[k].HasKey("TopazQueueEndtime")) || (A_TickCount>=(WindowQueuedFlaskEffects[k].TopazQueueEndtime-lagCompensation)))
         {
            flaskNum:=GetMaxChargesFlaskOfType(FlasksData,"FlaskUtility4") ; Topaz flask
            if (flaskNum!="")
            {
               EffectDuration:=FlasksData[flaskNum].EffectDuration
               WindowQueuedFlaskEffects[k].TopazQueueEndtime:=A_TickCount+EffectDuration*100
               if (trayNotifications)
               {
                  TrayTip, PoE AutoFlask Using Topaz Flask %flaskNum%, %A_Space% , 2
               }
               hKey:=FlaskHotkey%flaskNum%
               ControlSend,,%hkey%, % "ahk_id" hwnd
               break
            }
         }

         if ((!WindowQueuedFlaskEffects[k].HasKey("SapphireQueueEndtime")) || (A_TickCount>=(WindowQueuedFlaskEffects[k].SapphireQueueEndtime-lagCompensation)))
         {
            flaskNum:=GetMaxChargesFlaskOfType(FlasksData,"FlaskUtility3") ; Sapphire flask
            if (flaskNum!="")
            {
               EffectDuration:=FlasksData[flaskNum].EffectDuration
               WindowQueuedFlaskEffects[k].SapphireQueueEndtime:=A_TickCount+EffectDuration*100
               if (trayNotifications)
               {
                  TrayTip, PoE AutoFlask Using Sapphire flask %flaskNum%, %A_Space% , 2
               }
               hKey:=FlaskHotkey%flaskNum%
               ControlSend,,%hkey%, % "ahk_id" hwnd
               break
            }
         }

         if ((!WindowQueuedFlaskEffects[k].HasKey("AmethystQueueEndtime")) || (A_TickCount>=(WindowQueuedFlaskEffects[k].AmethystQueueEndtime-lagCompensation)))
         {
            flaskNum:=GetMaxChargesFlaskOfType(FlasksData,"FlaskUtility7") ; Amethyst flask
            if (flaskNum!="")
            {
               EffectDuration:=FlasksData[flaskNum].EffectDuration
               WindowQueuedFlaskEffects[k].AmethystQueueEndtime:=A_TickCount+EffectDuration*100
               if (trayNotifications)
               {
                  TrayTip, PoE AutoFlask Using Amethyst Flask %flaskNum%, %A_Space% , 2
               }
               hKey:=FlaskHotkey%flaskNum%
               ControlSend,,%hkey%, % "ahk_id" hwnd
               break
            }
         }
      }

      if (PlayerStats.MaxMana>0 && (currManaRatio<CurrentConfig.minManaRatioToDrink || PlayerStats.CurrMana<CurrentConfig.minManaToDrink))
      {      
         if ((!WindowQueuedFlaskEffects[k].HasKey("ManaQueueEndtime")) || (A_TickCount>=(WindowQueuedFlaskEffects[k].ManaQueueEndtime-lagCompensation)))
         {
            tflaskNum2:=GetMaxChargesFlaskOfType(FlasksData,"FlaskMana")
            tflaskNum1:=GetMaxChargesFlaskOfType(FlasksData,"FlaskHybrid")
              
            if ((tflaskNum1!=) && (tflaskNum2!=))
               flaskNum:=(FlasksData[tflaskNum1].ChargesCurrent>FlasksData[tflaskNum2].ChargesCurrent) ? tflaskNum1 : tflaskNum2
            else
            {
               if (tflaskNum1!="")
                  flaskNum:=tflaskNum1
               if (tflaskNum2!="")
                  flaskNum:=tflaskNum2
            }

            if (flaskNum!="")
            {

               EffectDuration:=FlasksData[flaskNum].EffectDuration

               if (InStr(FlasksData[flaskNum].mod1,"Seething"))
                  WindowQueuedFlaskEffects[k].ManaQueueEndtime:=A_TickCount+500

               else if (InStr(FlasksData[flaskNum].mod2,"Seething"))
                  WindowQueuedFlaskEffects[k].ManaQueueEndtime:=A_TickCount+500

               else if ((InStr(FlasksData[flaskNum].mod1,"Panicked")) And ((PlayerStats.CurrHP/PlayerStats.MaxHP)<=0.35)) ; "Low life" can be caused by auras hp reservation from blood magic
                  WindowQueuedFlaskEffects[k].ManaQueueEndtime:=A_TickCount+500

               else if ((InStr(FlasksData[flaskNum].mod2,"Panicked")) And ((PlayerStats.CurrHP/PlayerStats.MaxHP)<=0.35)) ; "Low life" can be caused by auras hp reservation from blood magic
                  WindowQueuedFlaskEffects[k].ManaQueueEndtime:=A_TickCount+500

               else
               WindowQueuedFlaskEffects[k].ManaQueueEndtime:=A_TickCount+EffectDuration*100

               if (trayNotifications)
               {
                  TrayTip, PoE AutoFlask Using Mana Flask %flaskNum%, %A_Space% , 2
               }
               hKey:=FlaskHotkey%flaskNum%
               ControlSend,,%hkey%, % "ahk_id" hwnd
               Break
            }
         }
      }

      if (PlayerStats.PlayerActionID!="" && PlayerStats.PlayerActionID!=80 && PlayerStats.PlayerActionID!=90)
      {
         MovementTimer:= A_TickCount
      }
      ;TODO MovementTimer%A_Index%

      if(QuickSilverCheck)
      {
         if (PlayerStats.InCity!="" && PlayerStats.InCity=65537)
         {
            if (PlayerStats.PanelWaypoint=65536 && PlayerStats.PanelInventory=65536 && PlayerStats.PanelSkillTree=65536 && PlayerStats.PanelSocial=65536)
            {
               if (PlayerStats.ChatStatus!="" && PlayerStats.ChatStatus=65536)
               {
                  if (PlayerStats.PlayerActionID!="" && (PlayerStats.PlayerActionID=80 || PlayerStats.PlayerActionID=90))
                  {
                     If (A_TickCount>=MovementTimer+CurrentConfig.QuickSilverTimer)
                     {
                        if ((!WindowQueuedFlaskEffects[k].HasKey("QuickQueueEndtime")) || (A_TickCount>=(WindowQueuedFlaskEffects[k].QuickQueueEndtime-lagCompensation)))
                        {
                           flaskNum:=GetMaxChargesFlaskQuickSilver(FlasksData,"FlaskUtility6") ; QuickSilver flask
                           if (flaskNum!="")
                           {
                              EffectDuration:=FlasksData[flaskNum].EffectDuration
                              WindowQueuedFlaskEffects[k].QuickQueueEndtime:=A_TickCount+EffectDuration*100
                              if (trayNotifications)
                              {
                                 TrayTip, PoE AutoFlask Using QuickSilver Flask %flaskNum%, %A_Space% , 2
                              }
                              hKey:=FlaskHotkey%flaskNum%
                              ControlSend,,%hkey%, % "ahk_id" hwnd
                              break
                           }
                        }
                     }
                  }
               }
            }
         }
      }

      if(QuickSilverCheck2)
      {
         if (PlayerStats.InCity!="" && PlayerStats.InCity=65537)
         {
            if (PlayerStats.ChatStatus!="" && PlayerStats.ChatStatus=65536)
            {
               if (PlayerStats.PanelWaypoint=65536 && PlayerStats.PanelInventory=65536 && PlayerStats.PanelSkillTree=65536 && PlayerStats.PanelSocial=65536)
               {
                  if (PlayerStats.PlayerActionID!="" && (PlayerStats.PlayerActionID=80 || PlayerStats.PlayerActionID=90))
                  {
                     If (A_TickCount>=MovementTimer+CurrentConfig.QuickSilverTimer)
                     {
                        if ((!WindowQueuedFlaskEffects[k].HasKey("QuickQueueEndtime")) || (A_TickCount>=(WindowQueuedFlaskEffects[k].QuickQueueEndtime-lagCompensation)))
                        {
                           flaskNum:=GetMaxChargesFlaskQuickSilver2(FlasksData,"FlaskUtility6") ; QuickSilver flask
                           if (flaskNum!="")
                           {
                              EffectDuration:=FlasksData[flaskNum].EffectDuration
                              WindowQueuedFlaskEffects[k].QuickQueueEndtime:=A_TickCount+EffectDuration*100
                              if (trayNotifications)
                              {
                                 TrayTip, PoE AutoFlask Using QuickSilver flask %flaskNum%, %A_Space% , 2
                              }
                              hKey:=FlaskHotkey%flaskNum%
                              ControlSend,,%hkey%, % "ahk_id" hwnd
                              break
                           }
                        }
                     }
                  }
               }
            }
         }
      }
      
      if(AutoShiftCheck)
      {
         if (IsInGame(hwnd))
         {
            if (PlayerStats.InCity!="" && PlayerStats.InCity=65537)
            {
               if (PlayerStats.PanelWaypoint=65536 && PlayerStats.PanelInventory=65536 && PlayerStats.PanelSkillTree=65536 && PlayerStats.PanelSocial=65536)
               {
                  if (PlayerStats.MouseOnMonsterStatus!="" && PlayerStats.MouseOnMonsterStatus=65537)
                  {
                     if (PlayerStats.ChatStatus!="" && PlayerStats.ChatStatus=65536)
                     {
                        if (PlayerStats.EntityName!="")
                        {
                           if (PlayerStats.EntityName2!="Oak}" && PlayerStats.EntityName2!="Alira}" && PlayerStats.EntityName2!="Kraityn}")
                           {
                              If (InStr(PlayerStats.EntityName2,"Shrine") || InStr(PlayerStats.EntityName2,"Level"))
                              {
                                 If ShiftDownOn = 1
                                 {
                                    GetKeyState, stateSH, SHIFT, P
                                    if stateSH = D
                                    {
                                       Sendinput {SHIFT up}
                                    }
                                    ShiftDownOn:= 0
                                 }
                              }
                              Else
                              {
                                 IfWinActive Path of Exile ahk_class Direct3DWindowClass
                                 {
                                    Sendinput {SHIFT Down}
                                    ShiftDownOn:= 1
                                 } 
                                 Else
                                 {
                                    If ShiftDownOn = 1
                                    {
                                       GetKeyState, stateSH, SHIFT, P
                                       if stateSH = D
                                       {
                                          Sendinput {SHIFT up}
                                       }
                                       ShiftDownOn:= 0
                                    } 
                                 }                                    
                              }
                           }
                           Else
                           {
                              If ShiftDownOn = 1
                              {
                                 GetKeyState, stateSH, SHIFT, P
                                 if stateSH = D
                                 {
                                    Sendinput {SHIFT up}
                                 }
                                 ShiftDownOn:= 0
                              }
                           } 
                        }
                        Else
                        {
                           If ShiftDownOn = 1
                           {
                              GetKeyState, stateSH, SHIFT, P
                              if stateSH = D
                              {
                                 Sendinput {SHIFT up}
                              }
                              ShiftDownOn:= 0
                           }
                        }   
                     }
                     Else
                     {
                        If ShiftDownOn = 1
                        {
                           GetKeyState, stateSH, SHIFT, P
                           if stateSH = D
                           {
                              Sendinput {SHIFT up}
                           }
                           ShiftDownOn:= 0
                        }
                     }
                  }
                  Else If (PlayerStats.MouseOnMonsterStatus!="" && PlayerStats.MouseOnMonsterStatus=65536)
                  {
                     If ShiftDownOn = 1
                     {
                        GetKeyState, stateSH, SHIFT, P
                        if stateSH = D
                        {
                           Sendinput {SHIFT up}
                        }
                        ShiftDownOn:= 0
                     }
                  }
               }
               Else
               {
                  If ShiftDownOn = 1
                  {
                     GetKeyState, stateSH, SHIFT, P
                     if stateSH = D
                     {
                        Sendinput {SHIFT up}
                     }
                     ShiftDownOn:= 0
                  }
               }
            }
            Else
            {
               If ShiftDownOn = 1
               {
                  GetKeyState, stateSH, SHIFT, P
                  if stateSH = D
                  {
                     Sendinput {SHIFT up}
                  }
                  ShiftDownOn:= 0
               }
            }
         }
         Else
         {
            If ShiftDownOn = 1
            {
               GetKeyState, stateSH, SHIFT, P
               if stateSH = D
               {
                  Sendinput {SHIFT up}
               }
               ShiftDownOn:= 0
            }
         }


      }
      
   ;if (PlayerStats.PlayerActionID!="" && PlayerStats.PlayerActionID=2176)  ;2048 not
   ;if ((autoQuit=1) && (ThisID!="") && (ThisID!=WinActive("A")))
   ;WinActivate, % "ahk_id" ThisID
      
      ++PanickedTimer  ;TODO better way


      if desync = 1
      {
         if (PlayerStats.ChatStatus!="" && PlayerStats.ChatStatus=65536)
         {
            if (IsInGame(hwnd))
            {
               if (PlayerStats.PanelWaypoint=65536 && PlayerStats.PanelInventory=65536 && PlayerStats.PanelSkillTree=65536 && PlayerStats.PanelSocial=65536)
                  {
                  IfWinActive Path of Exile ahk_class Direct3DWindowClass
                  {
                     SendInput {NumpadEnter}/oos{NumpadEnter}
                  }
                  Else
                  {
                     ControlSend,,{NumpadEnter}, % "ahk_id" hwnd
                     SetKeyDelay, 40, 20
                     ControlSend,,`/oos, % "ahk_id" hwnd
                     SetKeyDelay, 0, 0
                     ControlSend,,{NumpadEnter}, % "ahk_id" hwnd
                  }
               }
            }
         }
         desync := 0
      }

      if remaining = 1
      {
         if (PlayerStats.ChatStatus!="" && PlayerStats.ChatStatus=65536)
         {
            if (IsInGame(hwnd))
            {
               if (PlayerStats.PanelWaypoint=65536 && PlayerStats.PanelInventory=65536 && PlayerStats.PanelSkillTree=65536 && PlayerStats.PanelSocial=65536)
               {
                  IfWinActive Path of Exile ahk_class Direct3DWindowClass
                  {
                     SendInput {NumpadEnter}/remaining{NumpadEnter}
                  }
                  Else
                  {
                     ControlSend,,{NumpadEnter}, % "ahk_id" hwnd
                     SetKeyDelay, 40, 20
                     ControlSend,,`/remaining, % "ahk_id" hwnd
                     SetKeyDelay, 0, 0
                     ControlSend,,{NumpadEnter}, % "ahk_id" hwnd
                  }
               }
            }
            remaining := 0
            break
         }
      }

      if (PlayerStats.ChatStatus!="" && PlayerStats.ChatStatus=65536)
      {
         ChatCheckTimer:= 1
      }

      if (PlayerStats.ChatStatus!="" && PlayerStats.ChatStatus=65537)
      {
         If (A_TickCount>=(ChatStatusTimer+50))
         {
            if (IsInGame(hwnd))
            {
               IfWinActive Path of Exile ahk_class Direct3DWindowClass
               {
                  ResyncTimer:= 0
                  TradeSpam:= 0
                  GuiControl, , TradeSpam, 0
                  GuiControl, , TradeSpamUpdate, 0
                  IniWrite, 0 , Config.ini, Config, TradeSpam
                  TradeChannel:= 1
                  tradechat:= 0
                  TradeTimer:= 0
                  TradeStep:= 3
                  TradeSpamTimer:= 3
               }
            }
         }
         Else
         {
            If ChatCheckTimer = 1
            {
               ChatStatusTimer:= A_TickCount
               ChatCheckTimer:= 0
            }
         }
      }

      If TradeSpam>0
      {
         If (A_TickCount>=(TradeSpamTimer+TradeSpam*60000))
         {
            tradechat:= 1
            TradeSpamTimer:= A_TickCount
         }
         Else If TradeSpamTimer = 3
         {
            tradechat:= 1
            TradeSpamTimer:= A_TickCount
         }
      }

      if tradechat = 1
      {
         SendMode, Input
         If (A_TickCount>=TradeTimer+1000+(TradeSpam*2000))
         {
            if (PlayerStats.ChatStatus!="" && PlayerStats.ChatStatus=65536)
            {
               if (IsInGame(hwnd))
               { 
                  if (PlayerStats.PanelWaypoint=65536 && PlayerStats.PanelInventory=65536 && PlayerStats.PanelSkillTree=65536 && PlayerStats.PanelSocial=65536)
                  {
                     IfWinActive Path of Exile ahk_class Direct3DWindowClass
                     {
                        SendMode Input
                        GetKeyState, stateSH, SHIFT, P
                        if stateSH = D
                        {
                           Sendinput {SHIFT up}
                        }
                        If (TradeStep = 1)
                        {
                           Send {NumpadEnter}
                           Send /trade %TradeChannel%
                           Send {NumpadEnter}
                           TradeStep:= 2
                           TradeTimer:= A_TickCount
                        }
                        else If (TradeStep = 2)
                        {
                           Send {NumpadEnter}{Up 2}{NumpadEnter}
                           TradeStep:= 3
                           TradeTimer:= A_TickCount
                        }
                        else If (TradeStep = 3)
                        {
                           If (TradeChannel<10)
                           {
                              TradeChannel++
                              TradeStep:= 1
                              TradeTimer:= A_TickCount
                           }
                           Else
                           {
                              TradeChannel:= 1
                              tradechat:= 0
                              TradeTimer:= 0
                              TradeStep:= 1
                           }
                        }
                     }
                     Else
                     {
                        SendMode Input
                        GetKeyState, stateSH, SHIFT, P
                        if stateSH = D
                        {
                           Sendinput {SHIFT up}
                        }
                        If (TradeStep = 1)
                        {
                           SetKeyDelay, 60, 20
                           ControlSend,,{NumpadEnter}, % "ahk_id" hwnd
                           ControlSendRaw,,`/trade %TradeChannel%, % "ahk_id" hwnd
                           ControlSend,,{NumpadEnter}, % "ahk_id" hwnd
                           SetKeyDelay, 0, 0
                           TradeStep:= 2
                           TradeTimer:= A_TickCount
                        }
                        else If (TradeStep = 2)
                        {
                           SetKeyDelay, 20, 20
                           ControlSend,,{NumpadEnter}{Up 2}{NumpadEnter}, % "ahk_id" hwnd
                           SetKeyDelay, 0, 0
                           TradeStep:= 3
                           TradeTimer:= A_TickCount
                        }
                        else If (TradeStep = 3)
                        {
                           If (TradeChannel<10)
                           {
                              TradeChannel++
                              TradeStep:= 1
                              TradeTimer:= A_TickCount
                           }
                           Else
                           {
                              TradeChannel:= 1
                              tradechat:= 0
                              TradeTimer:= 0
                              TradeStep:= 1
                           }
                        }
                     }
                  }
               }
               ChatStatusTimer:= A_TickCount+99999999999
               ChatCheckTimer:= 1
            }
         }
      }
      Else
      {
         If (A_TickCount>=(ResyncTimer+ResyncSpam*1000) And (ResyncSpam>0))
         {
            if (PlayerStats.InCity!="" && PlayerStats.InCity=65537)
            { 
               if (PlayerStats.ChatStatus!="" && PlayerStats.ChatStatus=65536)
               {
                  if (IsInGame(hwnd))
                  {
                     if (PlayerStats.PanelWaypoint=65536 && PlayerStats.PanelInventory=65536 && PlayerStats.PanelSkillTree=65536 && PlayerStats.PanelSocial=65536)
                     {
                        IfWinActive Path of Exile ahk_class Direct3DWindowClass
                        {
                           GetKeyState, stateSH, SHIFT, P
                           if stateSH = D
                           {
                              Sendinput {SHIFT up}
                           }
                           Sendinput {NumpadEnter}/oos{NumpadEnter}
                        }
                     }
                  }
               }
            }
            ResyncTimer:= A_TickCount
         }
      }
   }

   Sleep, %AutoFlaskWatchdogPeriod%   
}

;-------MAIN FUNCTIONS-----------------MAIN FUNCTIONS-----------------MAIN FUNCTIONS-----------------

;-------TEST FUNCTIONS-----------------TEST FUNCTIONS-----------------TEST FUNCTIONS-----------------


UsePortal()
{
   IfWinActive Path of Exile ahk_class Direct3DWindowClass
   {
      BlockInput On
      SendMode Input
      hwnd:=WinActive("A")
      GetKeyState, stateR, RButton, P
      if stateR = D
      {
         Send {RButton up}
      }
      GetKeyState, stateL, LButton, P
      if stateL = D
      {
         Send {LButton up}
      }
      GetKeyState, stateM, MButton, P
      if stateM = D
      {
         Send {MButton up}
      }
      GetKeyState, stateQ, Q, P
      if stateQ = D
      {
         Send {Q up}
      }
      GetKeyState, stateW, W, P
      if stateW = D
      {
         Send {W up}
      }
      GetKeyState, stateE, E, P
      if stateE = D
      {
         Send {E up}
      }
      GetKeyState, stateR, R, P
      if stateR = D
      {
         Send {R up}
      }
      GetKeyState, stateT, T, P
      if stateT = D
      {
         Send {T up}
      }
      GetKeyState, stateI, I, P
      if stateI = D
      {
         Send {I up}
      }
      GetKeyState, stateSP, SPACE, P
      if stateSP = D
      {
         Send {SPACE up}
      }
      GetKeyState, stateSH, SHIFT, P
      if stateSH = D
      {
         Send {SHIFT up}
      }
      ReadClientResolution(hwnd,w,h)
      Send {SPACE}
      Send {NumpadEnter}
      Send {Raw} /oos
      Send {NumpadEnter}
      Send {i}
      ErrorLevel = 1
      Sleep, 50
      ScrollX:= (w/2)
      ScrollY:= (h/2)
      PixelSearch, ScrollX, ScrollY, ScrollX, ScrollY, w, h, 0xFFFFFF, 1, fast  ;2b1d35  312238
      If ErrorLevel = 0
      {
         MouseMove, (ScrollX), (ScrollY),0
         If PortalInvCheck() = true
         {

         }
         Else If PortalInvCheck() = false
         {
            ScrollX:= (w/2)
            Loop
            {
               ErrorLevel = 1
               PixelSearch, ScrollX2, ScrollY2, ScrollX, ScrollY, (ScrollX+50), (ScrollY+10), 0xFFFFFF, 1, fast ;0xFBFBFB, 4, fast  ;2b1d35  312238
               If ErrorLevel = 0
               {
                  MouseMove, (ScrollX2), (ScrollY2),0
                  If PortalInvCheck() = true
                     Break
                  Else If PortalInvCheck() = false
                  {
                     Send {SPACE}
                     MouseMove, (w/2), (h/2), 0                      
                     BlockInput Off
                     Return
                  }
               }
               else
               {
                  ScrollX:= (ScrollX+50)
                  Continue
               }
            }
         }
      }
      Send {RButton}
      Send {SPACE}
      Sleep, 50
      MouseMove, (w/2), (h/2),0
      Sleep, 50
      Send {LButton}
      sleep, 250
      Loop
      {
         ErrorLevel = 1
         PixelSearch, PixX, PixY, (w/4), (h/10), ((w/4)*3), h, 0xddbb30, 34, fast  ;0xdcc8c8 text color
         if ErrorLevel = 0
         {
            MouseMove, (PixX), (PixY),0
            Sleep, 20
            Send {LButton}
            Loop ;only search for portals when not moving
            {  
               ReadHeroPos(hwnd,PosX1,PosY1)
               sleep, 30
               ReadHeroPos(hwnd,PosX2,PosY2)
               if PosX1 = %PosX2%
               {
                  If PosY1 = %PosY2%
                  {
                     break
                  }
            
               }
               else
               sleep, 30
            }
         }
         else
         {
            Break
         }
      }
      Sleep, 50
      MouseMove, (w/2), (h/2),0
      Sleep, 50
      Send {LButton}
      Sleep, 50
      BlockInput Off
   }
   Else
   return
}

; Poe Default Style 0x14CF0000

Toggle_Window(window)
{
   global ClientX, ClientY, ClientW, ClientH
   IfWinActive Path of Exile ahk_class Direct3DWindowClass
   {
      WinGet, S, Style, % "ahk_id " window   ; Get the style of the window
      If (S & +0x840000)      ; if not borderless
      {
         WinGetPos, ClientX, ClientY, ClientW, ClientH
         hwnd:=WinActive("A")
         ReadClientResolution(hwnd,w,h)
         
         WinSet, Style, -0x840000, % "ahk_id " window   ; Remove borders
         WinSet, Style, -0x400000, % "ahk_id " window

         WinMove, % "ahk_id " window,, %ClientX%, %ClientY%, %w%, %h%
         Confine := !Confine
         ClipCursor(Confine, (ClientX), (ClientY), (ClientX+w),(ClientY+h))
         return
      }
      If (S & -0x840000)      ; if borderless
      {
         WinSet, Style, +0x840000, % "ahk_id " window   ; Reapply borders
         WinSet, Style, +0x400000, % "ahk_id " window
         WinMove, % "ahk_id " window,, %ClientX%, %ClientY%, %ClientW%, %ClientW%
         Confine := !Confine
         ClipCursor(Confine, 0, 0, A_ScreenWidth, A_ScreenHeight)
         return
      }
   }
}

ClipCursor( Confine=True, x1=0 , y1=0, x2=1, y2=1 ) 
{
   VarSetCapacity(R,16,0),  NumPut(x1,&R+0),NumPut(y1,&R+4),NumPut(x2,&R+8),NumPut(y2,&R+12)
   Return Confine ? DllCall( "ClipCursor", UInt,&R ) : DllCall( "ClipCursor" )
}

; Parse clipboard content for item level and dps
Webgrab()
{
   global Rarity
   IfWinActive Path of Exile ahk_class Direct3DWindowClass
   {
      SendMode Input
      clipboard =  ; Start off empty to allow ClipWait to detect when the text has arrived.
      ErrorLevel = 0
      Send ^c
      ClipWait, 0.05  ; Wait for the clipboard to contain text.
      If ErrorLevel = 1
      {
         return
      }
      NameIsDone := False
      ItemName :=

      Loop, Parse, Clipboard, `n, `r
      {
         ; Clipboard must have "Rarity:" in the first line
         If A_Index = 1
         {
            IfNotInString, A_LoopField, Rarity:
            {
               Exit
            }
            IfInString, A_LoopField, Rarity: Magic
            {
               Rarity:= 2
            }
            IfInString, A_LoopField, Rarity: Rare
            {
               Rarity:= 3
            }
            Else
            {
               Continue
            }

         }
      
         ; Get name
         If Not NameIsDone
         {
            If A_LoopField = --------
            {
               NameIsDone := True
            }
            Else
            {
               ItemName%A_Index% = %A_LoopField%
            }
            Continue
         }

         If (Rarity = 2)
         {
            IfInString, ItemName2, Flask
            {
               ItemName2 = Flask
               Run http://pathofexile.gamepedia.com/%ItemName2%
               Rarity:= 0
               return
            }
            Run http://www.poemods.com
            Rarity:= 0
            return
         }


         If (Rarity = 3)
         {
            Run http://www.poemods.com
            Rarity:= 0
            return
         }
         Else
         {
            StringReplace, ItemName2_, ItemName2, %A_SPACE%, _, All
            Run http://pathofexile.gamepedia.com/%ItemName2_%
            Rarity:= 0
            return
         }
      }
   }
   return
}


PortalInvCheck()
{
IfWinActive Path of Exile ahk_class Direct3DWindowClass
{
         SendMode Input
         clipboard =  ; Start off empty to allow ClipWait to detect when the text has arrived.
         ErrorLevel = 0
         Send ^c
         ClipWait, 0.05  ; Wait for the clipboard to contain text.
         If ErrorLevel = 1
         {
            return false
         }

        ItemLevel := ""
        Name := ""
        Type := ""
        Quality := 0
        AttackSpeed := 0
        PhysicalDamageLow := 0
        PhysicalDamageHigh := 0
        IncreasedPhysicalDamage := 0
        FireDamageLow := 0
        FireDamageHigh := 0
        ColdDamageLow := 0
        ColdDamageHigh := 0
        LightningDamageLow := 0
        LightningDamageHigh := 0
        ChaosDamageLow := 0
        ChaosDamageHigh := 0
        Armour := 0
        EvasionRating := 0
        EnergyShield := 0
         

        Loop, parse, Clipboard, `n, `r          ; Goes through a loop with the lines of text found in the clipboard
        {
                if (A_Index = 1)
                {
                        IfNotInString, A_Loopfield, Rarity:             ; Starts a check whether it has "Rarity:" in the first line, otherwise exit
                        {
                                Exit
                        }
                }
                else if (A_Index = 2)
                {
                        Name := A_Loopfield
                }
                else if (A_Index = 3)
                {
                        Type := A_Loopfield
                }
                else if (!ItemLevel && RegExMatch(A_Loopfield, "Itemlevel: (\d*)", SubPat))
                {
                        ItemLevel := SubPat1
                }
                else if (!Quality && RegExMatch(A_Loopfield, "Quality: \+(\d*)\%", SubPat))
                {
                        Quality := SubPat1/100
                }
               
                else if (!AttackSpeed && RegExMatch(A_Loopfield, "Attacks per Second: (\d\.\d*)", SubPat))
                {
                        AttackSpeed     := SubPat1
                }
                else if (!PhysicalDamageLow && RegExMatch(A_Loopfield, "Physical Damage: (\d*)-(\d*)", SubPat))
                {
                        PhysicalDamageLow := SubPat1
                        PhysicalDamageHigh := SubPat2
                }
                else if (!IncreasedPhysicalDamage && RegExMatch(A_Loopfield, "(\d*)\% increased Physical Damage", SubPat))
                {
                        IncreasedPhysicalDamage := SubPat1/100
                }
               
                else if (!FireDamageLow && RegExMatch(A_Loopfield, "Adds (\d*)-(\d*) Fire Damage", SubPat))
                {
                        FireDamageLow := SubPat1
                        FireDamageHigh := SubPat2
                }
                else if (!ColdDamageLow && RegExMatch(A_Loopfield, "Adds (\d*)-(\d*) Cold Damage", SubPat))
                {
                        ColdDamageLow := SubPat1
                        ColdDamageHigh := SubPat2
                }
                else if (!LightningDamageLow && RegExMatch(A_Loopfield, "Adds (\d*)-(\d*) Lightning Damage", SubPat))
                {
                        LightningDamageLow := SubPat1
                        LightningDamageHigh := SubPat2
                }
                else if (!ChaosDamageLow && RegExMatch(A_Loopfield, "Adds (\d*)-(\d*) Chaos Damage", SubPat))
                {
                        ChaosDamageLow := SubPat1
                        ChaosDamageHigh := SubPat2
                }      
               
                else if (!Armour && RegExMatch(A_Loopfield, "Armour: (\d*)", SubPat))
                {
                        Armour:= SubPat1
                }
                else if (!EvasionRating && RegExMatch(A_Loopfield, "Evasion Rating: (\d*)", SubPat))
                {
                        EvasionRating:= SubPat1
                }
                else if (!EnergyShield && RegExMatch(A_Loopfield, "Energy Shield: (\d*)", SubPat))
                {
                        EnergyShield:= SubPat1
                }      
         }
   
      if (!ItemLevel) ; If we didn't get the itemlevel...
      {
         Portal := "Portal Scroll"
         If Portal = %name%
         return true
         Else
         return false
      }
   }
return false
}

;-------TEST FUNCTIONS-----------------TEST FUNCTIONS-----------------TEST FUNCTIONS-----------------

;-------HOTKEYS-----------------HOTKEYS-----------------HOTKEYS-----------------HOTKEYS--------------


showgui2:
   Gui, 2:Show,,Dynamic Hotkeys
Return

GuiLabel:
 If %A_GuiControl% in +,^,!,+^,+!,^!,+^!    ;If the hotkey contains only modifiers, return to wait for a key.
  return
 If InStr(%A_GuiControl%,"vk07")            ;vk07 = MenuMaskKey (see below)
  GuiControl,,%A_GuiControl%, % lastHK      ;Reshow the hotkey, because MenuMaskKey clears it.
 Else
  validateHK(A_GuiControl)
return

validateHK(GuiControl) {
 global lastHK
 Gui, 2:Submit, NoHide
 lastHK := %GuiControl%                     ;Backup the hotkey, in case it needs to be reshown.
 num := SubStr(GuiControl,3)                ;Get the index number of the hotkey control.
 If (HK%num% != "") {                       ;If the hotkey is not blank...
  StringReplace, HK%num%, HK%num%, SC15D, AppsKey      ;Use friendlier names,
  StringReplace, HK%num%, HK%num%, SC154, PrintScreen  ;  instead of these scan codes.
  If CB%num%                                ;  If the 'Win' box is checked, then add its modifier (#).
   HK%num% := "#" HK%num%
  If !RegExMatch(HK%num%,"[#!\^\+]")        ;  If the new hotkey has no modifiers, add the (~) modifier.
   HK%num% := "~" HK%num%                   ;    This prevents any key from being blocked.
  checkDuplicateHK(num)
 }
 If (savedHK%num% || HK%num%)               ;Unless both are empty,
  setHK(num, savedHK%num%, HK%num%)         ;  update INI/GUI
}

checkDuplicateHK(num) {
 global #ctrls
 Loop,% #ctrls
  If (HK%num% = savedHK%A_Index%) {
   dup := A_Index
   Loop,6 {
    GuiControl,% "Disable" b:=!b, HK%dup%   ;Flash the original hotkey to alert the user.
    Sleep,200
   }
   GuiControl,,HK%num%,% HK%num% :=""       ;Delete the hotkey and clear the control.
   break
  }
}

setHK(num,INI,GUI) {
 If INI                           ;If previous hotkey exists,
  Hotkey, %INI%, Label%num%, Off  ;  disable it.
 If GUI                           ;If new hotkey exists,
  Hotkey, %GUI%, Label%num%, On   ;  enable it.
 IniWrite,% GUI ? GUI:null, Config.ini, Hotkeys, %num%
 savedHK%num%  := HK%num%
 if (trayNotifications)
 TrayTip, Label%num%,% !INI ? GUI " ON":!GUI ? INI " OFF":GUI " ON`n" INI " OFF"
}

#MenuMaskKey vk07                 ;Requires AHK_L 38+
#If ctrl := HotkeyCtrlHasFocus()
 *AppsKey::                       ;Add support for these special keys,
 *BackSpace::                     ;  which the hotkey control does not normally allow.
 *Delete::
 *Enter::
 *Escape::
 *Pause::
 *PrintScreen::
 *Space::
 *Tab::
  modifier := ""
  If GetKeyState("Shift","P")
   modifier .= "+"
  If GetKeyState("Ctrl","P")
   modifier .= "^"
  If GetKeyState("Alt","P")
   modifier .= "!"
  Gui, Submit, NoHide             ;If BackSpace is the first key press, Gui has never been submitted.
  If (A_ThisHotkey == "*BackSpace" && %ctrl% && !modifier)   ;If the control has text but no modifiers held,
   GuiControl,,%ctrl%                                       ;  allow BackSpace to clear that text.
  Else                                                     ;Otherwise,
   GuiControl,,%ctrl%, % modifier SubStr(A_ThisHotkey,2)  ;  show the hotkey.
  validateHK(ctrl)
 return
#If

HotkeyCtrlHasFocus() {
 GuiControlGet, ctrl, Focus       ;ClassNN
 If InStr(ctrl,"hotkey") {
  GuiControlGet, ctrl, FocusV     ;Associated variable
  Return, ctrl
 }
}

;These labels may contain any commands for their respective hotkeys to perform.
Label1:
	desync:=1
return

Label2:
	remaining:=1
return

Label3:
	DPSCalc()
return

Label4:
	Webgrab()
return

Label5:
	QuitToLoginScreen(WinActive("A"))
return

Label6:
	UsePortal()
return

Label7:
	tradechat:=1
return

Label8:
	WinGet, window, ID, A   ; Use the ID of the active window.
	Toggle_Window(window)
return

;-------HOTKEYS-----------------HOTKEYS-----------------HOTKEYS-----------------HOTKEYS--------------

;-------GUI UPDATE FUNCTIONS--------------GUI UPDATE FUNCTIONS--------------GUI UPDATE FUNCTIONS-----

GuiUpdate:
   Gui, Submit, NoHide
   GuiControl, , minLifePercentToQuitUpdate, %minLifePercentToQuit%
   GuiControl, , minESPercentToQuitUpdate, %minESPercentToQuit%
   GuiControl, , minLifePercentToJadeUpdate, %minLifePercentToJade%
   GuiControl, , minESPercentToJadeUpdate, %minESPercentToJade%
   GuiControl, , minLifePercentToElementalResistUpdate, %minLifePercentToElementalResist%
   GuiControl, , minESPercentToElementalResistUpdate, %minESPercentToElementalResist%
   GuiControl, , minLifePercentToDrinkUpdate, %minLifePercentToDrink%
   GuiControl, , minManaPercentToDrinkUpdate, %minManaPercentToDrink%
   GuiControl, , minManaToDrinkPotUpdate, %minManaToDrinkPot%
   GuiControl, , InstantFlaskDelayUpdate,  % Round(InstantFlaskDelay/100,2)
   GuiControl, , minLifePercentToSpamUpdate, %minLifePercentToSpam%
   GuiControl, , QuickSilverMovementTimerUpdate, % Round(QuickSilverMovementTimer/10,1)
   GuiControl, , TradeSpamUpdate, %TradeSpam%
   GuiControl, , ResyncSpamUpdate, %ResyncSpam%

   Loop, 5
   {
		If ConfigChoice = %A_Index%
		{
			IniWrite, %minLifePercentToQuit% , Config.ini, Config%A_Index%, minLifePercentToQuit
			IniWrite, %minESPercentToQuit% , Config.ini, Config%A_Index%, minESPercentToQuit
			IniWrite, %minLifePercentToJade% , Config.ini, Config%A_Index%, minLifePercentToJade
			IniWrite, %minESPercentToJade% , Config.ini, Config%A_Index%, minESPercentToJade
			IniWrite, %minLifePercentToElementalResist% , Config.ini, Config%A_Index%, minLifePercentToElementalResist
			IniWrite, %minESPercentToElementalResist% , Config.ini, Config%A_Index%, minESPercentToElementalResist
			IniWrite, %minLifePercentToDrink% , Config.ini, Config%A_Index%, minLifePercentToDrink
			IniWrite, %minManaPercentToDrink% , Config.ini, Config%A_Index%, minManaPercentToDrink
			IniWrite, %minManaToDrinkPot% , Config.ini, Config%A_Index%, minManaToDrinkPot
			IniWrite, %minLifePercentToSpam% , Config.ini, Config%A_Index%, minLifePercentToSpam
			IniWrite, %InstantFlaskDelay% , Config.ini, Config%A_Index%, InstantFlaskDelay
			IniWrite, %QuickSilverMovementTimer% , Config.ini, Config%A_Index%, QuickSilverMovementTimer
			IniWrite, %ResyncSpam% , Config.ini, Config%A_Index%, ResyncSpam
		}
   }

   
   IniWrite, %InstantFlaskDelay% , Config.ini, Config, InstantFlaskDelay
   IFDelay:= InstantFlaskDelay

   PlayerConfig["Default"]:={QuickSilverTimer:QuickSilverMovementTimer*100,minLifeRatioToInstant: minLifePercentToSpam/100, IFlaskDelay: InstantFlaskDelay,minLifeRatioToDrink: minLifePercentToDrink/100, minManaRatioToDrink: minManaPercentToDrink/100, minManaToDrink: minManaToDrinkPot, minLifeRatioToPopElementalResist: minLifePercentToElementalResist/100, minLifeRatioToPopJade: minLifePercentToJade/100, minLifeRatioToQuit: minLifePercentToQuit/100, minNShieldRatioToQuit: minESPercentToQuit/100, minNShieldRatioToPopElementalResist: minESPercentToElementalResist/100, minNShieldRatioToPopJade: minESPercentToJade/100}


return

ExitSub:
if A_ExitReason not in Logoff,Shutdown  ; Avoid spaces around the comma in this line.
{
    IniWrite, %TabChoice%, Config.ini, Config, LastTab
}
ExitApp

TabFunc:
Gui, Submit, NoHide
return

Default:
   Gui, Submit, NoHide

    Loop, 5
    {
	   If ConfigChoice = %A_Index%
	   {
	   	  IniDelete, Config.ini, Config%A_Index%
	   }
	}
   
   Reload
   Sleep, 2000
   MsgBox,0,, An error ocurred, closing script.
ExitApp

AutoQuitList:
   Gui, Submit, NoHide
   If AutoQuitChoice = 1
   autoQuitMode:=1
   If AutoQuitChoice = 2
   autoQuitMode:=0
   If AutoQuitChoice = 3
   {
      MsgBox, This is still beta. This is only for testing.`nDont use in Harcore`nWorks Better on Bigger Resolutions`nPut the Portal Scroll on the Top-Left of your Inventory`n`nTest With [Ctrl+F4] First`n`nUse Ctrl+Alt+Del to unstuck.
      autoQuitMode:=3
   }
   If AutoQuitChoice = 4
   autoQuitMode:=4
   
   IniWrite, %AutoQuitChoice% , Config.ini, Config, AutoQuitMethod
return

ConfigList:
   Gui, Submit, NoHide


   Loop, 5
   {
		If ConfigChoice = %A_Index%
		{
			IniRead, minLifePercentToQuit , Config.ini, Config%A_Index%, minLifePercentToQuit, 35
			IniRead, minESPercentToQuit , Config.ini, Config%A_Index%, minESPercentToQuit, 0
			IniRead, minLifePercentToJade , Config.ini, Config%A_Index%, minLifePercentToJade, 70
			IniRead, minLifePercentToJade , Config.ini, Config%A_Index%, minLifePercentToJade, 70
			IniRead, minESPercentToJade , Config.ini, Config%A_Index%, minESPercentToJade, 0
			IniRead, minLifePercentToElementalResist , Config.ini, Config%A_Index%, minLifePercentToElementalResist, 70
			IniRead, minESPercentToElementalResist , Config.ini, Config%A_Index%, minESPercentToElementalResist, 0
			IniRead, minLifePercentToDrink , Config.ini, Config%A_Index%, minLifePercentToDrink, 55
			IniRead, minManaPercentToDrink , Config.ini, Config%A_Index%, minManaPercentToDrink, 25
			IniRead, minManaToDrinkPot , Config.ini, Config%A_Index%, minManaToDrinkPot, 15
			IniRead, minLifePercentToSpam, Config.ini, Config%A_Index%, minLifePercentToSpam, 35
			IniRead, ResyncSpam, Config.ini, Config%A_Index%, ResyncSpam, 0
			IniRead, InstantFlaskDelay, Config.ini, Config%A_Index%, InstantFlaskDelay, 0
			IniRead, QuickSilverMovementTimer , Config.ini, Config%A_Index%, QuickSilverMovementTimer, 15
			IniWrite, %A_Index%, Config.ini, Config, ConfigNumber
		}
	}


   GuiControl, , minLifePercentToQuit, %minLifePercentToQuit%
   GuiControl, , minLifePercentToQuitUpdate, %minLifePercentToQuit%
   GuiControl, , minESPercentToQuit, %minESPercentToQuit%
   GuiControl, , minESPercentToQuitUpdate, %minESPercentToQuit%
   GuiControl, , minLifePercentToJade, %minLifePercentToJade%
   GuiControl, , minLifePercentToJadeUpdate, %minLifePercentToJade%
   GuiControl, , minESPercentToJade, %minESPercentToJade%
   GuiControl, , minESPercentToJadeUpdate, %minESPercentToJade%
   GuiControl, , minLifePercentToElementalResist, %minLifePercentToElementalResist%
   GuiControl, , minLifePercentToElementalResistUpdate, %minLifePercentToElementalResist%
   GuiControl, , minESPercentToElementalResist, %minESPercentToElementalResist%
   GuiControl, , minESPercentToElementalResistUpdate, %minESPercentToElementalResist%
   GuiControl, , minLifePercentToDrink, %minLifePercentToDrink%
   GuiControl, , minLifePercentToDrinkUpdate, %minLifePercentToDrink%
   GuiControl, , minManaPercentToDrink, %minManaPercentToDrink%
   GuiControl, , minManaPercentToDrinkUpdate, %minManaPercentToDrink%
   GuiControl, , minManaToDrinkPot, %minManaToDrinkPot%
   GuiControl, , minManaToDrinkPotUpdate, %minManaToDrinkPot%
   GuiControl, , minLifePercentToSpam, %minLifePercentToSpam%
   GuiControl, , minLifePercentToSpamUpdate, %minLifePercentToSpam%
   GuiControl, , ResyncSpam, %ResyncSpam%
   GuiControl, , ResyncSpamUpdate, %ResyncSpam%
   GuiControl, , InstantFlaskDelay, %InstantFlaskDelay%
   GuiControl, , InstantFlaskDelayUpdate,  % Round(InstantFlaskDelay/100,2)
   GuiControl, , QuickSilverMovementTimer, %QuickSilverMovementTimer%
   GuiControl, , QuickSilverMovementTimerUpdate, % Round(QuickSilverMovementTimer/10,1)

   PlayerConfig["Default"]:={QuickSilverTimer:QuickSilverMovementTimer*100,minLifeRatioToInstant: minLifePercentToSpam/100, IFlaskDelay: InstantFlaskDelay,minLifeRatioToDrink: minLifePercentToDrink/100, minManaRatioToDrink: minManaPercentToDrink/100, minManaToDrink: minManaToDrinkPot, minLifeRatioToPopElementalResist: minLifePercentToElementalResist/100, minLifeRatioToPopJade: minLifePercentToJade/100, minLifeRatioToQuit: minLifePercentToQuit/100, minNShieldRatioToQuit: minESPercentToQuit/100, minNShieldRatioToPopElementalResist: minESPercentToElementalResist/100, minNShieldRatioToPopJade: minESPercentToJade/100}
   
return

TrayNotificationsCheck:
   Gui, Submit, NoHide
   If TrayCheckBox = 0
   {
      TrayNotificationsCheck = 0
      trayNotifications:=true
   }
   If TrayCheckBox = 1
   {
      TrayNotificationsCheck = 1
      trayNotifications:=false
   }
   IniWrite, %TrayNotificationsCheck% , Config.ini, Config, TrayNotificationsCheck
return   

QuickSilverCheck:
   Gui, Submit, NoHide
   If QuickSilverCheckBox = 0
   {
      QuickSilverCheck = 0
      IniWrite, 0 , Config.ini, Config, QuickSilverCheck
   }
   If QuickSilverCheckBox = 1
   {
      QuickSilverCheck = 1
      IniWrite, 1 , Config.ini, Config, QuickSilverCheck
   }
   IniWrite, %QuickSilverCheck% , Config.ini, Config, QuickSilverCheck
return 

QuickSilverCheck2:
   Gui, Submit, NoHide
   If QuickSilverCheckBox2 = 0
   {
      QuickSilverCheck2 = 0
      IniWrite, 0 , Config.ini, Config, QuickSilverCheck2
   }
   If QuickSilverCheckBox2 = 1
   {
      QuickSilverCheck2 = 1
      IniWrite, 1 , Config.ini, Config, QuickSilverCheck2
   }
   IniWrite, %QuickSilverCheck2% , Config.ini, Config, QuickSilverCheck2
return 

AutoShiftCheck:
   Gui, Submit, NoHide
   If AutoShiftCheckBox = 0
   {
      AutoShiftCheck = 0
      IniWrite, 0 , Config.ini, Config, AutoShiftCheck
   }
   If AutoShiftCheckBox = 1
   {
      AutoShiftCheck = 1
      IniWrite, 1 , Config.ini, Config, AutoShiftCheck
   }
   IniWrite, %AutoShiftCheck% , Config.ini, Config, AutoShiftCheck
return


DPSCheck:
   Gui, Submit, NoHide
   If DPSCheckBox = 0
   {
      IniWrite, 0 , Config.ini, Config, DPSCheck
   }
   If DPSCheckBox = 1
   {
      IniWrite, 1 , Config.ini, Config, DPSCheck
   }
Return

showgui:
   Gui, Show, x760 y198 h525 w474,
Return

DisableSlot:
   Gui, Submit, NoHide
   Loop, 5
   {
		If DisableSlot%A_Index% = 0
		{
			IniWrite, 0 , Config.ini, DisableSlot, DisableSlot%A_Index%
		}
		else If DisableSlot%A_Index% = 1
		{
			IniWrite, 1 , Config.ini, DisableSlot, DisableSlot%A_Index%
		}
   }
return

ReadMe:
   MsgBox, ------------------------------HOTKEYS------------------------------`n`n[F1] --- Use Resync Command`n[F2] --- Use Remaining Command`n[F3] --- Over an Item for DPSCalc`n[Ctrl+F3] --- Over an Item for More info on the Internet`n[F4] --- Test Exit to Log In Screen`n[Ctrl+F4] -- Test Use Portal`n[F10] -- Send Last Chat Message to Trade Channels 1-10`n[Alt + W] - Change Window to Bordeless, and locks mouse on window.`n`n------------------------------CREDITS------------------------------`n`n Base Script Created by Wrongusername.`n`n GUI and Improvements by Gurud.`n`n DPSCalc By Nipper`n`n----------------------------MORE INFO----------------------------`n`nFor more Info and Updates Go to:`n`n http://www.ownedcore.com/forums`n/mmo/path-of-exile/poe-bots-programs`n/451206-poe-autoflask-autoscript-improvements-updates.html`n`nThe link has been coppied to the clipboard.
   clipboard = http://www.ownedcore.com/forums/mmo/path-of-exile/poe-bots-programs/451206-poe-autoflask-autoscript-improvements-updates.html
return

Donate:
   Run "https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=gurud.exe@gmail.com&lc=BR&item_name=MultiScript Support&currency_code=USD&bn=PP-DonationsBF:btn_donateCC_LG.gif:NonHosted"
return

GuiClose:
   Gui, Submit
   if (trayNotifications)
   {
      TrayTip, Script is Still Running in the Background, %A_Space% , 2
   }
return

;-------GUI UPDATE FUNCTIONS--------------GUI UPDATE FUNCTIONS--------------GUI UPDATE FUNCTIONS-----

;-------NOT MY FUNCTIONS--------------NOT MY FUNCTIONS--------------NOT MY FUNCTIONS-----------------
 
; DPS Calculator Script
; This script can be found here:
; https://www.pathofexile.com/forum/view-thread/594346
; If you have any questions or comments please post them there as well. If you think you can help
; improve this project. I am looking for contributors. So Pm me if you think you can help.
;
;
; If you have a issue please post what version you are using.
; Reason being is that something that might be a issue might already be fixed.
; Version: 1.2d

;DPSCalc Credits:
;Nipper4369, creator of DPSCalc
;mcpower for the base iLVL display of the script 5months ago before Immo.
;Immo for the base iLVL display of the script.(Which was taken from mcpower.)
;olop4444 for helping Nipper4369 figure out the calculations for Q20 items.
;Aeons for a rewrite and fancy tooltips.
;kongyuyu for base item level display.
;Fayted for testing the script.
 
; Creates a font for later use
CreateFont()
{
   global FontSize
   Options :=
   If (!(FontSize = ""))
   {
      Options = s%FontSize%
   }
   Gui Font, %Options%, Courier New
   Gui Font, %Options%, Consolas
   Gui Add, Text, HwndHidden, 
   SendMessage, 0x31,,,, ahk_id %Hidden%
   return ErrorLevel
}
 
; Sets the font for a created ahk tooltip
SetFont(Font)
{
   SendMessage, 0x30, Font, 1,, ahk_class tooltips_class32 ahk_exe autohotkey.exe
}
 
; Parse elemental damage
ParseDamage(String, DmgType, ByRef DmgLo, ByRef DmgHi)
{
   IfInString, String, %DmgType% Damage
   {
      IfInString, String, Converted to or IfInString, String, taken as
       Return
      IfNotInString, String, increased
      {
         StringSplit, Arr, String, %A_Space%
         StringSplit, Arr, Arr2, -
         DmgLo := Arr1
         DmgHi := Arr2
      }
   }
}

; Parse clipboard content for item level and dps
DPSCalc()
{
   Global DPS
   If DPS
   return
   IfWinActive Path of Exile ahk_class Direct3DWindowClass
   {
      SendMode Input
      clipboard =  ; Start off empty to allow ClipWait to detect when the text has arrived.
      ErrorLevel = 0
      Send ^c
      ClipWait, 0.05  ; Wait for the clipboard to contain text.
      If ErrorLevel = 1
      {
         return
      }
      NameIsDone := False
      ItemName := 
      ItemLevel := -1
      IsWeapon := False
      PhysLo := 0
      PhysHi := 0
      Quality := 0
      AttackSpeed := 0
      PhysMult := 0
      ChaoLo := 0
      ChaoHi := 0
      ColdLo := 0
      ColdHi := 0
      FireLo := 0
      FireHi := 0
      LighLo := 0
      LighHi := 0
 
      Loop, Parse, Clipboard, `n, `r
      {
         ; Clipboard must have "Rarity:" in the first line
         If A_Index = 1
         {
            IfNotInString, A_LoopField, Rarity:
            {
               Exit
            }
            Else
            {
               Continue
            }
         }
    
         ; Get name
         If Not NameIsDone
         {
            If A_LoopField = --------
            {
               NameIsDone := True
            }
            Else
            {
               ItemName := ItemName . A_LoopField . "`n" ; Add a line of name
            }
            Continue
         }
    
         ; Get item level
         IfInString, A_LoopField, Itemlevel:
         {
            StringSplit, ItemLevelArray, A_LoopField, %A_Space%
            ItemLevel := ItemLevelArray2
            Continue
         }
    
         ; Get quality
         IfInString, A_LoopField, Quality:
         {
            StringSplit, Arr, A_LoopField, %A_Space%, +`%
            Quality := Arr2
            Continue
         }
    
         ; Get total physical damage
         IfInString, A_LoopField, Physical Damage:
         {
            IsWeapon = True
            StringSplit, Arr, A_LoopField, %A_Space%
            StringSplit, Arr, Arr3, -
            PhysLo := Arr1
            PhysHi := Arr2
            Continue
         }
         ;Fix for Elemental damage only weapons. Like the Oro's Sacrifice
         IfInString, A_LoopField, Elemental Damage:
         {
            IsWeapon = True
            Continue
         }
    
         ; These only make sense for weapons
         If IsWeapon 
         {
            ; Get attack speed
            IfInString, A_LoopField, Attacks per Second:
            {
               StringSplit, Arr, A_LoopField, %A_Space%
               AttackSpeed := Arr4
               Continue
            }
    
            ; Get percentage physical damage increase
            IfInString, A_LoopField, increased Physical Damage
            {
               StringSplit, Arr, A_LoopField, %A_Space%, `%
               PhysMult := Arr1
               Continue
            }
         
         ;Lines to skip fix for converted type damage. Like the Voltaxic Rift
         IfInString, A_LoopField, Converted to
          Goto, SkipDamageParse
         IfInString, A_LoopField, can Shock
          Goto, SkipDamageParse
         
            ; Parse elemental damage
            ParseDamage(A_LoopField, "Chaos", ChaoLo, ChaoHi)
            ParseDamage(A_LoopField, "Cold", ColdLo, ColdHi)
            ParseDamage(A_LoopField, "Fire", FireLo, FireHi)
            ParseDamage(A_LoopField, "Lightning", LighLo, LighHi)
            
           SkipDamageParse:
         }
      }
      If ItemLevel = -1 ; Something without an itemlevel
      {  
         Exit
      }
      ; Get position of mouse cursor
      global X
      global Y
      MouseGetPos, X, Y
    
      ; All items should show name and item level
      ; Pad to 3 places
      ItemLevel := "   " + ItemLevel
      StringRight, ItemLevel, ItemLevel, 3
      TT = %ItemName%Item lvl:  %ItemLevel%
    
      ; DPS calculations
      If IsWeapon {
         SetFormat, FloatFast, 5.1
    
         PhysDps := ((PhysLo + PhysHi) / 2) * AttackSpeed
         EleDps := ((ChaoLo + ChaoHi + ColdLo + ColdHi + FireLo + FireHi + LighLo + LighHi) / 2) * AttackSpeed
         TotalDps := PhysDps + EleDps
    
         TT = %TT%`nPhys DPS:  %PhysDps%`nElem DPS:  %EleDps%`nTotal DPS: %TotalDps%
    
         ; Only show Q20 values if item is not Q20
         If Quality < 20
         {
            TotalPhysMult := (PhysMult + Quality + 100) / 100
            BasePhysDps := PhysDps / TotalPhysMult
            Q20Dps := BasePhysDps * ((PhysMult + 120) / 100) + EleDps
    
            TT = %TT%`nQ20 DPS:   %Q20Dps%
         }
      }
    
           ; Replaces Clipboard with tooltip data
           StringReplace, clipboard, TT, `n, %A_SPACE% , All

      ; Show tooltip, with fixed width font
      ToolTip, %TT%, X + 35, Y + 35
      global FixedFont
      SetFont(FixedFont)
      ; Set up count variable and start timer for tooltip timeout
      global ToolTipTimeout := 0
      SetTimer, ToolTipTimer, 100
   }
}
 
; Tick every 100 ms
; Remove tooltip if mouse is moved or 5 seconds pass
ToolTipTimer:
ToolTipTimeout += 1
MouseGetPos, CurrX, CurrY
MouseMoved := (CurrX - X)**2 + (CurrY - Y)**2 > 40**2
If (MouseMoved or ToolTipTimeout >= 50)
{
   SetTimer, ToolTipTimer, Off
   ToolTip
}
return

;-------NOT MY FUNCTIONS--------------NOT MY FUNCTIONS--------------NOT MY FUNCTIONS-----------------

;-------END--------------END--------------END--------------END--------------END----------------------