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
   Gui,Add,Tab2, x0 y0 w474 h595 gTabFunc vTabChoice,AutoFlask||AutoQuit|Others|Settings|
}
else If LastTab = AutoQuit
{
   Gui,Add,Tab2, x0 y0 w474 h595 gTabFunc vTabChoice,AutoFlask|AutoQuit||Others|Settings|
}
else If LastTab = Others
{
   Gui,Add,Tab2, x0 y0 w474 h595 gTabFunc vTabChoice,AutoFlask|AutoQuit|Others||Settings|
}
else If LastTab = Settings
{
   Gui,Add,Tab2, x0 y0 w474 h595 gTabFunc vTabChoice,AutoFlask|AutoQuit|Others|Settings||
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
		IniRead, maxLifePercentPerHitToQuit , Config.ini, Config%A_Index%, maxLifePercentPerHitToQuit, 50
		IniRead, maxESPercentPerHitToQuit , Config.ini, Config%A_Index%, maxESPercentPerHitToQuit, 0
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
      IniRead, RemainingSpam, Config.ini, Config%A_Index%, RemainingSpam, 0
		IniRead, InstantFlaskDelay, Config.ini, Config%A_Index%, InstantFlaskDelay, 0
		IniRead, QuickSilverMovementTimer , Config.ini, Config%A_Index%, QuickSilverMovementTimer, 15
		IniRead, RemoveAilmentsTimer , Config.ini, Config%A_Index%, RemoveAilmentsTimer, 10
      IniRead, RemoveCorruptedBloodCharges , Config.ini, Config%A_Index%, RemoveCorruptedBloodCharges, 10
	}	
}

IniRead, QuickSilverCheck , Config.ini, Config, QuickSilverCheck, 0

IniRead, QuickSilverCheck2 , Config.ini, Config, QuickSilverCheck2, 0

IniRead, FlaskOnFrozenCheck , Config.ini, Config, FlaskOnFrozenCheck, 0

IniRead, FlaskOnShockedCheck , Config.ini, Config, FlaskOnShockedCheck, 0

IniRead, FlaskOnIgnitedCheck , Config.ini, Config, FlaskOnIgnitedCheck, 0

IniRead, AttackInPlaceCheck , Config.ini, Config, AttackInPlaceCheck, 0

IniRead, FlaskOnCurseCheck , Config.ini, Config, FlaskOnCurseCheck, 0

IniRead, FlaskOnCorruptedBloodCheck , Config.ini, Config, FlaskOnCorruptedBloodCheck, 0

Gui, Tab, AutoFlask

Gui, Add, GroupBox, x12 y250 w220 h60 , Min Life `% to Use Jade/Granite Flask
Gui, Add, Slider, x22 y270 w170 h30 gGuiUpdate vminLifePercentToJade +ToolTip TickInterval25, %minLifePercentToJade%
Gui, Add, Text, x192 y270 w20 h30 vminLifePercentToJadeUpdate , %minLifePercentToJade%
Gui, Add, Text, x212 y270 w10 h30 vminLifePercentToJadeUpdatePercent, `%

Gui, Add, GroupBox, x242 y250 w220 h60 , Min E.Shield `% to Use Jade/Granite Flask
Gui, Add, Slider, x252 y270 w170 h30 gGuiUpdate vminESPercentToJade +ToolTip TickInterval25, %minESPercentToJade%
Gui, Add, Text, x422 y270 w20 h30 vminESPercentToJadeUpdate, %minESPercentToJade%
Gui, Add, Text, x442 y270 w10 h30 vminESPercentToJadeUpdatePercent, `%

Gui, Add, GroupBox, x12 y320 w220 h60 , Min Life `% to Use Elemental Resist Flask
Gui, Add, Slider, x22 y340 w170 h30 gGuiUpdate vminLifePercentToElementalResist +ToolTip TickInterval25, %minLifePercentToElementalResist%
Gui, Add, Text, x192 y340 w20 h30 vminLifePercentToElementalResistUpdate, %minLifePercentToElementalResist%
Gui, Add, Text, x212 y340 w10 h30 vminLifePercentToElementalResistUpdatePercent, `%

Gui, Add, GroupBox, x242 y320 w220 h60 , Min E.Shield `% to Use Element. Resist Flask
Gui, Add, Slider, x252 y340 w170 h30 gGuiUpdate vminESPercentToElementalResist +ToolTip TickInterval25, %minESPercentToElementalResist%
Gui, Add, Text, x422 y340 w20 h30 vminESPercentToElementalResistUpdate, %minESPercentToElementalResist%
Gui, Add, Text, x442 y340 w10 h30 vminESPercentToElementalResistUpdatePercent, `%

Gui, Add, GroupBox, x12 y40 w220 h60 , Min Life `% to Drink Health Potion
Gui, Add, Slider, x22 y60 w170 h30 gGuiUpdate vminLifePercentToDrink +ToolTip TickInterval25, %minLifePercentToDrink%
Gui, Add, Text, x192 y60 w20 h30 vminLifePercentToDrinkUpdate, %minLifePercentToDrink%
Gui, Add, Text, x212 y60 w10 h30 vminLifePercentToDrinkUpdatePercent, `%

Gui, Add, GroupBox, x242 y40 w220 h60 , Min Mana `% to Drink Mana Potion
Gui, Add, Slider, x252 y60 w170 h30 gGuiUpdate vminManaPercentToDrink +ToolTip TickInterval25, %minManaPercentToDrink%
Gui, Add, Text, x422 y60 w20 h30 vminManaPercentToDrinkUpdate, %minManaPercentToDrink%
Gui, Add, Text, x442 y60 w10 h30 vminManaPercentToDrinkUpdatePercent, `%

Gui, Add, GroupBox, x12 y180 w220 h60 , Min Life `% to Spam Instant Flasks
Gui, Add, Slider, x22 y200 w170 h30 gGuiUpdate vminLifePercentToSpam +ToolTip TickInterval25, %minLifePercentToSpam%
Gui, Add, Text, x192 y200 w20 h30 vminLifePercentToSpamUpdate, %minLifePercentToSpam%
Gui, Add, Text, x212 y200 w10 h30 vminLifePercentToSpamUpdatePercent, `%

Gui, Add, GroupBox, x242 y110 w220 h60 , Min Mana to Drink Mana Potion
Gui, Add, Slider, x252 y130 w170 h30 Range0-300 gGuiUpdate vminManaToDrinkPot +ToolTip TickInterval50, %minManaToDrinkPot%
Gui, Add, Text, x422 y130 w30 h30 vminManaToDrinkPotUpdate, %minManaToDrinkPot%

Gui, Add, GroupBox, x242 y180 w220 h60 , Instant Flask Spam Delay  ;x12 y149 w220 h60
IniRead, InstantFlaskDelay , Config.ini, Config, InstantFlaskDelay, 0
Gui, Add, Slider, x252 y200 w170 h30 Range0-50 gGuiUpdate vInstantFlaskDelay +ToolTip TickInterval50, %InstantFlaskDelay%
Gui, Add, Text, x422 y200 w25 h30 vInstantFlaskDelayUpdate, % Round(InstantFlaskDelay/100,2)
Gui, Add, Text, x447 y200 w10 h30 vInstantFlaskDelayUpdatePercent, s

Gui, Add, GroupBox, x12 y390 w220 h60 , Only QuickSilver if Moving for X Seconds
Gui, Add, Slider, x22 y410 w170 h30 Range0-100 gGuiUpdate vQuickSilverMovementTimer +ToolTip TickInterval20, %QuickSilverMovementTimer%
Gui, Add, Text, x192 y410 w22 h30 vQuickSilverMovementTimerUpdate, % Round(QuickSilverMovementTimer/10,1)
Gui, Add, Text, x214 y410 w10 h30 , s

Gui, Add, GroupBox, x12 y460 w220 h60 , Only Remove Ailments if They Are Over
Gui, Add, Slider, x22 y480 w170 h30 Range0-50 gGuiUpdate vRemoveAilmentsTimer +ToolTip TickInterval10, %RemoveAilmentsTimer%
Gui, Add, Text, x192 y480 w22 h30 vRemoveAilmentsTimerUpdate, % Round(RemoveAilmentsTimer/10,1)
Gui, Add, Text, x214 y480 w10 h30 , s

Gui, Add, GroupBox, x12 y530 w220 h60 , Only Remove Corrupted Blood If X Charges
Gui, Add, Slider, x22 y550 w170 h30 Range1-20 gGuiUpdate vRemoveCorruptedBloodCharges +ToolTip, %RemoveCorruptedBloodCharges%
Gui, Add, Text, x192 y550 w12 h30 vRemoveCorruptedBloodChargesUpdate, %RemoveCorruptedBloodCharges%
Gui, Add, Text, x210 y550 w20 h30 , ch

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
   Gui, Add, CheckBox, x242 y389 w220 h30 vQuickSilverCheckBox gQuickSilverCheck, Use QuickSilver Flask When 40+ Charges
}
If QuickSilverCheck = 1
{
   Gui, Add, CheckBox, x242 y389 w220 h30  vQuickSilverCheckBox gQuickSilverCheck Checked, Use QuickSilver Flask When 40+ Charges
}

If QuickSilverCheck2 = 0
{
   Gui, Add, CheckBox, x242 y418 w220 h30 vQuickSilverCheckBox2 gQuickSilverCheck2, Use QuickSilver Flask When 20+ Charges
}
If QuickSilverCheck2 = 1
{
   Gui, Add, CheckBox, x242 y418 w220 h30  vQuickSilverCheckBox2 gQuickSilverCheck2 Checked, Use QuickSilver Flask When 20+ Charges
}

If FlaskOnFrozenCheck = 0
{
   Gui, Add, CheckBox, x242 y447 w220 h30 vFlaskOnFrozenCheckBox gFlaskOnFrozenCheck, Use Flask to Remove Frozen Ailment
}
If FlaskOnFrozenCheck = 1
{
   Gui, Add, CheckBox, x242 y447 w220 h30  vFlaskOnFrozenCheckBox gFlaskOnFrozenCheck Checked, Use Flask to Remove Frozen Ailment
}

If FlaskOnShockedCheck = 0
{
   Gui, Add, CheckBox, x242 y475 w220 h30 vFlaskOnShockedCheckBox gFlaskOnShockedCheck, Use Flask to Remove Shocked Ailment
}
If FlaskOnShockedCheck = 1
{
   Gui, Add, CheckBox, x242 y475 w220 h30  vFlaskOnShockedCheckBox gFlaskOnShockedCheck Checked, Use Flask to Remove Shocked Ailment
}

If FlaskOnIgnitedCheck = 0
{
   Gui, Add, CheckBox, x242 y503 w220 h30 vFlaskOnIgnitedCheckBox gFlaskOnIgnitedCheck, Use Flask to Remove Burning Ailment
}
If FlaskOnIgnitedCheck = 1
{
   Gui, Add, CheckBox, x242 y503 w220 h30  vFlaskOnIgnitedCheckBox gFlaskOnIgnitedCheck Checked, Use Flask to Remove Burning Ailment
}

If FlaskOnCurseCheck = 0
{
   Gui, Add, CheckBox, x242 y531 w220 h30 vFlaskOnCurseCheckBox gFlaskOnCurseCheck, Use Flask to Remove Curses
}
If FlaskOnCurseCheck = 1
{
   Gui, Add, CheckBox, x242 y531 w220 h30  vFlaskOnCurseCheckBox gFlaskOnCurseCheck Checked, Use Flask to Remove Curses
}

If FlaskOnCorruptedBloodCheck = 0
{
   Gui, Add, CheckBox, x242 y558 w220 h30 vFlaskOnCorruptedBloodCheckBox gFlaskOnCorruptedBloodCheck, Use Flask to Remove Corrupted Blood
}
If FlaskOnCorruptedBloodCheck = 1
{
   Gui, Add, CheckBox, x242 y558 w220 h30  vFlaskOnCorruptedBloodCheckBox gFlaskOnCorruptedBloodCheck Checked, Use Flask to Remove Corrupted Blood
}


