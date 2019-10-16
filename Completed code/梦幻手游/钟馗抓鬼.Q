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
MacroID=8633ce9f-5341-47bd-b758-57e5b7d5c7aa
Description=自动抓鬼
Enable=1
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
Dim Obj, sc,jrw，zdgj，shuang
Set Obj = createobject("WScript.Shell")
shuang = true//双默认存在
zdgj = false//自动关机默认为否
jrw =false//接任务默认为false
sc = true//刹车默认为真
Sub 是否战斗
    Rem 战斗监测
    FindColor 967,718,1007,755,"1B2F54",intX1,intY1
    FindColor 967,718,1007,755,"3866C0",intX,intY
    If intX > 0 or intX1 > 0 Then //是
        sc = false
        Goto 战斗监测
    Else //否
        Delay 2000
        //是否抓完一轮
        For 10
            FindColor 528,438,697,522,"60BEED",intX,intY
            If intX > 0 And intY > 0 Then //是
                sc = true
                MoveTo 418,485
                Delay 500
                LeftClick 1//点击取消
                Delay 500
                刹车
                Rem 进入挂机界面
                Randomize //初始化随机数生成器。
                x = Int(((473-436)* Rnd) + 436) 
                y = Int(((87-46) * Rnd) + 46)
                MoveTo x, y
                Delay 100
                LeftClick 1//点击进入挂机界面
                Delay 1000
                FindColor 804,633,906,701,"69CAF2",intX,intY
                If intX > 0 And intY > 0 Then //如果进入了挂机界面
                    //双是否还在
                    FindColor 554,642,636,687,"0A316C",intX,intY
                    If intX > 0 And intY > 0 Then //是
                        Randomize //初始化随机数生成器。
                        x = Int(((971-936)* Rnd) + 936) 
                        y = Int(((156-121) * Rnd) + 121)
                        MoveTo x, y
                        Delay 100
                        LeftClick 1//点击关闭挂机界面
                        Delay 1000
                        检查队伍状况 
                    Else //否
                        shuang = false
                        //结束脚本
                        Goto 脚本结束
                    End If
                Else //没有进入
                    FindColor 967,718,1007,755,"1B2F54",intX1,intY1
                    FindColor 967,718,1007,755,"3866C0",intX,intY
                    If intX > 0 or intX1 > 0 Then //如果监测过程中进入了战斗
                        sc = false
                        Goto 战斗监测
                    End If
                    Goto 进入挂机界面
                End If
            Else //否
                FindColor 967,718,1007,755,"1B2F54",intX1,intY1
                FindColor 967,718,1007,755,"3866C0",intX,intY
                If intX > 0 or intX1 > 0 Then //如果监测过程中进入了战斗
                    sc = false
                    Goto 战斗监测
                End If
                检查队伍状况
            End If
        Next
        FindColor 967,718,1007,755,"1B2F54",intX1,intY1
        FindColor 967,718,1007,755,"3866C0",intX,intY
        If intX > 0 or intX1 > 0 Then //如果监测过程中进入了战斗
            sc = false
            Goto 战斗监测
        End If
        检查队伍状况
    End If
    goto 战斗监测
    rem 脚本结束
