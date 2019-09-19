[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=122
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=e1002372-9f9d-4411-9483-89866917deed
Description=自动抓鬼
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
/*
	已写好判断队伍人数是否够4人，其他功能待完善
*/


PNumber = false //人数默认为不够
Sub 判断队伍人数
    //判断是否在战斗中
    FindColor 30,69,44,90,"8BD6FF",intX,intY
    If intX> 0 And intY> 0 Then//在战斗中
        MoveTo intX, intY
        LeftClick 1//点开菜单
        Delay 500
        Randomize //初始化随机数生成器。
        x = Int(((142-90)* Rnd) + 90) 
        y = Int(((264-207) * Rnd) + 207)
        MoveTo x, y
        Delay 100
        LeftClick 1//点击进入组队界面
        Delay 300
    Else //不在战斗中
        Randomize //初始化随机数生成器。
        x = Int(((1013-974)* Rnd) + 974) 
        y = Int(((175-135) * Rnd) + 135)
        MoveTo x, y
        Delay 100
        LeftClick 1//点击进入组队界面
        Delay 800
        LeftClick 1
        Delay 1000
    End If
    //判断有多少个人
    FindColor 589,232,669,278,"BAD3E8",intX,intY
    If intX> 0 And intY> 0 //如果第四个位置有助战信息，则人数不够4个
        Randomize //初始化随机数生成器。
        x = Int(((921-806)* Rnd) + 806) 
        y = Int(((217-175) * Rnd) + 175)
        MoveTo x, y
        Delay 100
        LeftClick 1//点击自动匹配
        Delay 300
        Rem 人数
        FindColor 589,232,669,278,"BAD3E8",intX,intY
        If intX > 0 And intY > 0 Then //如果第四个位置有助战信息，则人数不够4个
            Goto 人数
        Else 
            PNumber = true//人数够4个
            Randomize //初始化随机数生成器。
            x = Int(((943-912)* Rnd) + 912) 
            y = Int(((151-117) * Rnd) + 117)
            MoveTo x, y
            Delay 100
            LeftClick 1//点击退出组队界面
            Delay 300
        End If
    Else 
        PNumber = true//人数够4个
        Randomize //初始化随机数生成器。
        x = Int(((943-912)* Rnd) + 912) 
        y = Int(((151-117) * Rnd) + 117)
        MoveTo x, y
        Delay 100
        LeftClick 1//点击退出组队界面
        Delay 300
    End If
End Sub//给出PNumber的值 true为够4个人 false为不够人数
Sub 监测是否正常
    //判断是否在战斗中
    FindColor 30,69,44,90,"8BD6FF",intX,intY
    If intX> 0 And intY> 0 Then//在战斗中
        MoveTo intX, intY
        LeftClick 1//点开菜单
        Delay 500
        Randomize //初始化随机数生成器。
        x = Int(((142-90)* Rnd) + 90) 
        y = Int(((264-207) * Rnd) + 207)
        MoveTo x, y
        Delay 100
        LeftClick 1//点击进入组队界面
        Delay 300
    Else //不在战斗中
        Randomize //初始化随机数生成器。
        x = Int(((1013-974)* Rnd) + 974) 
        y = Int(((175-135) * Rnd) + 135)
        MoveTo x, y
        Delay 100
        LeftClick 1//点击进入组队界面
        Delay 800
        LeftClick 1
        Delay 1000
    End If
End Sub
Call 判断队伍人数