Gui, Tab, AutoQuit

Gui, Add, GroupBox, x12 y180 w220 h60, Auto Quit Method
IniRead, AutoQuitMethod , Config.ini, Config, AutoQuitMethod, 1
If AutoQuitMethod = 1
{
   Gui, Add, DropDownList, x22 y200 w200 h21 AltSubmit gAutoQuitList vAutoQuitChoice R5, Exit to Login Screen||Alt+F4 (Fastest according to Chris)|Use a Portal (On Testing)|Disabled
   autoQuitMode:=1
}
else If AutoQuitMethod = 2
{
   Gui, Add, DropDownList, x22 y200 w200 h21 AltSubmit gAutoQuitList vAutoQuitChoice R5, Exit to Login Screen|Alt+F4 (Fastest according to Chris)||Use a Portal (On Testing)|Disabled
   autoQuitMode:=0
}
else If AutoQuitMethod = 3
{
   Gui, Add, DropDownList, x22 y200 w200 h21 AltSubmit gAutoQuitList vAutoQuitChoice R5, Exit to Login Screen|Alt+F4 (Fastest according to Chris)|Use a Portal (On Testing)||Disabled
   autoQuitMode:=3
}
else If AutoQuitMethod = 4
{
   Gui, Add, DropDownList, x22 y200 w200 h21 AltSubmit gAutoQuitList vAutoQuitChoice R5, Exit to Login Screen|Alt+F4 (Fastest according to Chris)|Use a Portal (On Testing)|Disabled||
   autoQuitMode:=4
}

Gui, Add, GroupBox, x12 y40 w220 h60 , Min Life `% to Quit
Gui, Add, Slider, x22 y60 w170 h30 gGuiUpdate vminLifePercentToQuit +ToolTip TickInterval25, %minLifePercentToQuit%
Gui, Add, Text, x192 y60 w20 h30 vminLifePercentToQuitUpdate, %minLifePercentToQuit%
Gui, Add, Text, x212 y60 w10 h30 vminLifePercentToQuitUpdatePercent, `%

Gui, Add, GroupBox, x242 y40 w220 h60 , Min Energy Shield `% to Quit
Gui, Add, Slider, x252 y60 w170 h30 gGuiUpdate vminESPercentToQuit +ToolTip TickInterval25, %minESPercentToQuit%
Gui, Add, Text, x422 y60 w20 h30 vminESPercentToQuitUpdate, %minESPercentToQuit%
Gui, Add, Text, x442 y60 w10 h30 vminESPercentToQuitUpdatePercent, `%

Gui, Add, GroupBox, x12 y110 w220 h60 , Max Life `% Per Hit to Quit
Gui, Add, Slider, x22 y130 w170 h30 gGuiUpdate vmaxLifePercentPerHitToQuit +ToolTip TickInterval25, %maxLifePercentPerHitToQuit%
Gui, Add, Text, x192 y130 w20 h30 vmaxLifePercentPerHitToQuitUpdate, %maxLifePercentPerHitToQuit%
Gui, Add, Text, x212 y130 w10 h30 vmaxLifePercentPerHitToQuitUpdatePercent, `%

Gui, Add, GroupBox, x242 y110 w220 h60 , Max Energy Shield `% Per Hit to Quit
Gui, Add, Slider, x252 y130 w170 h30 gGuiUpdate vmaxESPercentPerHitToQuit +ToolTip TickInterval25, %maxESPercentPerHitToQuit%
Gui, Add, Text, x422 y130 w20 h30 vmaxESPercentPerHitToQuitUpdate, %maxESPercentPerHitToQuit%
Gui, Add, Text, x442 y130 w10 h30 vmaxESPercentPerHitToQuitUpdatePercent, `%

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

Gui, Add, Button, x262 y120 w180 h40 gshowgui2, Configure Hotkeys

Gui, Add, Button, x262 y180 w180 h40 gDefaultHotkeys, Restore Default Hotkeys


Gui, Tab, Others

IniRead, TradeSpam, Config.ini, Config, TradeSpam, 0
Gui, Add, GroupBox, x12 y40 w220 h60 , Send Trade Message Every X Minutes*
Gui, Add, Slider, x22 y60 w170 h30 gGuiUpdate vTradeSpam +ToolTip TickInterval1 Range0-10, %TradeSpam%
Gui, Add, Text, x192 y60 w20 h30 vTradeSpamUpdate, %TradeSpam%
Gui, Add, Text, x212 y60 w10 h30 vTradeSpamUpdatePercent, m

Gui, Add, Text,  x22 y565 w400 h21, *Opening the chat will stop and reset the trade spam.

Gui, Add, GroupBox, x242 y40 w220 h60 , Send Resync Command Every X Seconds
Gui, Add, Slider, x252 y60 w170 h30 gGuiUpdate vResyncSpam +ToolTip TickInterval30 Range0-120, %ResyncSpam%
Gui, Add, Text, x422 y60 w20 h30 vResyncSpamUpdate, %ResyncSpam%
Gui, Add, Text, x442 y60 w10 h30 vResyncSpamUpdatePercent, s

Gui, Add, GroupBox, x242 y110 w220 h60 , Send Remaining Command Every X Secs
Gui, Add, Slider, x252 y130 w170 h30 gGuiUpdate vRemainingSpam +ToolTip TickInterval30 Range0-120, %RemainingSpam%
Gui, Add, Text, x422 y130 w20 h30 vRemainingSpamUpdate, %RemainingSpam%
Gui, Add, Text, x442 y130 w10 h30 vRemainingSpamUpdatePercent, s

If AttackInPlaceCheck = 0
{
   Gui, Add, CheckBox, x22 y110 w170 h30 vAttackInPlaceCheckBox gAttackInPlaceCheck, Auto Hold In Place When Attacking
}
If AttackInPlaceCheck = 1
{
   Gui, Add, CheckBox, x22 y110 w170 h30  vAttackInPlaceCheckBox gAttackInPlaceCheck Checked, Auto Hold In Place When Attacking
}


Gui, Tab

Gui, Add, Button, x22 y609 w130 h40 gDefault, Reset Profile
Gui, Add, Button, x182 y609 w120 h40 gReadMe, ReadMe
Gui, Add, Button, x332 y609 w120 h40 gDonate, Donate

Gui, Add, Text, x380 y1 w110 h18 vguicontroled, Created by Gurud.

Gui, Add, GroupBox, x0 y590 w472 h74 ,
Gui, Add, GroupBox, x1 y591 w470 h72 ,
Gui, Add, GroupBox, x2 y592 w468 h70 ,
Gui, Add, GroupBox, x3 y593 w466 h68 ,
Gui, Add, GroupBox, x4 y594 w464 h66 ,

Gui, Add, GroupBox, x0 y21 w472 h575 ,
Gui, Add, GroupBox, x1 y22 w470 h574 ,
Gui, Add, GroupBox, x2 y23 w468 h573 ,
Gui, Add, GroupBox, x3 y24 w466 h572 ,
Gui, Add, GroupBox, x4 y25 w464 h571 ,

Menu, Tray, Add, Configuration Window, showgui

If (minLifePercentToQuit=0)
{
   GuiControl, , minLifePercentToQuitUpdate, N/A
   GuiControl, , minLifePercentToQuitUpdatePercent,
}
If (minESPercentToQuit=0)
{
   GuiControl, , minESPercentToQuitUpdate, N/A
   GuiControl, , minESPercentToQuitUpdatePercent, 
}
If (maxLifePercentPerHitToQuit=0 || maxLifePercentPerHitToQuit=100)
{
   GuiControl, , maxLifePercentPerHitToQuitUpdate, N/A
   GuiControl, , maxLifePercentPerHitToQuitUpdatePercent, 
}
If (maxESPercentPerHitToQuit=0)
{
   GuiControl, , maxESPercentPerHitToQuitUpdate, N/A
   GuiControl, , maxESPercentPerHitToQuitUpdatePercent,
}
If (minLifePercentToJade=0)
{
   GuiControl, , minLifePercentToJadeUpdate, N/A
   GuiControl, , minLifePercentToJadeUpdatePercent, 
}
If (minESPercentToJade=0)
{
   GuiControl, , minESPercentToJadeUpdate, N/A
   GuiControl, , minESPercentToJadeUpdatePercent, 
}
If (minLifePercentToElementalResist=0)
{
   GuiControl, , minLifePercentToElementalResistUpdate, N/A
   GuiControl, , minLifePercentToElementalResistUpdatePercent, 
}
If (minESPercentToElementalResist=0)
{
   GuiControl, , minESPercentToElementalResistUpdate, N/A
   GuiControl, , minESPercentToElementalResistUpdatePercent, 
}
If (minLifePercentToDrink=0)
{
   GuiControl, , minLifePercentToDrinkUpdate, N/A
   GuiControl, , minLifePercentToDrinkUpdatePercent, 
}
If (minManaPercentToDrink=0)
{
   GuiControl, , minManaPercentToDrinkUpdate, N/A
   GuiControl, , minManaPercentToDrinkUpdatePercent, 
}
If (minManaToDrinkPot=0)
{
   GuiControl, , minManaToDrinkPotUpdate, N/A
}
If (InstantFlaskDelay=0)
{
   GuiControl, , InstantFlaskDelayUpdate, N/A
   GuiControl, , InstantFlaskDelayUpdatePercent, 
}
If (minLifePercentToSpam=0)
{
   GuiControl, , minLifePercentToSpamUpdate, N/A
   GuiControl, , minLifePercentToSpamUpdatePercent, 
}
If (TradeSpam=0)
{
   GuiControl, , TradeSpamUpdate, N/A
   GuiControl, , TradeSpamUpdatePercent, 
}
If (ResyncSpam=0)
{
   GuiControl, , ResyncSpamUpdate, N/A
   GuiControl, , ResyncSpamUpdatePercent, 
}
If (RemainingSpam=0)
{
   GuiControl, , RemainingSpamUpdate, N/A
   GuiControl, , RemainingSpamUpdatePercent, 
}

Gui, Submit

Gui, Show, x760 y198 h665 w474, PoE MultiScript v09.19.2014

;---------------------START DYNAMIC HOTKEYS---------------------

;"Wild Mode allows hotkeys to trigger when other modifiers are also held.`nFor example, if you bound Ctrl+C to an action...`nWild Mode ON: Ctrl+Alt+C, Ctrl+Shift+C etc would still trigger the action`nWild Mode OFF: Ctrl+Alt+C etc would not trigger the action."

; Build list of "End Keys" for Input command
EXTRA_KEY_LIST := "{Escape}"  ; DO NOT REMOVE! - Used to quit binding
; Standard non-printables
EXTRA_KEY_LIST .= "{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{Left}{Right}{Up}{Down}"
EXTRA_KEY_LIST .= "{Home}{End}{PgUp}{PgDn}{Del}{Ins}{BackSpace}{Pause}"
; Numpad - Numlock ON
EXTRA_KEY_LIST .= "{Numpad0}{Numpad1}{Numpad2}{Numpad3}{Numpad4}{Numpad5}{Numpad6}{Numpad7}{Numpad8}{Numpad9}{NumpadDot}{NumpadMult}{NumpadAdd}{NumpadSub}"
; Numpad - Numlock OFF
EXTRA_KEY_LIST .= "{NumpadIns}{NumpadEnd}{NumpadDown}{NumpadPgDn}{NumpadLeft}{NumpadClear}{NumpadRight}{NumpadHome}{NumpadUp}{NumpadPgUp}{NumpadDel}"
; Numpad - Common
EXTRA_KEY_LIST .= "{NumpadMult}{NumpadAdd}{NumpadSub}{NumpadDiv}{NumpadEnter}"
; Stuff we may or may not want to trap
;EXTRA_KEY_LIST .= "{Numlock}"
EXTRA_KEY_LIST .= "{Capslock}"
;EXTRA_KEY_LIST .= "{PrintScreen}"
; Browser keys
EXTRA_KEY_LIST .= "{Browser_Back}{Browser_Forward}{Browser_Refresh}{Browser_Stop}{Browser_Search}{Browser_Favorites}{Browser_Home}"
; Media keys
EXTRA_KEY_LIST .= "{Volume_Mute}{Volume_Down}{Volume_Up}{Media_Next}{Media_Prev}{Media_Stop}{Media_Play_Pause}"
; App Keys
EXTRA_KEY_LIST .= "{Launch_Mail}{Launch_Media}{Launch_App1}{Launch_App2}"