End Sub
Sub 检查队伍状况
    Dim intq, intw, intq1, intw1, s//判断队伍情况坐标
    s = 0
    intq=810
    intw=250
    intq1=858
    intw1=304
    //右边信息栏是否打开
    Rem 信息栏
    FindColor 967,718,1007,755,"1B2F54",intX1,intY1
    FindColor 967,718,1007,755,"3866C0",intX,intY
    If intX > 0 or intX1 > 0 Then //如果监测过程中进入了战斗
        sc = false
        Goto 结束检查队伍状况
    End If
    FindColor 750,130,792,180,"8FDBFF",intX,intY
    If intX > 0 And intY > 0 Then //是
        //是否显示队伍信息
        Rem 队伍信息显示
        FindColor 967,718,1007,755,"1B2F54",intX1,intY1
        FindColor 967,718,1007,755,"3866C0",intX,intY
        If intX > 0 or intX1 > 0 Then //如果监测过程中进入了战斗
            sc = false
            Goto 结束检查队伍状况
        End If
        FindColor 811,134,854,175,"ADE6D0",intX,intY
        If intX > 0 And intY > 0 Then //否
            //点击切换到队伍
            Randomize //初始化随机数生成器。
            x = Int(((1009-933)* Rnd) + 933) 
            y = Int(((174-139) * Rnd) + 139)
            MoveTo x, y
            Delay 100
            LeftClick 1
            Delay 800
            Goto 队伍信息显示
        Else //是
            //队伍是否出现暂离、离线
            Rem 异常
            FindColor 967,718,1007,755,"1B2F54",intX1,intY1
            FindColor 967,718,1007,755,"3866C0",intX,intY
            If intX > 0 or intX1 > 0 Then //如果监测过程中进入了战斗
                sc = false
                Goto 结束检查队伍状况
            End If
            //是否出现暂离、离线
            FindColor intq, intw, intq1, intw1,"4ED3FF",intX,intY//暂离
            FindColor intq, intw, intq1, intw1,"F5F5F6",intX1,intY1//离线
            If intX > 0 or intX1 > 0 Then //是
                刹车
                踢人 
            Else //否
                s = s + 1
                If s > 3 Then 
                    Goto 没异常
                End If
                intw = intw + 58
                intw1 = intw1 + 58
                Goto 异常
            End If
            rem 没异常
            //是否满5个人
            FindColor 859,418,1020,484,"1E43E1",intX,intY
            If intX > 0 And intY > 0 Then //是
                //是否刹车状态
                If sc = true Then //是
                    任务 
                Else //否
                    战斗等待 
                End If
            Else //否
                //是否有4个玩家
                FindColor 967,718,1007,755,"1B2F54",intX1,intY1
                FindColor 967,718,1007,755,"3866C0",intX,intY
                If intX > 0 or intX1 > 0 Then //如果监测过程中进入了战斗
                    sc = false
                    Goto 结束检查队伍状况
                End If
                FindColor 883,371,998,422,"1E43E1",intX,intY
                If intX > 0 And intY > 0 Then //是	
                    //右侧信息栏是否打开
                    Rem 信息栏是否打开
                    FindColor 967,718,1007,755,"1B2F54",intX1,intY1
                    FindColor 967,718,1007,755,"3866C0",intX,intY
                    If intX > 0 or intX1 > 0 Then //如果监测过程中进入了战斗
                        sc = false
                        Goto 结束检查队伍状况
                    End If
                    FindColor 750,130,792,180,"8FDBFF",intX,intY
                    If intX > 0 And intY > 0 Then //是
                        //是否显示队伍信息
                        Rem 队伍信息
                        FindColor 967,718,1007,755,"1B2F54",intX1,intY1
                        FindColor 967,718,1007,755,"3866C0",intX,intY
                        If intX > 0 or intX1 > 0 Then //如果监测过程中进入了战斗
                            sc = false
                            Goto 结束检查队伍状况
                        End If
                        FindColor 811,134,854,175,"ADE6D0",intX,intY
                        If intX > 0 And intY > 0 Then //否
                            //点击显示队伍信息
                            Randomize //初始化随机数生成器。
                            x = Int(((1009-933)* Rnd) + 933) 
                            y = Int(((174-139) * Rnd) + 139)
                            MoveTo x, y
                            Delay 100
                            LeftClick 1
                            Delay 800
                            Goto 队伍信息
                        Else //是
                            FindColor 967,718,1007,755,"1B2F54",intX1,intY1
                            FindColor 967,718,1007,755,"3866C0",intX,intY
                            If intX > 0 or intX1 > 0 Then //如果监测过程中进入了战斗
                                sc = false
                                Goto 结束检查队伍状况
                            End If
                            //点击进入队伍界面
                            Randomize //初始化随机数生成器。
                            x = Int(((1009-933)* Rnd) + 933) 
                            y = Int(((174-139) * Rnd) + 139)
                            MoveTo x, y
                            Delay 100
                            LeftClick 1
                            Delay 800
                            //点击进入队伍编辑界面
                            Randomize //初始化随机数生成器。
                            x = Int(((715-684)* Rnd) + 684) 
                            y = Int(((208-180) * Rnd) + 180)
                            MoveTo x, y
                            Delay 100
                            LeftClick 1
                            Delay 800
                            //点击确定触发自动匹配
                            Randomize //初始化随机数生成器。
                            x = Int(((687-596)* Rnd) + 596) 
                            y = Int(((699-661) * Rnd) + 661)
                            MoveTo x, y
                            Delay 100
                            LeftClick 1
                            Delay 800
                            //点击关闭队伍信息界面
                            Randomize //初始化随机数生成器。
                            x = Int(((947-908)* Rnd) + 908) 
                            y = Int(((151-116) * Rnd) + 116)
                            MoveTo x, y
                            Delay 100
                            LeftClick 1
                            Delay 800
                            任务
                        End If
                    Else //否
                        //点击展开右边信息栏
                        FindColor 967,718,1007,755,"1B2F54",intX1,intY1
                        FindColor 967,718,1007,755,"3866C0",intX,intY
                        If intX > 0 or intX1 > 0 Then //如果监测过程中进入了战斗
                            sc = false
                            Goto 结束检查队伍状况
                        End If
                        Randomize //初始化随机数生成器。
                        x = Int(((1013-980)* Rnd) + 980) 
                        y = Int(((175-144) * Rnd) + 144)
                        MoveTo x, y
                        Delay 100
                        LeftClick 1
                        Delay 800
                        Goto 信息栏是否打开
                    End if
                Else //否
                    FindColor 967,718,1007,755,"1B2F54",intX1,intY1
                    FindColor 967,718,1007,755,"3866C0",intX,intY
                    If intX > 0 or intX1 > 0 Then //如果监测过程中进入了战斗
                        sc = false
                        Goto 结束检查队伍状况
                    End If
                    刹车 
                    //右侧信息栏是否打开
                    Rem 右侧信息栏是否打开
                    FindColor 967,718,1007,755,"1B2F54",intX1,intY1
                    FindColor 967,718,1007,755,"3866C0",intX,intY
                    If intX > 0 or intX1 > 0 Then //如果监测过程中进入了战斗
                        sc = false
                        Goto 结束检查队伍状况
                    End If
                    FindColor 750,130,792,180,"8FDBFF",intX,intY
                    If intX > 0 And intY > 0 Then //是
                        //是否显示队伍信息
                        Rem 队伍信息如何
                        FindColor 811,134,854,175,"ADE6D0",intX,intY
                        If intX > 0 And intY > 0 Then //否
                            //点击显示队伍信息
                            Randomize //初始化随机数生成器。
                            x = Int(((1009-933)* Rnd) + 933) 
                            y = Int(((174-139) * Rnd) + 139)
                            MoveTo x, y
                            Delay 100
                            LeftClick 1
                            Delay 800
                            Goto 队伍信息如何
                        Else //是
                            FindColor 967,718,1007,755,"1B2F54",intX1,intY1
                            FindColor 967,718,1007,755,"3866C0",intX,intY
                            If intX > 0 or intX1 > 0 Then //如果监测过程中进入了战斗
                                sc = false
                                Goto 结束检查队伍状况
                            End If
                            //点击进入队伍界面
                            Randomize //初始化随机数生成器。
                            x = Int(((1009-933)* Rnd) + 933) 
                            y = Int(((174-139) * Rnd) + 139)
                            MoveTo x, y
                            Delay 100
                            LeftClick 1
                            Delay 800
                            //点击进入队伍编辑界面
                            Randomize //初始化随机数生成器。
                            x = Int(((715-684)* Rnd) + 684) 
                            y = Int(((208-180) * Rnd) + 180)
                            MoveTo x, y
                            Delay 100
                            LeftClick 1
                            Delay 800
                            //点击确定触发自动匹配
                            Randomize //初始化随机数生成器。
                            x = Int(((687-596)* Rnd) + 596) 
                            y = Int(((699-661) * Rnd) + 661)
                            MoveTo x, y
                            Delay 100
                            LeftClick 1
                            Delay 800
                            //判断队伍界面是否满4个人
                            Rem 是否满4人
                            FindColor 589,232,669,278,"BAD3E8",intX,intY
                            If intX > 0 And intY > 0 Then //否,不满4人
                                //如果一件喊话菜单展开
                                FindColor 766,563,916,631,"D3E3F0",intX,intY
                                If intX > 0 And intY > 0 Then //是
                                    Goto 等待
                                End If
                                //点击一键喊话
                                Randomize //初始化随机数生成器。
                                x = Int(((915-779)* Rnd) + 779) 
                                y = Int(((700-660) * Rnd) + 660)
                                MoveTo x, y
                                Delay 100
                                LeftClick 1
                                Delay 800
                                Rem 等待
                                //点击组队频道
                                Randomize //初始化随机数生成器。
                                x = Int(((902-785)* Rnd) + 785) 
                                y = Int(((615-571) * Rnd) + 571)
                                MoveTo x, y
                                Delay 100
                                LeftClick 1
                                Delay 800
                                //是否已经喊过
                                FindColor 766,563,916,631,"D3E3F0",intX,intY
                                If intX > 0 And intY > 0 Then //是
                                    Goto 是否满4人
                                End If
                                //点击一键喊话
                                Randomize //初始化随机数生成器。
                                x = Int(((915-779)* Rnd) + 779) 
                                y = Int(((700-660) * Rnd) + 660)
                                MoveTo x, y
                                Delay 100
                                LeftClick 1
                                Delay 800
                                //点击当前频道
                                Randomize //初始化随机数生成器。
                                x = Int(((897-786)* Rnd) + 786) 
                                y = Int(((475-429) * Rnd) + 429)
                                MoveTo x, y
                                Delay 100
                                LeftClick 1
                                Delay 800
                                Goto 是否满4人
                            Else //是
                                Delay 800
                                Rem 关闭队伍界面
                                //点击关闭队伍信息界面
                                Randomize//初始化随机数生成器。
                                x = Int(((947-908)* Rnd) + 908) 
                                y = Int(((151-116) * Rnd) + 116)
                                MoveTo x, y
                                Delay 100
                                LeftClick 1
                                Delay 800
                                FindColor 749,644,940,713,"59BBEE",intX,intY
                                If intX > 0 And intY > 0 Then //如果队伍界面还在
                                    Goto 关闭队伍界面
                                End If
                                任务
                            End If
                        End If
                    Else //否
                        FindColor 967,718,1007,755,"1B2F54",intX1,intY1
                        FindColor 967,718,1007,755,"3866C0",intX,intY
                        If intX > 0 or intX1 > 0 Then //如果监测过程中进入了战斗
                            sc = false
                            Goto 结束检查队伍状况
                        End If
                        //点击展开右边信息栏
                        Randomize //初始化随机数生成器。
                        x = Int(((1013-980)* Rnd) + 980) 
                        y = Int(((175-144) * Rnd) + 144)
                        MoveTo x, y
                        Delay 100
                        LeftClick 1
                        Delay 800 
                        Goto 右侧信息栏是否打开
                    End if
                end if
            end if
        End If
    Else//否 
        //点击展开右边信息栏
        Randomize //初始化随机数生成器。
        x = Int(((1013-980)* Rnd) + 980) 
        y = Int(((175-144) * Rnd) + 144)
        MoveTo x, y
        Delay 100
        LeftClick 1
        Delay 800 
        Goto 信息栏
    End If
    Rem 结束检查队伍状况
