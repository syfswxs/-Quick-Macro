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
MacroID=9a39bc53-04fe-4ca2-b9e0-0250f4aadf68
Description=一键完成帮派任务
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
Dim reallyend
reallyend = false
Sub 任务完成
    FindColor 446,460,576,501,"335C70",intX,intY
    If intX > 0 And intY > 0 Then //出现完成每周70帮派任务弹窗
        reallyend = true
    Else 
        reallyend = false
    End If
End Sub
Sub 是否战斗
    Rem 战斗
    FindColor 967,718,1007,755,"1B2F54",intX1,intY1
    FindColor 967,718,1007,755,"3866C0",intX,intY
    If intX > 0 or intX1 > 0 Then //在战斗中
        For 5
            Delay 1000
        Next
        Goto 战斗//
    Else //不在战斗中
        Delay 2000
    End If
End Sub
Sub 是否有弹窗
    FindColor 896,486,942,530,"0013C0",intX,intY
    FindColor 812,648,909,696,"63C2EE",intX1,intY1
    If intX > 0 And intY1 > 0 Then //监测出宣读公告
        Randomize 
        x = Int(((896-822)* Rnd) + 822) 
        y = Int(((691-654) * Rnd) + 654)
        MoveTo x, y//点击宣读
        Delay 100
        LeftClick 1
        Delay 5000
        Goto 结束弹窗
    End If
    FindColor 612,63,859,185,"292FE0",intX,intY
    FindColor 936,317,1003,416,"A4FFFF",intX1,intY1
    If intX > 0 And intY1 > 0 Then //监测出摆摊
        Randomize 
        x = Int(((889-790)* Rnd) + 790) 
        y = Int(((697-656) * Rnd) + 656)
        MoveTo x, y//点击购买
        Delay 100
        LeftClick 1
        Delay 3000
        Rem 购买
        FindColor 612,63,859,185,"292FE0",intX,intY
        FindColor 936,317,1003,416,"A4FFFF",intX1,intY1
        If intX > 0 And intY1 > 0 Then //摆摊界面还在则说明买的货下架了
            Randomize 
            x = Int(((576-344)* Rnd) + 344) 
            y = Int(((312-252) * Rnd) + 252)
            MoveTo x, y//点击选中物品
            Delay 100
            LeftClick 1
            Delay 800
            Randomize 
            x = Int(((889-790)* Rnd) + 790) 
            y = Int(((697-656) * Rnd) + 656)
            MoveTo x, y//点击购买
            Delay 100
            LeftClick 1
            Delay 3000
            Goto 购买
        End If
        Goto 结束弹窗
    End If
    FindColor 592,78,866,203,"2930E1",intX,intY
    FindColor 458,110,550,158,"7BE5FC",intX1,intY1
    If intX > 0 And intX1 > 0 Then //监测出商会
        Randomize 
        x = Int(((891-799)* Rnd) + 799) 
        y = Int(((693-657) * Rnd) + 657)
        MoveTo x, y//点击购买
        Delay 100
        LeftClick 1
        Delay 3000
        Goto 结束弹窗
    End If
    FindColor 798,121,924,147,"4288D4",intX1,intY1
    FindColor 349,104,730,152,"FFFFFF",intX,intY
    If intX > 0 And intX1 > 0 Then ////监测出药店
        Randomize 
        x = Int(((853-763)* Rnd) + 763) 
        y = Int(((632-598) * Rnd) + 598)
        MoveTo x, y//点击购买
        Delay 100
        LeftClick 1
        Delay 3000
        Goto 结束弹窗
    End If
    FindColor 77,749,281,783,"ACD5F8",intX,intY
    If intX > 0 And intY > 0 Then //监测出有对话
        //是否出现对话选项
        FindColor 690,98,1024,669,"B8D8F3",intX,intY
        If intX > 0 And intY > 0 Then //有对话选项
            MoveTo intX - 50, intY + 5
            LeftClick 1//点击第一项
            Delay 800
            //是否出现上交弹窗
            FindColor 711,187,938,235,"9BC9E8",intX,intY
            FindColor 762,590,887,639,"63C3EF",intX1,intY1
            If intX > 0 And intY1 > 0 Then //出现上交弹窗
                Randomize 
                x = Int(((877-774)* Rnd) + 774) 
                y = Int(((634-596) * Rnd) + 596)
                MoveTo x, y//点击上交
                Delay 100
                LeftClick 1
                Delay 800
            End If
            Delay 3000
            Goto 结束弹窗
        Else //没有对话选项
            Rem 再次点击
            Randomize 
            x = Int(((967-847)* Rnd) + 847) 
            y = Int(((251-207) * Rnd) + 207)
            MoveTo x, y//点击任务栏第一项自动寻路
            Delay 100
            LeftClick 1
            Delay 800
            FindColor 77,749,281,783,"ACD5F8",intX,intY
            If intX > 0 And intY > 0 Then //监测出有对话
                Goto 再次点击
            Else //没有对话框
            End If
            Randomize 
            x = Int(((967-847)* Rnd) + 847) 
            y = Int(((251-207) * Rnd) + 207)
            MoveTo x, y//再次点击任务栏第一项自动寻路
            Delay 100
            LeftClick 1
            Delay 800
            Goto 结束弹窗
        End If
    Else//不是对话框
    End If
    Rem 结束弹窗
End Sub
Sub 开始
    Rem 重复
    If reallyend = true Then 
        Goto 结束
    End If
    是否战斗 
    是否有弹窗 
    Goto 重复
    Rem 结束
End Sub
Call 开始