; BindMode vars
HKModifierState := {}   ; The state of the modifiers at the end of the last detection sequence
HKControlType := 0      ; The kind of control that the last hotkey was. 0 = regular key, 1 = solitary modifier, 2 = mouse, 3 = joystick
HKSecondaryInput := ""  ; Set to button pressed if the last detected bind was a Mouse button, Joystick button or Solitary Modifier
HKLastHotkey := 0       ; Time that Escape was pressed to exit key binding. Used to determine if Escape is held (Clear binding)

DefaultHKObject := {hk: "", type: "", wild: ""}

; Misc vars
ININame := "Config.ini"
HotkeyList := []
NumHotkeys := 9

; Create the GUI
Gui 2:Add, Text,, This allows you to change Hotkeys.`n Click the "ReadMe" button to know what the hotkeys do.
Gui, 2:Add, Text, x357 y25 w30 center, Wild`nMode

ypos := 50

;Gui, 2:Add, Text, x5 y40 w300 center,Hotkey
;Gui, 2:Add, Text, x300 y40 center,~ *

Loop % NumHotkeys 
{
   Gui, 2:Add, Edit, Disabled vHotkeyName%A_Index% w260 x5 y%ypos%, None
   Gui, 2:Add, Button, gBind vBind%A_Index% yp-1 xp+270, Set Hotkey
   Gui, 2:Add, Checkbox, vWild%A_Index% gOptionChanged xp+90 yp+5
   ;Gui, 2:Add, Checkbox, vBlock%A_Index% gOptionChanged xp+30 yp
   ypos += 25
}


; Set GUI State
LoadSettings()