End Sub
Sub 刹车
    FindColor 967,718,1007,755,"1B2F54",intX1,intY1
    FindColor 967,718,1007,755,"3866C0",intX,intY
    If intX > 0 or intX1 > 0 Then //如果监测过程中进入了战斗
        sc = false
        Goto 结束刹车
    End If
    MoveTo 968,614
    Delay 100
    LeftClick 1//随机点击地上一点，阻止进入战斗
    Delay 300
    //打开地图
    Randomize //初始化随机数生成器。
    x = Int(((61-11)* Rnd) + 11) 
    y = Int(((93-45) * Rnd) + 45)
    MoveTo x, y
    Delay 100
    LeftClick 1//点击地图
    Delay 800
    FindColor 967,718,1007,755,"1B2F54",intX1,intY1
    FindColor 967,718,1007,755,"3866C0",intX,intY
    If intX > 0 or intX1 > 0 Then //如果监测过程中进入了战斗
        sc = false
        Goto 结束刹车
    End If
    Randomize //初始化随机数生成器。
    x = Int(((513-443)* Rnd) + 443) 
    y = Int(((496-440) * Rnd) + 440)
    MoveTo x, y
    Delay 100
    LeftClick 1//点击长安
    Delay 1000
    sc = true
    Rem 结束刹车
