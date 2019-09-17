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
MacroID=21a05d44-ef1d-4f3c-945a-8589faccc8cc
Description=钓鱼辅助
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
Rem 完美
FindColor 542,433,558,461,"097AFB",intX,intY
If intX > 0 And intY > 0 Then 
Randomize //初始化随机数生成器。
        x = Int(((556-491)* Rnd) + 491) 
        y = Int(((636-571) * Rnd) + 571)
        MoveTo x, y//移动至收杆
        LeftClick 1//点击
        Delay 5000
End If
Goto 完美
