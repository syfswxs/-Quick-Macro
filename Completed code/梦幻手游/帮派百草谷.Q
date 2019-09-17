[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=ba67fa5f-cf66-4263-ad54-2dde02f058b9
Description=地府除虫
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Script]
Rem 除虫
FindColor 744,615,784,642,"B2D6F3",intX,intY
If intX > 0 And intY > 0 Then 
MoveTo intX, intY
LeftClick 1
Delay 1000
End If
Goto 除虫