End Sub//让人物在长安站着不动
Sub 任务
    //右边信息栏是否打开
    Rem rw信息栏
    FindColor 967,718,1007,755,"1B2F54",intX1,intY1
    FindColor 967,718,1007,755,"3866C0",intX,intY
    If intX > 0 or intX1 > 0 Then //如果监测过程中进入了战斗
        sc = false
        Goto 结束检查任务
    End If
    FindColor 750,130,792,180,"8FDBFF",intX,intY
    If intX > 0 And intY > 0 Then //是
        //是否显示任务信息
        Rem rw任务信息
        FindColor 967,718,1007,755,"1B2F54",intX1,intY1
        FindColor 967,718,1007,755,"3866C0",intX,intY
        If intX > 0 or intX1 > 0 Then //如果监测过程中进入了战斗
            sc = false
            Goto 结束检查任务
        End If
        FindColor 811,134,854,175,"ADE6D0",intX,intY
        If intX > 0 And intY > 0 Then //是
            //点进任务界面
            Randomize //初始化随机数生成器。
            x = Int(((894-819)* Rnd) + 819) 
            y = Int(((171-136) * Rnd) + 136)
            MoveTo x, y
            Delay 100
            LeftClick 1
            Delay 800
            //是否显示当前任务
            FindColor 943,203,986,278,"6795C5",intX,intY
            If intX > 0 And intY > 0 Then //否
                Randomize //初始化随机数生成器。
                x = Int(((986-943)* Rnd) + 943) 
                y = Int(((278-203) * Rnd) + 203)
                MoveTo x, y//点击当前任务
                Delay 500 //延时1秒
                LeftClick 1//点击
                Goto 显示当前任务
            Else //显示当前任务
                Rem 显示当前任务
                点击任务栏 
                If jrw = true Then 
                    Goto rw信息栏
                End If
            End If
        Else //否
            FindColor 967,718,1007,755,"1B2F54",intX1,intY1
            FindColor 967,718,1007,755,"3866C0",intX,intY
            If intX > 0 or intX1 > 0 Then //如果监测过程中进入了战斗
                sc = false
                Goto 结束检查任务
            End If
            //点击显示任务信息
            Randomize //初始化随机数生成器。
            x = Int(((894-819)* Rnd) + 819) 
            y = Int(((171-136) * Rnd) + 136)
            MoveTo x, y
            Delay 100
            LeftClick 1
            Delay 800
            Goto rw任务信息
        End If
    Else //否
        MoveTo 989, 164
        Delay 100
        LeftClick 1//点击展开右侧信息栏
        Delay 800
        Goto rw信息栏
    End If
    Rem 结束检查任务