; Enable defined hotkeys
EnableHotkeys()

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
   TrayTip, Admin Required, Seems that you are not running this program as Admin`, it might not work properlly., 5
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
RemainingTimer:= A_TickCount
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
LastHP:=0
LastES:=0
FlaskOnFrozen:=1
FlaskOnShocked:=1
FlaskOnIgnited:=1

autoQuitPauseBeforeClick:=100
autoQuitSoftToleranceBeforeKill:=2000 ; try to quit to loginscreen at most milliseconds before killing game window(in case we can't quit by clicking menu option for some reason)

PlayerConfig:={}

PlayerConfig["Default"]:={RemCorruptedBloodCharges:RemoveCorruptedBloodCharges,RemAilmentsTimer:RemoveAilmentsTimer,QuickSilverTimer:QuickSilverMovementTimer*100, minLifeRatioToInstant: minLifePercentToSpam/100, IFlaskDelay: InstantFlaskDelay,minLifeRatioToDrink: minLifePercentToDrink/100, minManaRatioToDrink: minManaPercentToDrink/100, minManaToDrink: minManaToDrinkPot, minLifeRatioToPopElementalResist: minLifePercentToElementalResist/100,minLifeRatioToPopJade: minLifePercentToJade/100, minLifeRatioToQuit: minLifePercentToQuit/100,maxLifeRatioPerHitToQuit: maxLifePercentPerHitToQuit/100,maxNShieldRatioPerHitToQuit: maxESPercentPerHitToQuit/100,minNShieldRatioToQuit: minESPercentToQuit/100, minNShieldRatioToPopElementalResist: minESPercentToElementalResist/100, minNShieldRatioToPopJade: minESPercentToJade/100}

PlayerConfig["Default"].FlaskConfig:=[]

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
	{
		PlayerBase:=GetMultilevelPointer(pH,[fBase+0x158,0x5A0])
	}
	else
	{
		PlayerBase:=GetMultilevelPointer(pH,[fBase+0x13C,0x5A0])
	}
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

	BuffListStart:=ReadMemUInt(pH,PlayerStatsOffset+0xB8)
	BuffListEnd:=ReadMemUInt(pH,PlayerStatsOffset+0xBC)
	BuffAmount:=((BuffListEnd-BuffListStart)/4)
	PlayerStats.BuffAmount:=((BuffListEnd-BuffListStart)/4)
	Loop, %BuffAmount%
	{
		BuffBasePtr:=GetMultilevelPointer(ph,[BuffListStart+((A_Index-1)*4),4])
		BuffNamePtr:=GetMultilevelPointer(ph,[BuffBasePtr+4,0])
		BuffNameStr:=ReadMemStr(ph,BuffNamePtr,70,"UTF-16")
		PlayerStats.BuffName[A_Index]:=BuffNameStr
		BuffCharges:=ReadMemUInt(pH,BuffBasePtr+0x1C)
		PlayerStats.BuffCharges[A_Index]:=BuffCharges
		BuffTimer:=ReadMemFloat(pH,BuffBasePtr+0xC)
		PlayerStats.BuffTimer[A_Index]:=BuffTimer
	}


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
	EntityNamePtr:=GetMultilevelPointer(ph,[CheckBase+0x184,0x978,0xC14])
	EntityName:=ReadMemStr(ph,EntityNamePtr,70,"UTF-16")
	PlayerStats.EntityName:=EntityName
	EntityNamePtr2:=GetMultilevelPointer(ph,[CheckBase+0x184,0x978,0xB94])
	EntityName2:=ReadMemStr(ph,EntityNamePtr2+0x32,70,"UTF-16")
	PlayerStats.EntityName2:=EntityName2
}

ReadFlasksData(hwnd, byRef FlasksData)
{
   GetWindowBasics(hwnd, mBase, pH)
   
   UiBase:=GetUiBase(hwnd)
   
   if (!UiBase) ;not InGame
      return
   
   FlaskInvBase:=GetMultilevelPointer(pH,[UiBase+0x968,0x984,0x20])

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
   	  PlayerPosBase:=GetMultilevelPointer(pH,[FrameBase+0x158,0x5A0,0x24])
      else 
      PlayerPosBase:=GetMultilevelPointer(pH,[FrameBase+0x13C,0x5A0,0x24])

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
         if ((FlasksData[A_Index].ChargesCurrent>currMaxCharges) && (FlasksData[A_Index].ChargesCurrent>=FlasksData[A_Index].ChargesPerUse))
         {
            currMaxI:=A_Index
            currMaxCharges:=FlasksData[A_Index].ChargesCurrent
         }
      }
   return currMaxI
}

GetMaxChargesFlaskOfMod(ByRef FlasksData,ModStr)
{
   currMaxCharges:=0
   Loop, 5
      if ((InStr(FlasksData[A_Index].mod1,ModStr)) || (InStr(FlasksData[A_Index].mod2,ModStr)))
      {
         if ((FlasksData[A_Index].ChargesCurrent>currMaxCharges) && (FlasksData[A_Index].ChargesCurrent>=FlasksData[A_Index].ChargesPerUse))
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
   global hideout
	global tradechat
	global borderless
	global ResyncTimer
	global ResyncSpam
   global RemainingTimer
   global RemainingSpam
	global tradechat
	global TradeSpam
	global TradeSpamTimer
	global TradeTimer
	global TradeChannel
	global TradeStep
	global PanickedTimer
	global QuickSilverCheck
	global QuickSilverCheck2
	global AttackInPlaceCheck
	global AttackInPlaceKeyUp
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
	global LastHP
	global LastES
	global LastMaxHP
	global LastMaxES
	global AttackInPlaceKey
	global FlaskOnFrozenCheck
	global FlaskOnShockedCheck
	global FlaskOnIgnitedCheck
	global QuicksilverBuff
   global FlaskOnCurseCheck
   global FlaskOnCorruptedBloodCheck
	global OnetimeNotification
	global stateRCTRL

	WinGet, WinID, List, %cliname%

	Loop, %WinID%
	{
      
		WinGet, ProcModuleName, ProcessName,  % "ahk_id" WinID%A_Index%

		If (ProcModuleName!="PathOfExile.exe") And (ProcModuleName!="PathOfExileSteam.exe") ; got a window with title "Path of Exile" but exe is not Client.exe, perhaps we have browser window open with PoE site, ignore it
        {
        	continue
        }

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


      	if (!IsInGame(WinID%A_Index%))
		{
			LastHP:=0
			LastES:=0
			LastMaxHP:=0
			LastMaxES:=0
			continue
		}
         
       
		if (WinID%A_Index%=WinActive("A"))
		ThisID:=WinActive("A")

		PlayerStats:={}
		ReadPlayerStats(WinID%A_Index%, PlayerStats)
		if (PlayerStats.MaxHP<1 || PlayerStats.CurrHP=0) ;dead, don't bother
		{
			continue
		}

		CurrentConfig:=PlayerConfig["Default"]

		If (A_TickCount>=20secsTimer+20000)
		{
			ConfigPath:= PlayerStats.ConfigPath
			Loop, 5
			{
				if (InStr(PlayerStats.ConfigPath,".ini"))
				{
					IniRead, HotkeyFlask%A_Index%, %ConfigPath%, ACTION_KEYS, use_flask_in_slot%A_Index%, %A_Index%
					vk:=HotkeyFlask%A_Index%
					SetFormat, IntegerFast, hex
					vk += 0
					vk .= ""
					SetFormat, IntegerFast, d
					FlaskHotkey%A_Index%={vk%vk% Down vk%vk% UP}
					If (A_Index=1)
					{
						IniRead, AttackInPlaceKey, %ConfigPath%, ACTION_KEYS, attack_in_place, %A_Index%
						vk:=AttackInPlaceKey
						SetFormat, IntegerFast, hex
						vk += 0
						vk .= ""
						SetFormat, IntegerFast, d
						AttackInPlaceKey=vk%vk%
					}
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
			LastNShieldRatio:=LastES/PlayerStats.MaxNShield
			If (LastMaxES!=PlayerStats.MaxNShield)
			{
				LastNShieldRatio:=0
			}
		}
		else 
		{
			currNShieldRatio:= 1
		}

		if (PlayerStats.MaxHP>1)
		{
			currLifeRatio:=PlayerStats.CurrHP/(PlayerStats.MaxHP-PlayerStats.ReservedHPFlat-PlayerStats.MaxHP*PlayerStats.ReservedHPPercent/100)
			LastLifeRatio:=LastHP/(PlayerStats.MaxHP-PlayerStats.ReservedHPFlat-PlayerStats.MaxHP*PlayerStats.ReservedHPPercent/100)	
			If (LastMaxHP!=PlayerStats.MaxHP)
			{
				LastLifeRatio:=0
			}
		}
		else
		{
			currLifeRatio:=1
         LastLifeRatio:=0
		}
      
		if (PlayerStats.MaxMana>0)
		{
			currManaRatio:=PlayerStats.CurrMana/(PlayerStats.MaxMana-PlayerStats.ReservedManaFlat-PlayerStats.MaxMana*PlayerStats.ReservedManaPercent/100)
		}
      
		if (currLifeRatio<CurrentConfig.minLifeRatioToQuit || currNShieldRatio<CurrentConfig.minNShieldRatioToQuit || (currLifeRatio<LastLifeRatio And ((LastLifeRatio-currLifeRatio)>CurrentConfig.maxLifeRatioPerHitToQuit) And (CurrentConfig.maxLifeRatioPerHitToQuit<1 And CurrentConfig.maxLifeRatioPerHitToQuit>0)) || (CurrentConfig.maxNShieldRatioPerHitToQuit>0 And currNShieldRatio<LastNShieldRatio And ((LastNShieldRatio-currNShieldRatio)>CurrentConfig.maxNShieldRatioPerHitToQuit)))
		{
			if (autoQuitMode=0)
			{
            WinActivate Path of Exile ahk_class Direct3DWindowClass
				IfWinActive Path of Exile ahk_class Direct3DWindowClass
            {
               SendInput {ALT Down}
               SendInput {F4}
               SendInput {ALT Up}
            }
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

		if (PlayerStats.CurrHP>0)
		{
			LastHP:=PlayerStats.CurrHP
			LastES:=PlayerStats.CurrNShield
			LastMaxHP:=PlayerStats.MaxHP
			LastMaxES:=PlayerStats.MaxNShield
		}
		Else
		{
			LastHP:=0
			LastES:=0
			LastMaxHP:=0
			LastMaxES:=0
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
		{
			WindowQueuedFlaskEffects[k].hpQueueEndtime:=A_TickCount
		}

		if (currLifeRatio>=1)
		{
			WindowQueuedFlaskEffects[k].InstantQueueEndtime:=A_TickCount
		}

		if (currManaRatio>=1)
		{
			WindowQueuedFlaskEffects[k].ManaQueueEndtime:=A_TickCount
		}

		If (PlayerStats.BuffAmount>100)
		{
			BuffAmount:=0
		}
		Else
		{
			BuffAmount:=PlayerStats.BuffAmount
		}

		QuicksilverBuff:=0

		RemAilmentsTimer:=Round(CurrentConfig.RemAilmentsTimer/10,1)

		loop, %BuffAmount%
		{
			BuffTimer:=PlayerStats.BuffTimer[A_Index]

			if InStr(playerstats.BuffName[A_Index], "aura")
			{
				continue
			}

			else if InStr(playerstats.BuffName[A_Index], "flask_utility_sprint")
			{
				QuicksilverBuff:=1
				If (BuffTimer<0.25)
				{
					QuicksilverBuff:=0
					BuffTimer:=0
				}
				continue
			}


			else if InStr(playerstats.BuffName[A_Index], "frozen")
			{
				if ((FlaskOnFrozenCheck) && (BuffTimer>=RemAilmentsTimer))
				{
					If ((!WindowQueuedFlaskEffects[k].HasKey("FrozenQueueEndtime")) || (A_TickCount>=(WindowQueuedFlaskEffects[k].FrozenQueueEndtime-lagCompensation)))
					{
						flaskNum:=GetMaxChargesFlaskOfMod(FlasksData,"of Heat")
						if (flaskNum!="")
						{  
							WindowQueuedFlaskEffects[k].FrozenQueueEndtime:=A_TickCount+300
							
							if (trayNotifications)
							{
								TrayTip, PoE AutoFlask Using "of Heat" flask %flaskNum%, %A_Space% , 2
							}
							hKey:=FlaskHotkey%flaskNum%
							ControlSend,,%hkey%, % "ahk_id" hwnd
						}
					}
				}
				continue
			}

			else if InStr(playerstats.BuffName[A_Index], "shocked")
			{
				if ((FlaskOnShockedCheck) && (BuffTimer>=RemAilmentsTimer))
				{
					If ((!WindowQueuedFlaskEffects[k].HasKey("ShockedQueueEndtime")) || (A_TickCount>=(WindowQueuedFlaskEffects[k].ShockedQueueEndtime-lagCompensation)))
					{
						flaskNum:=GetMaxChargesFlaskOfMod(FlasksData,"of Grounding")
						if (flaskNum!="")
						{  
							WindowQueuedFlaskEffects[k].ShockedQueueEndtime:=A_TickCount+300
							
							if (trayNotifications)
							{
								TrayTip, PoE AutoFlask Using "of Grounding" flask %flaskNum%, %A_Space% , 2
							}
							hKey:=FlaskHotkey%flaskNum%
							ControlSend,,%hkey%, % "ahk_id" hwnd
						}
					}
				}
				continue
			}

			else if InStr(playerstats.BuffName[A_Index], "ignited")
			{
				if ((FlaskOnIgnitedCheck) && (BuffTimer>=RemAilmentsTimer))
				{
					If ((!WindowQueuedFlaskEffects[k].HasKey("IgnitedQueueEndtime")) || (A_TickCount>=(WindowQueuedFlaskEffects[k].IgnitedQueueEndtime-lagCompensation)))
					{
						flaskNum:=GetMaxChargesFlaskOfMod(FlasksData,"of Dousing")
						if (flaskNum!="")
						{  
							WindowQueuedFlaskEffects[k].IgnitedQueueEndtime:=A_TickCount+300
							
							if (trayNotifications)
							{
								TrayTip, PoE AutoFlask Using "of Dousing" flask %flaskNum%, %A_Space% , 2
							}
							hKey:=FlaskHotkey%flaskNum%
							ControlSend,,%hkey%, % "ahk_id" hwnd
						}
					}
				}
				continue
			}

         else if InStr(playerstats.BuffName[A_Index], "curse")
         {
            if (FlaskOnCurseCheck)
            {
               If ((!WindowQueuedFlaskEffects[k].HasKey("CurseQueueEndtime")) || (A_TickCount>=(WindowQueuedFlaskEffects[k].CurseQueueEndtime-lagCompensation)))
               {
                  flaskNum:=GetMaxChargesFlaskOfMod(FlasksData,"of Warding")
                  if (flaskNum!="")
                  {  
                     WindowQueuedFlaskEffects[k].CurseQueueEndtime:=A_TickCount+300
                     
                     if (trayNotifications)
                     {
                        TrayTip, PoE AutoFlask Using "of Warding" flask %flaskNum%, %A_Space% , 2
                     }
                     hKey:=FlaskHotkey%flaskNum%
                     ControlSend,,%hkey%, % "ahk_id" hwnd
                  }
               }
            }
            continue
         }

         else if InStr(playerstats.BuffName[A_Index], "corrupted_blood")
         {
            BuffCharges:=PlayerStats.BuffCharges[A_Index]
            if ((FlaskOnCorruptedBloodCheck) && (BuffCharges>=RemCorruptedBloodCharges))
            {
               If ((!WindowQueuedFlaskEffects[k].HasKey("CorruptedBloodQueueEndtime")) || (A_TickCount>=(WindowQueuedFlaskEffects[k].CorruptedBloodQueueEndtime-lagCompensation)))
               {
                  flaskNum:=GetMaxChargesFlaskOfMod(FlasksData,"of Staunching")
                  if (flaskNum!="")
                  {  
                     WindowQueuedFlaskEffects[k].CorruptedBloodQueueEndtime:=A_TickCount+300
                     
                     if (trayNotifications)
                     {
                        TrayTip, PoE AutoFlask Using "of Staunching" flask %flaskNum%, %A_Space% , 2
                     }
                     hKey:=FlaskHotkey%flaskNum%
                     ControlSend,,%hkey%, % "ahk_id" hwnd
                  }
               }
            }
            continue
         }

			/* ;Others
			else if InStr(playerstats.BuffName[A_Index], "chilled")
			{
				TrayTip, test , THIS BUFF IS CHILLED!!! buff%A_Index%
				continue
			}

			else if InStr(playerstats.BuffName[A_Index], "puncture")
			{
				TrayTip, test, THIS BUFF IS PUNCTURE!!! buff%A_Index%
				continue
			}

			else if InStr(playerstats.BuffName[A_Index], "endurance_charge")
			{
				BuffCharges:=PlayerStats.BuffCharges[A_Index]
				TrayTip, test, Endurance Charge has %BuffCharges% charges  ;charges test
				continue
			}
			*/
		}

		if (currLifeRatio<CurrentConfig.minLifeRatioToDrink)
		{
			if ((!WindowQueuedFlaskEffects[k].HasKey("hpQueueEndtime")) || (A_TickCount>=(WindowQueuedFlaskEffects[k].hpQueueEndtime-lagCompensation)))
			{
				tflaskNum2:=GetMaxChargesFlaskOfType(FlasksData,"FlaskLife")
				tflaskNum1:=GetMaxChargesFlaskOfType(FlasksData,"FlaskHybrid")
				if ((tflaskNum1!=) && (tflaskNum2!=))
				{
					flaskNum:=(FlasksData[tflaskNum1].ChargesCurrent>FlasksData[tflaskNum2].ChargesCurrent) ? tflaskNum1 : tflaskNum2
				}
				else
				{
					if (tflaskNum1!="")
					{
						flaskNum:=tflaskNum1
					}
					if (tflaskNum2!="")
					{
						flaskNum:=tflaskNum2
					}
				}
				if (flaskNum!="")
				{  
					EffectDuration:=FlasksData[flaskNum].EffectDuration
					if (InStr(FlasksData[flaskNum].mod1,"Seething"))
					{
						WindowQueuedFlaskEffects[k].hpQueueEndtime:=A_TickCount+500
					}
					else if (InStr(FlasksData[flaskNum].mod2,"Seething"))
					{
						WindowQueuedFlaskEffects[k].hpQueueEndtime:=A_TickCount+500
					}
					else if ((InStr(FlasksData[flaskNum].mod1,"Panicked")) And ((PlayerStats.CurrHP/PlayerStats.MaxHP)<=0.35)) ; "Low life" can be caused by auras hp reservation from blood magic
					{
						WindowQueuedFlaskEffects[k].hpQueueEndtime:=A_TickCount+500
					}
					else if ((InStr(FlasksData[flaskNum].mod2,"Panicked")) And ((PlayerStats.CurrHP/PlayerStats.MaxHP)<=0.35)) ; "Low life" can be caused by auras hp reservation from blood magic
					{
						WindowQueuedFlaskEffects[k].hpQueueEndtime:=A_TickCount+500
					}
					else
					{
						WindowQueuedFlaskEffects[k].hpQueueEndtime:=A_TickCount+EffectDuration*100
					}
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
				tflaskNum2:=GetMaxChargesOfInstantFlask(FlasksData,"FlaskLife")
				if (tflaskNum2!="")
				{
					flaskNum:=tflaskNum2
				}
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
				{
					flaskNum:=(FlasksData[tflaskNum1].ChargesCurrent>FlasksData[tflaskNum2].ChargesCurrent) ? tflaskNum1 : tflaskNum2
				}
				else
				{
					if (tflaskNum1!="")
					{
						flaskNum:=tflaskNum1
					}
					if (tflaskNum2!="")
					{
						flaskNum:=tflaskNum2
					}
				}

				if (flaskNum!="")
				{
					EffectDuration:=FlasksData[flaskNum].EffectDuration
					if (InStr(FlasksData[flaskNum].mod1,"Seething"))
					{
						WindowQueuedFlaskEffects[k].ManaQueueEndtime:=A_TickCount+500
					}
					else if (InStr(FlasksData[flaskNum].mod2,"Seething"))
					{
						WindowQueuedFlaskEffects[k].ManaQueueEndtime:=A_TickCount+500
					}
					else if ((InStr(FlasksData[flaskNum].mod1,"Panicked")) And ((PlayerStats.CurrHP/PlayerStats.MaxHP)<=0.35)) ; "Low life" can be caused by auras hp reservation from blood magic
					{
						WindowQueuedFlaskEffects[k].ManaQueueEndtime:=A_TickCount+500
					}
					else if ((InStr(FlasksData[flaskNum].mod2,"Panicked")) And ((PlayerStats.CurrHP/PlayerStats.MaxHP)<=0.35)) ; "Low life" can be caused by auras hp reservation from blood magic
					{
						WindowQueuedFlaskEffects[k].ManaQueueEndtime:=A_TickCount+500
					}
					else
					{
						WindowQueuedFlaskEffects[k].ManaQueueEndtime:=A_TickCount+EffectDuration*100
					}
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

		IfWinActive Path of Exile ahk_class Direct3DWindowClass
		{
			SendMode Input
			if (IsInGame(hwnd))
			{
				if (PlayerStats.ChatStatus!="" && PlayerStats.ChatStatus=65536)
				{
					if (PlayerStats.PanelWaypoint=65537)
					{
						GetKeyState, stateRCTRL, RCtrl
						if stateRCTRL = U
						{
							SendInput, {RCtrl Down}
							OnetimeNotification := true
							if (trayNotifications)
							{
								TrayTip, Waypoint panel detected!, CTRL key: DOWN, 1
							}
						}
					}
					else
					{
						if (OnetimeNotification)
						{
							GetKeyState, stateRCTRL, RCtrl
							if stateRCTRL = D
							{
								SendInput, {RCtrl Up}
								OnetimeNotification := false
								if (trayNotifications)
								{
									TrayTip, Waypoint panel closed!, CTRL key: UP, 1
								}
							}
						}
					}
				}
			}
		}
		else
		{
			if (OnetimeNotification)
			{
				GetKeyState, stateRCTRL, RCtrl
				if stateRCTRL = D
				{
					SendInput, {RCtrl Up}
					OnetimeNotification := false
					if (trayNotifications)
					{
						TrayTip, Releasing CTRL Key!, Path of Exile is no longer your active window!`n> CTRL key: UP, 2
					}
				}
			}
		}
		
		if (PlayerStats.PlayerActionID!="" && PlayerStats.PlayerActionID!=80 && PlayerStats.PlayerActionID!=90)
		{
			MovementTimer:= A_TickCount
		}
		;TODO MovementTimer%A_Index%

		if(QuickSilverCheck && QuicksilverBuff=0)
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

		if(QuickSilverCheck2 && QuicksilverBuff=0)
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
      
		if(AttackInPlaceCheck)
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
											AttackInPlaceKeyUp:=1
										}
										Else
										{
											IfWinActive Path of Exile ahk_class Direct3DWindowClass
											{
												Sendinput, {%AttackInPlaceKey% DOWN}
												AttackInPlaceKeyUp:=0
											} 
											Else
											{
												AttackInPlaceKeyUp:=1
											}
										}
									}
									Else
									{
										AttackInPlaceKeyUp:=1
									}
								}
								Else
								{
									AttackInPlaceKeyUp:=1
								}
							}
							Else
							{
								AttackInPlaceKeyUp:=1
							}
						}
						Else
						{
							AttackInPlaceKeyUp:=1
						}
					}
					Else
					{
						AttackInPlaceKeyUp:=1
					}
				}
				Else
				{
					AttackInPlaceKeyUp:=1
				}
			}
			Else
			{
				AttackInPlaceKeyUp:=1
			}
			If AttackInPlaceKeyUp = 1
		    {
		       GetKeyState, stateSH, %AttackInPlaceKey%
		       if stateSH = D
		       {
		          Sendinput, {%AttackInPlaceKey% UP}
		       }
		       AttackInPlaceKeyUp:=0
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

      if hideout = 1
      {
         if (PlayerStats.ChatStatus!="" && PlayerStats.ChatStatus=65536)
         {
            if (IsInGame(hwnd))
            {
               if (PlayerStats.PanelWaypoint=65536 && PlayerStats.PanelInventory=65536 && PlayerStats.PanelSkillTree=65536 && PlayerStats.PanelSocial=65536)
               {
                  IfWinActive Path of Exile ahk_class Direct3DWindowClass
                  {
                     SendInput {NumpadEnter}/hideout{NumpadEnter}
                  }
                  Else
                  {
                     ControlSend,,{NumpadEnter}, % "ahk_id" hwnd
                     SetKeyDelay, 40, 20
                     ControlSend,,`/hideout, % "ahk_id" hwnd
                     SetKeyDelay, 0, 0
                     ControlSend,,{NumpadEnter}, % "ahk_id" hwnd
                  }
               }
            }
            hideout := 0
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
                        GetKeyState, stateSH, SHIFT
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
                        GetKeyState, stateSH, SHIFT
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
                           GetKeyState, stateSH, SHIFT
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

         If (A_TickCount>=(RemainingTimer+RemainingSpam*1000) And (RemainingSpam>0))
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
                           GetKeyState, stateSH, SHIFT
                           if stateSH = D
                           {
                              Sendinput {SHIFT up}
                           }
                           Sendinput {NumpadEnter}/remaining{NumpadEnter}
                        }
                     }
                  }
               }
            }
            RemainingTimer:= A_TickCount
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
      GetKeyState, stateR, RButton
      if stateR = D
      {
         Send {RButton up}
      }
      GetKeyState, stateL, LButton
      if stateL = D
      {
         Send {LButton up}
      }
      GetKeyState, stateM, MButton
      if stateM = D
      {
         Send {MButton up}
      }
      GetKeyState, stateQ, Q
      if stateQ = D
      {
         Send {Q up}
      }
      GetKeyState, stateW, W
      if stateW = D
      {
         Send {W up}
      }
      GetKeyState, stateE, E
      if stateE = D
      {
         Send {E up}
      }
      GetKeyState, stateR, R
      if stateR = D
      {
         Send {R up}
      }
      GetKeyState, stateT, T
      if stateT = D
      {
         Send {T up}
      }
      GetKeyState, stateI, I
      if stateI = D
      {
         Send {I up}
      }
      GetKeyState, stateSP, SPACE
      if stateSP = D
      {
         Send {SPACE up}
      }
      GetKeyState, stateSH, SHIFT
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

;-------GUI UPDATE FUNCTIONS--------------GUI UPDATE FUNCTIONS--------------GUI UPDATE FUNCTIONS-----

GuiUpdate:
   Gui, Submit, NoHide

   GuiControl, , QuickSilverMovementTimerUpdate, % Round(QuickSilverMovementTimer/10,1)
   GuiControl, , RemoveAilmentsTimerUpdate, % Round(RemoveAilmentsTimer/10,1)
   GuiControl, , RemoveCorruptedBloodChargesUpdate, %RemoveCorruptedBloodCharges%

   If (minLifePercentToQuit=0)
   {
      GuiControl, , minLifePercentToQuitUpdate, N/A
      GuiControl, , minLifePercentToQuitUpdatePercent,
   }
   Else
   {
      GuiControl, , minLifePercentToQuitUpdate, %minLifePercentToQuit%
      GuiControl, , minLifePercentToQuitUpdatePercent, `%
   }
   If (minESPercentToQuit=0)
   {
      GuiControl, , minESPercentToQuitUpdate, N/A
      GuiControl, , minESPercentToQuitUpdatePercent, 
   }
   Else
   {
      GuiControl, , minESPercentToQuitUpdate, %minESPercentToQuit%
      GuiControl, , minESPercentToQuitUpdatePercent, `%
   }
   If (maxLifePercentPerHitToQuit=0 || maxLifePercentPerHitToQuit=100)
   {
      GuiControl, , maxLifePercentPerHitToQuitUpdate, N/A
      GuiControl, , maxLifePercentPerHitToQuitUpdatePercent, 
   }
   Else
   {
      GuiControl, , maxLifePercentPerHitToQuitUpdate, %maxLifePercentPerHitToQuit%
      GuiControl, , maxLifePercentPerHitToQuitUpdatePercent, `%
   }
   If (maxESPercentPerHitToQuit=0)
   {
      GuiControl, , maxESPercentPerHitToQuitUpdate, N/A
      GuiControl, , maxESPercentPerHitToQuitUpdatePercent,
   }
   Else
   {
      GuiControl, , maxESPercentPerHitToQuitUpdate, %maxESPercentPerHitToQuit%
      GuiControl, , maxESPercentPerHitToQuitUpdatePercent, `%
   }
   If (minLifePercentToJade=0)
   {
      GuiControl, , minLifePercentToJadeUpdate, N/A
      GuiControl, , minLifePercentToJadeUpdatePercent, 
   }
   Else
   {
      GuiControl, , minLifePercentToJadeUpdate, %minLifePercentToJade%
      GuiControl, , minLifePercentToJadeUpdatePercent, `% 
   }
   If (minESPercentToJade=0)
   {
      GuiControl, , minESPercentToJadeUpdate, N/A
      GuiControl, , minESPercentToJadeUpdatePercent, 
   }
   Else
   {
      GuiControl, , minESPercentToJadeUpdate, %minESPercentToJade%
      GuiControl, , minESPercentToJadeUpdatePercent, `%
   }
   If (minLifePercentToElementalResist=0)
   {
      GuiControl, , minLifePercentToElementalResistUpdate, N/A
      GuiControl, , minLifePercentToElementalResistUpdatePercent, 
   }
   Else
   {
      GuiControl, , minLifePercentToElementalResistUpdate, %minLifePercentToElementalResist%
      GuiControl, , minLifePercentToElementalResistUpdatePercent, `%
   }
   If (minESPercentToElementalResist=0)
   {
      GuiControl, , minESPercentToElementalResistUpdate, N/A
      GuiControl, , minESPercentToElementalResistUpdatePercent, 
   }
   Else
   {
      GuiControl, , minESPercentToElementalResistUpdate, %minESPercentToElementalResist%
      GuiControl, , minESPercentToElementalResistUpdatePercent, `%
   }
   If (minLifePercentToDrink=0)
   {
      GuiControl, , minLifePercentToDrinkUpdate, N/A
      GuiControl, , minLifePercentToDrinkUpdatePercent, 
   }
   Else
   {
      GuiControl, , minLifePercentToDrinkUpdate, %minLifePercentToDrink%
      GuiControl, , minLifePercentToDrinkUpdatePercent, `%
   }
   If (minManaPercentToDrink=0)
   {
      GuiControl, , minManaPercentToDrinkUpdate, N/A
      GuiControl, , minManaPercentToDrinkUpdatePercent, 
   }
   Else
   {
      GuiControl, , minManaPercentToDrinkUpdate, %minManaPercentToDrink%
      GuiControl, , minManaPercentToDrinkUpdatePercent, `%
   }
   If (minManaToDrinkPot=0)
   {
      GuiControl, , minManaToDrinkPotUpdate, N/A
   }
   Else
   {
      GuiControl, , minManaToDrinkPotUpdate, %minManaToDrinkPot%
   }
   If (InstantFlaskDelay=0)
   {
      GuiControl, , InstantFlaskDelayUpdate, N/A
      GuiControl, , InstantFlaskDelayUpdatePercent, 
   }
   Else
   {
      GuiControl, , InstantFlaskDelayUpdate,  % Round(InstantFlaskDelay/100,2)
      GuiControl, , InstantFlaskDelayUpdatePercent, s

   }
   If (minLifePercentToSpam=0)
   {
      GuiControl, , minLifePercentToSpamUpdate, N/A
      GuiControl, , minLifePercentToSpamUpdatePercent, 
   }
   Else
   {
      GuiControl, , minLifePercentToSpamUpdate, %minLifePercentToSpam%
      GuiControl, , minLifePercentToSpamUpdatePercent, `%
   }
   If (TradeSpam=0)
   {
      GuiControl, , TradeSpamUpdate, N/A
      GuiControl, , TradeSpamUpdatePercent, 
   }
   Else
   {
      GuiControl, , TradeSpamUpdate, %TradeSpam%
      GuiControl, , TradeSpamUpdatePercent, m
   }
   If (ResyncSpam=0)
   {
      GuiControl, , ResyncSpamUpdate, N/A
      GuiControl, , ResyncSpamUpdatePercent, 
   }
   Else
   {
      GuiControl, , ResyncSpamUpdate, %ResyncSpam%
      GuiControl, , ResyncSpamUpdatePercent, s
   }
   If (RemainingSpam=0)
   {
      GuiControl, , RemainingSpamUpdate, N/A
      GuiControl, , RemainingSpamUpdatePercent, 
   }
   Else
   {
      GuiControl, , RemainingSpamUpdate, %RemainingSpam%
      GuiControl, , RemainingSpamUpdatePercent, s
   }

   Loop, 5
   {
		If ConfigChoice = %A_Index%
		{
			IniWrite, %minLifePercentToQuit% , Config.ini, Config%A_Index%, minLifePercentToQuit
			IniWrite, %minESPercentToQuit% , Config.ini, Config%A_Index%, minESPercentToQuit
			IniWrite, %maxLifePercentPerHitToQuit% , Config.ini, Config%A_Index%, maxLifePercentPerHitToQuit
			IniWrite, %maxESPercentPerHitToQuit% , Config.ini, Config%A_Index%, maxESPercentPerHitToQuit
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
			IniWrite, %RemoveAilmentsTimer% , Config.ini, Config%A_Index%, RemoveAilmentsTimer
			IniWrite, %ResyncSpam% , Config.ini, Config%A_Index%, ResyncSpam
         IniWrite, %RemainingSpam% , Config.ini, Config%A_Index%, RemainingSpam
         IniWrite, %RemoveCorruptedBloodCharges% , Config.ini, Config%A_Index%, RemoveCorruptedBloodCharges
		}
   }

   
   IniWrite, %InstantFlaskDelay% , Config.ini, Config, InstantFlaskDelay
   IFDelay:= InstantFlaskDelay

   PlayerConfig["Default"]:={RemCorruptedBloodCharges:RemoveCorruptedBloodCharges,RemAilmentsTimer:RemoveAilmentsTimer,QuickSilverTimer:QuickSilverMovementTimer*100, minLifeRatioToInstant: minLifePercentToSpam/100, IFlaskDelay: InstantFlaskDelay,minLifeRatioToDrink: minLifePercentToDrink/100, minManaRatioToDrink: minManaPercentToDrink/100, minManaToDrink: minManaToDrinkPot, minLifeRatioToPopElementalResist: minLifePercentToElementalResist/100,minLifeRatioToPopJade: minLifePercentToJade/100, minLifeRatioToQuit: minLifePercentToQuit/100,maxLifeRatioPerHitToQuit: maxLifePercentPerHitToQuit/100,maxNShieldRatioPerHitToQuit: maxESPercentPerHitToQuit/100,minNShieldRatioToQuit: minESPercentToQuit/100, minNShieldRatioToPopElementalResist: minESPercentToElementalResist/100, minNShieldRatioToPopJade: minESPercentToJade/100}


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
   MsgBox,0,, An error ocurred, reloading script.
ExitApp

DefaultHotkeys:
   Gui, Submit, NoHide

   IniDelete, Config.ini, Hotkeys


   Reload
   Sleep, 2000
   MsgBox,0,, An error ocurred, reloading script.
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
			IniRead, maxLifePercentPerHitToQuit , Config.ini, Config%A_Index%, maxLifePercentPerHitToQuit, 50
			IniRead, maxESPercentPerHitToQuit , Config.ini, Config%A_Index%, maxESPercentPerHitToQuit, 0
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
         IniRead, RemainingSpam, Config.ini, Config%A_Index%, RemainingSpam, 0
			IniRead, InstantFlaskDelay, Config.ini, Config%A_Index%, InstantFlaskDelay, 0
			IniRead, QuickSilverMovementTimer , Config.ini, Config%A_Index%, QuickSilverMovementTimer, 15
         IniRead, RemoveAilmentsTimer , Config.ini, Config%A_Index%, RemoveAilmentsTimer, 10
         IniRead, RemoveCorruptedBloodCharges, Config.ini, Config%A_Index%, RemoveCorruptedBloodCharges, 10
			IniWrite, %A_Index%, Config.ini, Config, ConfigNumber
		}
	}


   GuiControl, , minLifePercentToQuit, %minLifePercentToQuit%
   GuiControl, , maxLifePercentPerHitToQuit, %maxLifePercentPerHitToQuit%
   GuiControl, , maxESPercentPerHitToQuit, %maxESPercentPerHitToQuit%
   GuiControl, , minESPercentToQuit, %minESPercentToQuit%
   GuiControl, , minLifePercentToJade, %minLifePercentToJade%
   GuiControl, , minESPercentToJade, %minESPercentToJade%
   GuiControl, , minLifePercentToElementalResist, %minLifePercentToElementalResist%
   GuiControl, , minESPercentToElementalResist, %minESPercentToElementalResist%
   GuiControl, , minLifePercentToDrink, %minLifePercentToDrink%
   GuiControl, , minManaPercentToDrink, %minManaPercentToDrink%
   GuiControl, , minManaToDrinkPot, %minManaToDrinkPot%
   GuiControl, , minLifePercentToSpam, %minLifePercentToSpam%
   GuiControl, , ResyncSpam, %ResyncSpam%
   GuiControl, , RemainingSpam, %RemainingSpam%
   GuiControl, , InstantFlaskDelay, %InstantFlaskDelay%
   GuiControl, , QuickSilverMovementTimer, %QuickSilverMovementTimer%
   GuiControl, , RemoveAilmentsTimer, %RemoveAilmentsTimer%
   GuiControl, , RemoveCorruptedBloodCharges, %RemoveCorruptedBloodCharges%


   GuiControl, , QuickSilverMovementTimerUpdate, % Round(QuickSilverMovementTimer/10,1)
   GuiControl, , RemoveAilmentsTimerUpdate, % Round(RemoveAilmentsTimer/10,1)
   GuiControl, , RemoveCorruptedBloodChargesUpdate, %RemoveCorruptedBloodCharges%

   If (minLifePercentToQuit=0)
   {
      GuiControl, , minLifePercentToQuitUpdate, N/A
      GuiControl, , minLifePercentToQuitUpdatePercent,
   }
   Else
   {
      GuiControl, , minLifePercentToQuitUpdate, %minLifePercentToQuit%
      GuiControl, , minLifePercentToQuitUpdatePercent, `%
   }
   If (minESPercentToQuit=0)
   {
      GuiControl, , minESPercentToQuitUpdate, N/A
      GuiControl, , minESPercentToQuitUpdatePercent, 
   }
   Else
   {
      GuiControl, , minESPercentToQuitUpdate, %minESPercentToQuit%
      GuiControl, , minESPercentToQuitUpdatePercent, `%
   }
   If (maxLifePercentPerHitToQuit=0 || maxLifePercentPerHitToQuit=100)
   {
      GuiControl, , maxLifePercentPerHitToQuitUpdate, N/A
      GuiControl, , maxLifePercentPerHitToQuitUpdatePercent, 
   }
   Else
   {
      GuiControl, , maxLifePercentPerHitToQuitUpdate, %maxLifePercentPerHitToQuit%
      GuiControl, , maxLifePercentPerHitToQuitUpdatePercent, `%
   }
   If (maxESPercentPerHitToQuit=0)
   {
      GuiControl, , maxESPercentPerHitToQuitUpdate, N/A
      GuiControl, , maxESPercentPerHitToQuitUpdatePercent,
   }
   Else
   {
      GuiControl, , maxESPercentPerHitToQuitUpdate, %maxESPercentPerHitToQuit%
      GuiControl, , maxESPercentPerHitToQuitUpdatePercent, `%
   }
   If (minLifePercentToJade=0)
   {
      GuiControl, , minLifePercentToJadeUpdate, N/A
      GuiControl, , minLifePercentToJadeUpdatePercent, 
   }
   Else
   {
      GuiControl, , minLifePercentToJadeUpdate, %minLifePercentToJade%
      GuiControl, , minLifePercentToJadeUpdatePercent, `% 
   }
   If (minESPercentToJade=0)
   {
      GuiControl, , minESPercentToJadeUpdate, N/A
      GuiControl, , minESPercentToJadeUpdatePercent, 
   }
   Else
   {
      GuiControl, , minESPercentToJadeUpdate, %minESPercentToJade%
      GuiControl, , minESPercentToJadeUpdatePercent, `%
   }
   If (minLifePercentToElementalResist=0)
   {
      GuiControl, , minLifePercentToElementalResistUpdate, N/A
      GuiControl, , minLifePercentToElementalResistUpdatePercent, 
   }
   Else
   {
      GuiControl, , minLifePercentToElementalResistUpdate, %minLifePercentToElementalResist%
      GuiControl, , minLifePercentToElementalResistUpdatePercent, `%
   }
   If (minESPercentToElementalResist=0)
   {
      GuiControl, , minESPercentToElementalResistUpdate, N/A
      GuiControl, , minESPercentToElementalResistUpdatePercent, 
   }
   Else
   {
      GuiControl, , minESPercentToElementalResistUpdate, %minESPercentToElementalResist%
      GuiControl, , minESPercentToElementalResistUpdatePercent, `%
   }
   If (minLifePercentToDrink=0)
   {
      GuiControl, , minLifePercentToDrinkUpdate, N/A
      GuiControl, , minLifePercentToDrinkUpdatePercent, 
   }
   Else
   {
      GuiControl, , minLifePercentToDrinkUpdate, %minLifePercentToDrink%
      GuiControl, , minLifePercentToDrinkUpdatePercent, `%
   }
   If (minManaPercentToDrink=0)
   {
      GuiControl, , minManaPercentToDrinkUpdate, N/A
      GuiControl, , minManaPercentToDrinkUpdatePercent, 
   }
   Else
   {
      GuiControl, , minManaPercentToDrinkUpdate, %minManaPercentToDrink%
      GuiControl, , minManaPercentToDrinkUpdatePercent, `%
   }
   If (minManaToDrinkPot=0)
   {
      GuiControl, , minManaToDrinkPotUpdate, N/A
   }
   Else
   {
      GuiControl, , minManaToDrinkPotUpdate, %minManaToDrinkPot%
   }
   If (InstantFlaskDelay=0)
   {
      GuiControl, , InstantFlaskDelayUpdate, N/A
      GuiControl, , InstantFlaskDelayUpdatePercent, 
   }
   Else
   {
      GuiControl, , InstantFlaskDelayUpdate,  % Round(InstantFlaskDelay/100,2)
      GuiControl, , InstantFlaskDelayUpdatePercent, s

   }
   If (minLifePercentToSpam=0)
   {
      GuiControl, , minLifePercentToSpamUpdate, N/A
      GuiControl, , minLifePercentToSpamUpdatePercent, 
   }
   Else
   {
      GuiControl, , minLifePercentToSpamUpdate, %minLifePercentToSpam%
      GuiControl, , minLifePercentToSpamUpdatePercent, `%
   }
   If (TradeSpam=0)
   {
      GuiControl, , TradeSpamUpdate, N/A
      GuiControl, , TradeSpamUpdatePercent, 
   }
   Else
   {
      GuiControl, , TradeSpamUpdate, %TradeSpam%
      GuiControl, , TradeSpamUpdatePercent, m
   }
   If (ResyncSpam=0)
   {
      GuiControl, , ResyncSpamUpdate, N/A
      GuiControl, , ResyncSpamUpdatePercent, 
   }
   Else
   {
      GuiControl, , ResyncSpamUpdate, %ResyncSpam%
      GuiControl, , ResyncSpamUpdatePercent, s
   }
   If (RemainingSpam=0)
   {
      GuiControl, , RemainingSpamUpdate, N/A
      GuiControl, , RemainingSpamUpdatePercent, 
   }
   Else
   {
      GuiControl, , RemainingSpamUpdate, %RemainingSpam%
      GuiControl, , RemainingSpamUpdatePercent, s
   }

   PlayerConfig["Default"]:={RemCorruptedBloodCharges:RemoveCorruptedBloodCharges,RemAilmentsTimer:RemoveAilmentsTimer,QuickSilverTimer:QuickSilverMovementTimer*100, minLifeRatioToInstant: minLifePercentToSpam/100, IFlaskDelay: InstantFlaskDelay,minLifeRatioToDrink: minLifePercentToDrink/100, minManaRatioToDrink: minManaPercentToDrink/100, minManaToDrink: minManaToDrinkPot, minLifeRatioToPopElementalResist: minLifePercentToElementalResist/100,minLifeRatioToPopJade: minLifePercentToJade/100, minLifeRatioToQuit: minLifePercentToQuit/100,maxLifeRatioPerHitToQuit: maxLifePercentPerHitToQuit/100,maxNShieldRatioPerHitToQuit: maxESPercentPerHitToQuit/100,minNShieldRatioToQuit: minESPercentToQuit/100, minNShieldRatioToPopElementalResist: minESPercentToElementalResist/100, minNShieldRatioToPopJade: minESPercentToJade/100}
   
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

FlaskOnFrozenCheck:
   Gui, Submit, NoHide
   If FlaskOnFrozenCheckBox = 0
   {
      FlaskOnFrozenCheck = 0
      IniWrite, 0 , Config.ini, Config, FlaskOnFrozenCheck
   }
   If FlaskOnFrozenCheckBox = 1
   {
      FlaskOnFrozenCheck = 1
      IniWrite, 1 , Config.ini, Config, FlaskOnFrozenCheck
   }
   IniWrite, %FlaskOnFrozenCheck% , Config.ini, Config, FlaskOnFrozenCheck
return 

FlaskOnShockedCheck:
   Gui, Submit, NoHide
   If FlaskOnShockedCheckBox = 0
   {
      FlaskOnShockedCheck = 0
      IniWrite, 0 , Config.ini, Config, FlaskOnShockedCheck
   }
   If FlaskOnShockedCheckBox = 1
   {
      FlaskOnShockedCheck = 1
      IniWrite, 1 , Config.ini, Config, FlaskOnShockedCheck
   }
   IniWrite, %FlaskOnShockedCheck% , Config.ini, Config, FlaskOnShockedCheck
return 

FlaskOnIgnitedCheck:
   Gui, Submit, NoHide
   If FlaskOnIgnitedCheckBox = 0
   {
      FlaskOnIgnitedCheck = 0
      IniWrite, 0 , Config.ini, Config, FlaskOnIgnitedCheck
   }
   If FlaskOnIgnitedCheckBox = 1
   {
      FlaskOnIgnitedCheck = 1
      IniWrite, 1 , Config.ini, Config, FlaskOnIgnitedCheck
   }
   IniWrite, %FlaskOnIgnitedCheck% , Config.ini, Config, FlaskOnIgnitedCheck
return 

FlaskOnCurseCheck:
   Gui, Submit, NoHide
   If FlaskOnCurseCheckBox = 0
   {
      FlaskOnCurseCheck = 0
      IniWrite, 0 , Config.ini, Config, FlaskOnCurseCheck
   }
   If FlaskOnCurseCheckBox = 1
   {
      FlaskOnCurseCheck = 1
      IniWrite, 1 , Config.ini, Config, FlaskOnCurseCheck
   }
   IniWrite, %FlaskOnCurseCheck% , Config.ini, Config, FlaskOnCurseCheck
return 

FlaskOnCorruptedBloodCheck:
   Gui, Submit, NoHide
   If FlaskOnCorruptedBloodCheckBox = 0
   {
      FlaskOnCorruptedBloodCheck = 0
      IniWrite, 0 , Config.ini, Config, FlaskOnCorruptedBloodCheck
   }
   If FlaskOnCorruptedBloodCheckBox = 1
   {
      FlaskOnCorruptedBloodCheck = 1
      IniWrite, 1 , Config.ini, Config, FlaskOnCorruptedBloodCheck
   }
   IniWrite, %FlaskOnCorruptedBloodCheck% , Config.ini, Config, FlaskOnCorruptedBloodCheck
return 

AttackInPlaceCheck:
   Gui, Submit, NoHide
   If AttackInPlaceCheckBox = 0
   {
      AttackInPlaceCheck = 0
      IniWrite, 0 , Config.ini, Config, AttackInPlaceCheck
   }
   If AttackInPlaceCheckBox = 1
   {
      AttackInPlaceCheck = 1
      IniWrite, 1 , Config.ini, Config, AttackInPlaceCheck
   }
   IniWrite, %AttackInPlaceCheck% , Config.ini, Config, AttackInPlaceCheck
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
   Gui, Show, x760 y198 h665 w474
Return

showgui2:
   
   Gui, 2:Show,,Hotkeys

   ; Set GUI State
   LoadSettings()

   ; Enable defined hotkeys
   EnableHotkeys()
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
   MsgBox, ------------------------------HOTKEYS------------------------------`n`n[F1] --- Use Resync Command`n[F2] --- Use Remaining Command`n[F3] --- Over an Item for DPSCalc`n[Ctrl+F3] --- Over an Item for More info on the Internet`n[F4] --- Test Exit to Log In Screen`n[Ctrl+F4] -- Test Use Portal`n[F10] -- Send Last Chat Message to Trade Channels 1-10`n[Alt + W] - Change Window to Bordeless, and locks mouse on window.`n[MIDDLE MOUSE] - Send Hideout command.`n`n------------------------------CREDITS------------------------------`n`n Base Script Created by Wrongusername.`n`n GUI and Improvements by Gurud.`n`n DPSCalc By Nipper`n`n----------------------------MORE INFO----------------------------`n`nFor more Info and Updates Go to:`n`n http://www.ownedcore.com/forums`n/mmo/path-of-exile/poe-bots-programs`n/451206-poe-autoflask-autoscript-improvements-updates.html`n`nThe link has been coppied to the clipboard.
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

;-------HOTKEYS-----------------HOTKEYS-----------------HOTKEYS-----------------HOTKEYS--------------
; Test that bound hotkeys work
;These labels may contain any commands for their respective hotkeys to perform.
DoHotkey1:
   desync:=1
return

DoHotkey2:
   remaining:=1
return

DoHotkey3:
   DPSCalc()
return

DoHotkey4:
   Webgrab()
return

DoHotkey5:
   QuitToLoginScreen(WinActive("A"))
return

DoHotkey6:
   UsePortal()
return

DoHotkey7:
   tradechat:=1
return

DoHotkey8:
   WinGet, window, ID, A   ; Use the ID of the active window.
   Toggle_Window(window)
return

DoHotkey9:
   hideout:=1
return

;-------HOTKEYS-----------------HOTKEYS-----------------HOTKEYS-----------------HOTKEYS--------------

; Something changed - rebuild
OptionChanged:
   OptionChanged()
   return

OptionChanged()
{
   global HotkeyList

   Gui, 2:Submit, NoHide
   ; Disable Hotkeys
   DisableHotkeys()

   Loop % HotkeyList.MaxIndex(){
      ;HotkeyList[A_Index].block := Block%A_Index%
      HotkeyList[A_Index].wild := Wild%A_Index%
   }

   EnableHotkeys()

   SaveSettings()
}

; Detects a pressed key combination
Bind:
   Gui, 2:Submit, NoHide
   Bind(substr(A_GuiControl,5))
   return

Bind(ctrlnum)
{
   global HKModifierState
   global BindMode
   global EXTRA_KEY_LIST
   global HKControlType
   global HKSecondaryInput
   global HKLastHotkey

   global HotkeyList

   ; init vars
   HKControlType := 0
   HKModifierState := {ctrl: 0, alt: 0, shift: 0, win: 0}

   ; Disable existing hotkeys
   DisableHotkeys()

   ; Enable Joystick detection hotkeys
   JoystickDetection(1)

   ; Start Bind Mode - this starts detection for mouse buttons and modifier keys
   BindMode := 1

   ; Show the prompt
   prompt := "Please press the desired key combination.`n`n"
   prompt .= "Supports most keyboard keys and all mouse buttons. Also Ctrl, Alt, Shift, Win as modifiers or individual keys.`n"
   prompt .= "Joystick buttons are also supported, but currently not with modifiers.`n"
   prompt .= "`nHit Escape to cancel."
   prompt .= "`nHold Escape to clear a binding."
   Gui, 3:Add, text, center, %prompt%
   Gui, 3:-Border +AlwaysOnTop
   Gui, 3:Show

   outhk := ""

   Input, detectedkey, L1 M, %EXTRA_KEY_LIST%

   if (substr(ErrorLevel,1,7) == "EndKey:"){
      ; A "Special" (Non-printable) key was pressed
      tmp := substr(ErrorLevel,8)
      detectedkey := tmp
      if (tmp == "Escape"){
         ; Detection ended by Escape
         if (HKControlType > 0){
            ; The Escape key was sent because a special button was used
            detectedkey := HKSecondaryInput
         } else {
            detectedkey := ""
            ; Start listening to key up event for Escape, to see if it was held
            HKLastHotkey := ctrlnum
            hotkey, Escape up, EscapeReleased, ON
            SetTimer, DeleteHotkey, 1000
         }
      }
   }

   ; Stop listening to mouse, keyboard etc
   BindMode := 0
   JoystickDetection(0)

   ; Hide prompt
   Gui, 3:Submit


   ; Process results

   modct := CurrentModifierCount()

   if (detectedkey && modct && HKControlType == 3){
      msgbox ,,Error, Modifiers (Ctrl, Alt, Shift, Win) are currently not supported with Joystick buttons.
      detectedkey := ""
   }

   if (detectedkey)
   {
      ; Update the hotkey object
      outhk := BuildHotkeyString(detectedkey,HKControlType)
      tmp := {hk: outhk, type: HKControlType, status: 0}

      clash := 0
      Loop % HotkeyList.MaxIndex(){
         if (A_Index == ctrlnum)
         {
            continue
         }
         if (StripPrefix(HotkeyList[A_Index].hk) == StripPrefix(tmp.hk))
         {
            clash := 1
         }
      }
      if (clash)
      {
         msgbox You cannot bind the same hotkey to two different actions. Aborting...
      } 
      else 
      {
         HotkeyList[ctrlnum] := tmp
      }

      ; Rebuild rest of hotkey object, save settings etc
      OptionChanged()
      ; Write settings to INI file
      ;SaveSettings()

      ; Update the GUI control
      UpdateHotkeyControls()

      ; Enable the hotkeys
      ;EnableHotkeys()
   } 
   else 
   {
      ; Escape was pressed - resotre original hotkey, if any
      EnableHotkeys()
   }
   return
}

DeleteHotkey:
   SetTimer, DeleteHotkey, Off
   DeleteHotKey(HKLastHotkey)
return

DeleteHotkey(hk)
{
   global HotkeyList
   global DefaultHKObject

   soundbeep
   DisableHotkeys()
   HotkeyList[hk] := DefaultHKObject

   OptionChanged()

   UpdateHotkeyControls()
   return
}

EscapeReleased:
   hotkey, Escape up, EscapeReleased, OFF
   SetTimer, DeleteHotkey, Off
return

; Enables User-Defined Hotkeys
EnableHotkeys()
{
   global HotkeyList
   Loop % HotkeyList.MaxIndex()
   {
      status := HotkeyList[A_Index].status
      hk := HotkeyList[A_Index].hk
      if (hk != "" && status == 0){
         prefix := BuildPrefix(HotkeyList[A_Index])
         ;Msgbox % "ADDING: " prefix "," hk
         hotkey, %prefix%%hk%, DoHotkey%A_Index%, ON
         HotkeyList[A_Index].status := 1
      }
   }
}

; Disables User-Defined Hotkeys
DisableHotkeys()
{
   global HotkeyList

   Loop % HotkeyList.MaxIndex(){
      status := HotkeyList[A_Index].status
      hk := HotkeyList[A_Index].hk
      if (hk != "" && status == 1){
         prefix := BuildPrefix(HotkeyList[A_Index])
         ;Msgbox % "REMOVING: " prefix "," hk
         hotkey, %prefix%%hk%, DoHotkey%A_Index%, OFF
         ;hotkey, %hk%, DoHotkey%A_Index%, OFF
         HotkeyList[A_Index].status := 0
      }
   }
}

; Builds the prefix for a given hotkey object
BuildPrefix(hk)
{
   prefix := "~"
   ;if (!hk.block){
   ;  prefix .= "~"
   ;}
   if (hk.wild){
      prefix .= "*"
   }
   return prefix
}

; Removes ~ * etc prefixes (But NOT modifiers!) from a hotkey object for comparison
StripPrefix(hk)
{
   Loop {
      chr := substr(hk,1,1)
      if (chr == "~" || chr == "*" || chr == "$"){
         hk := substr(hk,2)
      } else {
         break
      }
   }
   return hk
}

; Write settings to the INI
SaveSettings()
{
   global ININame
   global NumHotkeys
   global HotkeyList

   Loop % HotkeyList.MaxIndex(){
      hk := HotkeyList[A_Index].hk
      type := HotkeyList[A_Index].type
      ;block := HotkeyList[A_Index].block
      wild := HotkeyList[A_Index].wild

      ;if (hk != ""){
         iniwrite, %hk%, %ININame%, Hotkeys, hk_%A_Index%_hk
         iniwrite, %type%, %ININame%, Hotkeys, hk_%A_Index%_type
         ;iniwrite, %block%, %ININame%, Hotkeys, hk_%A_Index%_block
         iniwrite, %wild%, %ININame%, Hotkeys, hk_%A_Index%_wild
      ;}
   }
   return
}


; Read settings from the INI
LoadSettings()
{
   global ININame
   global NumHotkeys
   global HotkeyList
   global DefaultHKObject

   Loop % NumHotkeys 
   {
      ; Init array so all items exist
      HotkeyList[A_Index] := DefaultHKObject

      IniRead, type, %ININame% , Hotkeys, hk_%A_Index%_type,
      
      If A_index=1
      {
         IniRead, val, %ININame% , Hotkeys, hk_%A_Index%_hk,F1
      }
      If A_index=2
      {
         IniRead, val, %ININame% , Hotkeys, hk_%A_Index%_hk,F2
      }
      If A_index=3
      {
         IniRead, val, %ININame% , Hotkeys, hk_%A_Index%_hk,F3
      }
      If A_index=4
      {
         IniRead, val, %ININame% , Hotkeys, hk_%A_Index%_hk,^F3
      }
      If A_index=5
      {
         IniRead, val, %ININame% , Hotkeys, hk_%A_Index%_hk,F4
      }
      If A_index=6
      {
         IniRead, val, %ININame% , Hotkeys, hk_%A_Index%_hk,^F4
      }
      If A_index=7
      {
         IniRead, val, %ININame% , Hotkeys, hk_%A_Index%_hk,F10
      }
      If A_index=8
      {
         IniRead, val, %ININame% , Hotkeys, hk_%A_Index%_hk,!W
      }
      If A_index=9
      {
         IniRead, val, %ININame% , Hotkeys, hk_%A_Index%_hk,mbutton
      }
      
      ;IniRead, val, %ININame% , Hotkeys, hk_%A_Index%_hk,
      
      if (val != "ERROR")
      {
         If A_index=9
         {
            IniRead, type, %ININame% , Hotkeys, hk_%A_Index%_type,2
         }
         Else
         {
            IniRead, type, %ININame% , Hotkeys, hk_%A_Index%_type, 0
         }
         ;IniRead, block, %ININame% , Hotkeys, hk_%A_Index%_block, 0
         IniRead, wild, %ININame% , Hotkeys, hk_%A_Index%_wild, 0

         HotkeyList[A_Index] := {hk: val, type: type, wild: wild, status: 0}
      }
   }
   UpdateHotkeyControls()
   Gui, 2:Submit, NoHide
}

; Update the GUI controls with the hotkey names
UpdateHotkeyControls()
{
   global HotkeyList

   Loop % HotkeyList.MaxIndex()
   {
      if (HotkeyList[A_Index].hk != "")
      {
         tmp := BuildHotkeyName(HotkeyList[A_Index].hk,HotkeyList[A_Index].type)
         GuiControl, 2:, HotkeyName%A_Index%, %tmp%
      } 
      else 
      {
         GuiControl, 2:, HotkeyName%A_Index%, None
      }
      ;tmp := HotkeyList[A_Index].block
      ;GuiControl,, Block%A_Index%, %tmp%

      tmp := HotkeyList[A_Index].wild
      GuiControl, 2:, Wild%A_Index%, %tmp%
   }
   Gui, 2:Submit, NoHide
}

; Builds an AHK String (eg "^c" for CTRL + C) from the last detected hotkey
BuildHotkeyString(str, type := 0)
{
   global HKModifierState

   outhk := ""
   modct := CurrentModifierCount()

   if (type == 1){
      ; Solitary modifier key used (eg Left / Right Alt)
      outhk := str
   } else {
      if (modct){
         ; Modifiers used in combination with something else - List modifiers in a specific order
         modifiers := ["CTRL","ALT","SHIFT","WIN"]

         Loop, 4 {
            key := modifiers[A_Index]
            value := HKModifierState[modifiers[A_Index]]
            if (value){
               if (key == "CTRL"){
                  outhk .= "^"
               } else if (key == "ALT"){
                  outhk .= "!"
               } else if (key == "SHIFT"){
                  outhk .= "+"
               } else if (key == "WIN"){
                  outhk .= "#"
               }
            }
         }
      }
      ; Modifiers etc processed, complete the string
      outhk .= str
   }

   return outhk
}

; Builds a Human-Readable form of a Hotkey string (eg "^C" -> "CTRL + C")
BuildHotkeyName(hk,ctrltype)
{
   outstr := ""
   modctr := 0
   stringupper, hk, hk

   Loop % strlen(hk) {
      chr := substr(hk,1,1)
      mod := 0

      if (chr == "^"){
         ; Ctrl
         mod := "CTRL"
         modctr++
      } else if (chr == "!"){
         ; Alt
         mod := "ALT"
         modctr++
      } else if (chr == "+"){
         ; Shift
         mod := "SHIFT"
         modctr++
      } else if (chr == "#"){
         ; Win
         mod := "WIN"
         modctr++
      } else {
         break
      }
      if (mod){
         if (modctr > 1){
            outstr .= " + "
         }
         outstr .= mod
         ; shift character out
         hk := substr(hk,2)
      }
   }
   if (modctr){
      outstr .= " + "
   }

   if (ctrltype == 1){
      ; Solitary Modifiers
      pfx := substr(hk,1,1)
      if (pfx == "L"){
         outstr .= "LEFT "
      } else {
         outstr .= "RIGHT "
      }
      outstr .= substr(hk,2)
   } else if (ctrltype == 2){
      ; Mouse Buttons
      if (hk == "LBUTTON") {
         outstr .= "LEFT MOUSE"
      } else if (hk == "RBUTTON") {
         outstr .= "RIGHT MOUSE"
      } else if (hk == "MBUTTON") {
         outstr .= "MIDDLE MOUSE"
      } else if (hk == "XBUTTON1") {
         outstr .= "MOUSE THUMB 1"
      } else if (hk == "XBUTTON2") {
         outstr .= "MOUSE THUMB 2"
      } else if (hk == "WHEELUP") {
         outstr .= "MOUSE WHEEL U"
      } else if (hk == "WHEELDOWN") {
         outstr .= "MOUSE WHEEL D"
      } else if (hk == "WHEELLEFT") {
         outstr .= "MOUSE WHEEL L"
      } else if (hk == "WHEELRIGHT") {
         outstr .= "MOUSE WHEEL R"
      }
   } else if (ctrltype == 3){
      ; Joystick Buttons
      pos := instr(hk,"JOY")
      id := substr(hk,1,pos-1)
      button := substr(hk,5)
      outstr .= "JOYSTICK " id " BTN " button
   } else {
      ; Keyboard Keys
      tmp := instr(hk,"NUMPAD")
      if (tmp){
         outstr .= "NUMPAD " substr(hk,7)
      } else {
         ; Replace underscores with spaces (In case of key name like MEDIA_PLAY_PAUSE)
         StringReplace, hk, hk, _ , %A_SPACE%, All
         outstr .= hk
      }
   }


   return outstr
}

; Detects Modifiers and Mouse Buttons in BindMode
#If BindMode
   ; Detect key down of modifier keys
   *lctrl::
   *rctrl::
   *lalt::
   *ralt::
   *lshift::
   *rshift::
   *lwin::
   *rwin::
      mod := substr(A_ThisHotkey,2)
      SetModifier(mod,1)
      return

   ; Detect key up of modifier keys
   *lctrl up::
   *rctrl up::
   *lalt up::
   *ralt up::
   *lshift up::
   *rshift up::
   *lwin up::
   *rwin up::
      ; Strip * from beginning, " up" from end etc
      mod := substr(substr(A_ThisHotkey,2),1,strlen(A_ThisHotkey) -4)
      if (CurrentModifierCount() == 1){
         ; If CurrentModifierCount is 1 when an up is received, then that is a Solitary Modifier
         ; It cannot be a modifier + normal key, as this code would have quit on keydown of normal key

         HKControlType := 1
         HKSecondaryInput := mod

         ; Send Escape - This will cause the Input command to quit with an EndKey of Escape
         ; But we stored the modifier key, so we will know it was not really escape
         Send {Escape}
      }
      SetModifier(mod,0)
      return

   ; Detect Mouse buttons
   lbutton::
   rbutton::
   mbutton::
   xbutton1::
   xbutton2::
   wheelup::
   wheeldown::
   wheelleft::
   wheelright::
      HKControlType := 2
      HKSecondaryInput := A_ThisHotkey
      Send {Escape}
      return
#If

; Adds / removes hotkeys to detect Joystick Buttons in BindMode
JoystickDetection(mode := 1)
{
   if (mode){
      mode := "ON"
   } else {
      mode := "OFF"
   }
   Loop , 16 {
      stickid := A_Index
      Loop, 32 {
         buttonid := A_Index
         hotkey, %stickid%Joy%buttonid%, JoystickPressed, %mode%
      }
   }
}

; A Joystick button was pressed while in Binding mode
JoystickPressed:
   HKControlType := 3
   HKSecondaryInput := A_ThisHotkey
   Send {Escape}
   return

; Sets the state of the HKModifierState object to reflect the state of the modifier keys
SetModifier(hk,state)
{
   global HKModifierState

   if (hk == "lctrl" || hk == "rctrl"){
      HKModifierState.ctrl := state
   } else if (hk == "lalt" || hk == "ralt"){
      HKModifierState.alt := state
   } else if (hk == "lshift" || hk == "rshift"){
      HKModifierState.shift := state
   } else if (hk == "lwin" || hk == "rwin"){
      HKModifierState.win := state
   }
   return
}

; Counts how many modifier keys are currently held
CurrentModifierCount()
{
   global HKModifierState

   return HKModifierState.ctrl + HKModifierState.alt + HKModifierState.shift  + HKModifierState.win
}

; Takes the start of the file name (before .ini or .exe and replaces it with .ini)
BuildIniName()
{
   tmp := A_Scriptname
   Stringsplit, tmp, tmp,.
   ini_name := ""
   last := ""
   Loop, % tmp0
   {
      ; build the string up to the last period (.)
      if (last != ""){
         if (ini_name != ""){
            ini_name := ini_name "."
         }
         ini_name := ini_name last
      }
      last := tmp%A_Index%
   }
   ;this.ini_name := ini_name ".ini"
   return ini_name ".ini"
}

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