End Sub
Sub 战斗等待
    For 30//延迟30秒，在等待的过程中判断是否进入战斗
        FindColor 967,718,1007,755,"1B2F54",intX1,intY1
        FindColor 967,718,1007,755,"3866C0",intX,intY
        If intX > 0 or intX1 > 0 Then //如果进入了战斗
            Goto 等待结束
        End If
        FindColor 528,438,697,522,"60BEED",intX,intY
        If intX > 0 And intY > 0 Then //如果出现了人数不足弹窗
            //点击确定补人
            MoveTo 418,485
            Delay 500 
            LeftClick 1//点击取消
            Delay 300
            刹车 
            检查队伍状况
        End If
        Delay 1000
    Next
    Rem 等待结束
End Sub
Sub 点击任务栏
    Dim intQ1, intW1, intQ2, intW2//判断是否有内容坐标
    Dim intE,intR,intE1,intR1//判断是否可展开图标
    intQ1 = 78
    intW1 = 199
    intQ2 = 287
    intW2 = 247
    intE = 238
    intR = 200
    intE1 = 286
    intR1 = 247
    //第一栏处是否有内容
    FindColor intQ1,intW1,intQ2,intW2,"0A316C",intX,intY
    If intX > 0 And intY > 0 Then //是
        //是否能展开
        FindColor intE,intR,intE1,intR1, "2566B5", intX, intY//是，没展开
        FindColor intE,intR,intE1,intR1,"1F5AA0",intX1,intY1//是，展开
        If intX > 0 or intY1 > 0 Then //是
            //是否已经展开
            FindColor 240,197,286,245,"235FA7",intX,intY
            If intX > 0 And intY > 0 Then //是
                goto 新的判断
            Else //否
                //点击展开
                MoveTo intE, intR
                LeftClick 1
                Delay 500
                Goto 新的判断
            End If
        Else //否
            Rem 分析任务
            MoveTo intQ1+65, intW1+20
            LeftClick 1//点击该选项
            Delay 500
            //是否是抓鬼任务
            FindColor 323,234,939,310,"06AF08",intX,intY
            If intX > 0 And intY > 0 Then //如果找绿色的字
                FindColor 315,338,924,630,"06AF08",intX3,intY3
                FindColor 336,375,888,619,"293F5B",intX1,intY1//找到此颜色，不是抓鬼任务
                FindColor 632,314,901,416, "293F5B", intX2, intY2//找到此颜色，不是抓鬼任务
                If intX1 > 0 or intX2 > 0 or intX3>0 Then //不是抓鬼任务
                    Goto 新的判断
                Else //是抓鬼任务
                    Randomize //初始化随机数生成器。
                    x = Int(((863-748)* Rnd) + 748) 
                    y = Int(((677-647) * Rnd) + 647)
                    MoveTo x, y
                    Delay 500 
                    LeftClick 1//点击马上传送
                    Delay 1000
                    MoveTo 923, 138
                    LeftClick 1//点击关闭任务界面
                    Delay 300
                    sc = false
                    jrw = false
                    战斗等待
                End If
            Else //否
                Rem 新的判断
                //intQ1,intW1下方的选项是否有内容
                intW1 = intW1 + 75
                intW2 = intW2 + 75
                FindColor intQ1,intW1,intQ2,intW2,"0A316C",intX,intY
                If intX > 0 And intY > 0 Then //是
                    //是否能展开
                    intR = intR + 75
                    intR1 = intR1 + 75
                    FindColor intE,intR,intE1,intR1, "2566B5", intX, intY//是，没展开
                    FindColor intE,intR,intE1,intR1,"1F5AA0",intX1,intY1//是，展开
                    If intX > 0 or intY1 > 0 Then //是
                        //是否已经展开
                        FindColor intE,intR,intE1,intR1,"235FA7",intX,intY
                        If intX > 0 And intY > 0 Then //是
                            goto 新的判断
                        Else //否
                            //点击展开
                            MoveTo intE, intR
                            LeftClick 1
                            Delay 500
                            Goto 新的判断
                        End If
                    Else //否
                        Goto 分析任务
                    End if
                Else//否
                    Goto 去接任务
                End if
            End if
        End If
    Else //否
        Rem 去接任务
        MoveTo 924, 138
        Delay 500 
        LeftClick 1//点击关闭任务界面
        Delay 1000
        接任务
    End If
End Sub
Sub 接任务
    sc = true
    Rem 找钟馗
    Randomize //初始化随机数生成器。
    x = Int(((59-9)* Rnd) + 9) 
    y = Int(((89-46) * Rnd) + 46)
    MoveTo x, y
    Delay 100
    LeftClick 1//点击地图
    Delay 800
    Randomize //初始化随机数生成器。
    x = Int(((508-450)* Rnd) + 450) 
    y = Int(((497-447) * Rnd) + 447)
    MoveTo x, y
    Delay 100
    LeftClick 1//点击长安
    Delay 2000
    Randomize //初始化随机数生成器。
    x = Int(((190-86)* Rnd) + 86) 
    y = Int(((98-53) * Rnd) + 53)
    MoveTo x, y
    Delay 100
    LeftClick 1//点击小地图
    Delay 800
    Randomize //初始化随机数生成器。
    x = Int(((329-301)* Rnd) + 301) 
    y = Int(((480-463) * Rnd) + 463)
    MoveTo x, y
    Delay 100
    LeftClick 1//点击钟馗
    Delay 5000
    //是否弹出对话框
    FindColor 139,542,213,595,"1133FF",intX,intY
    If intX > 0 And intY > 0 Then //是
        Randomize //初始化随机数生成器。
        x = Int(((920-777)* Rnd) + 777) 
        y = Int(((415-379) * Rnd) + 379)
        MoveTo x, y
        Delay 100
        LeftClick 1//点击对话中的抓鬼任务
        Delay 800
        jru = true
        FindColor 411,353,516,403,"0015E0",intX,intY
        If intX > 0 And intY > 0 Then //如果提示人数不足5个是否自动匹配
            Randomize //初始化随机数生成器。
            x = Int(((457-381)* Rnd) + 381) 
            y = Int(((500-460) * Rnd) + 460)
            MoveTo x, y
            Delay 100
            LeftClick 1//点击取消
            Delay 500
            MoveTo 530, 400
            RightClick 1//右键单击取消对话
            Delay 500
        End If
        MoveTo 530, 400
        RightClick 1//右键单击取消对话
        Delay 800
        jrw = true
        任务
    Else //否
        Goto 找钟馗
    End if
End Sub
Sub 踢人
    //右边信息栏是否打开
    Rem 踢人
    Dim intN, intM, intN1, intM1
    intN = 291
    intM = 467
    intN1 = 369
    intM1 = 506
    FindColor 750,130,792,180,"8FDBFF",intX,intY
    If intX > 0 And intY > 0 Then //是
        //是否显示队伍信息
        Rem dw队伍
        FindColor 811,134,854,175,"ADE6D0",intX,intY
        If intX > 0 And intY > 0 Then //否
            //点进队伍界面
            Randomize //初始化随机数生成器。
            x = Int(((1009-933)* Rnd) + 933) 
            y = Int(((174-139) * Rnd) + 139)
            MoveTo x, y
            Delay 100
            LeftClick 1
            Delay 800
            goto dw队伍
        Else //是
            //点进队伍界面
            Randomize //初始化随机数生成器。
            x = Int(((1009-933)* Rnd) + 933) 
            y = Int(((174-139) * Rnd) + 139)
            MoveTo x, y
            Delay 100
            LeftClick 1
            Delay 800
            Rem 继续踢人
            //p2是否有暂离、离线
            FindColor intN, intM, intN1, intM1,"68645F",intX,intY
            If intX > 0 And intY > 0 Then //是
                MoveTo intX, intY
                LeftClick 1
                Delay 500
                MoveTo 617,411
                Delay 100
                LeftClick 1//点击请离p2
                Delay 500
                Goto 继续踢人
            Else //否
                //p3是否有暂离、离线
                intN = intN + 171
                intN1 = intN1 + 171
                FindColor intN, intM, intN1, intM1,"68655F",intX,intY
                If intX > 0 And intY > 0 Then //是
                    MoveTo intX, intY
                    LeftClick 1
                    Delay 500
                    MoveTo 780,412
                    Delay 100
                    LeftClick 1//点击请离p3
                    Delay 500
                    Goto 继续踢人
                Else //否
                    //p4是否有暂离、离线
                    intN = intN + 171
                    intN1 = intN1 + 171
                    FindColor intN, intM, intN1, intM1,"68655F",intX,intY
                    If intX > 0 And intY > 0 Then //是
                        MoveTo intX, intY
                        LeftClick 1
                        Delay 500
                        MoveTo 499,403
                        Delay 100
                        LeftClick 1//点击请离p4
                        Delay 500
                        Goto 继续踢人
                    Else //否
                        //p5是否有暂离、离线
                        intN = intN + 171
                        intN1 = intN1 + 171
                        FindColor intN, intM, intN1, intM1,"68655F",intX,intY
                        If intX > 0 And intY > 0 Then //是
                            MoveTo intX, intY
                            LeftClick 1
                            Delay 500
                            MoveTo 672,409
                            Delay 100
                            LeftClick 1
                            Delay 800//点击请离p5
                            Delay 500
                            Goto 继续踢人
                        Else 
                            //关闭队伍界面
                            MoveTo 923,136
                            LeftClick 1
                            Delay 500
                        End If
                    End If
                End If
            End If
        End if
    Else //否
        Randomize //初始化随机数生成器。
        x = Int(((1013-980)* Rnd) + 980) 
        y = Int(((175-144) * Rnd) + 144)
        MoveTo x, y
        Delay 100
        LeftClick 1
        Delay 800 
        Goto 踢人
    End If
End Sub
Sub 自动关机
    YN = Obj.Popup("双用完后是否自动关机？", 0, "自动抓鬼", 4)
    If YN = 6 Then //如果点击是
        zdgj = true
    Else //如果点否
        zdgj = false
    End If 
End Sub
Sub 开始
    YN = Obj.Popup("注意：双必须是4的倍数，不然会无限抓鬼"&chr (13) &"         助战第一位放孙悟空"&chr (13) &"         队伍设置好行动目标为抓鬼任务以便自动匹配玩家"&chr (13) &"[是]：已设置好，继续"&chr (13) &"[否]：退出程序", 0, "自动抓鬼", 4)
    If YN = 6 Then //如果点击否
    Else
        Goto 结束
    End If
    自动关机 
    Rem 监测
    是否战斗 
    If shaung = false Then 
        Goto 结束
    End If
    Goto 监测
    Rem 结束
    If zdgj = true and shuang = false Then //如果自动关机为真，双不存在，则自动关机
        Call Obj.Popup("5秒后自动关机",5,"自动抓鬼",48)
        Obj.Run "shutdown /f /s /t 0"
        //调用shutdown命令。 /f--强行关闭应用程序而不提醒， /s--关闭计算机（要重启的话，请把这改成/r[重启计算机]），/t time--在time秒后前闭计算机。
    End If
End Sub
Sub test
    FindColor 528,438,697,522,"60BEED",intX,intY
    If intX > 0 And intY > 0 Then 
        MoveTo intX,intY
    End If
End Sub
Call 开始
