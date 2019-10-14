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
            FindColor 546,442,668,490,"62C1EE",intX,intY
            If intX > 0 And intY > 0 Then //是
                sc = true 
                MoveTo intX, intY
                LeftClick 1//点击继续抓鬼
                Delay 3000
                MoveTo 547, 362
                RightClick 1
                Delay 2000
                Randomize //初始化随机数生成器。
                x = Int(((473-436)* Rnd) + 436) 
                y = Int(((87-46) * Rnd) + 46)
                MoveTo x, y
                Delay 100
                LeftClick 1//点击进入挂机界面
                Delay 1000
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
            FindColor 802,242,868,309,"4ED3FF",intX,intY
            If intX > 0 And intY > 0 Then //p2暂离
                刹车
                请离p2 
                Goto 异常
            End If
            FindColor 804,244,865,304,"F5F5F6",intX,intY
            If intX > 0 And intY > 0 Then //p2离线
                刹车
                请离p2 
                Goto 异常
            End If
            FindColor 804,302,865,362,"4ED3FF",intX,intY
            If intX > 0 And intY > 0 Then //p3暂离
                刹车
                请离p3 
                Goto 异常
            End If
            FindColor 802,303,863,362,"F5F5F6",intX,intY
            If intX > 0 And intY > 0 Then //p3离线
                刹车
                请离p3 
                Goto 异常
            End If
            FindColor 803,362,865,420,"4ED3FF",intX,intY
            If intX > 0 And intY > 0 Then //p4暂离
                刹车
                请离p4 
                Goto 异常
            End If
            FindColor 804,359,865,423,"F5F5F6",intX,intY
            If intX > 0 And intY > 0 Then //p4离线
                刹车
                请离p4 
                Goto 异常
            End If
            FindColor 799,415,867,489,"4ED3FF",intX,intY
            If intX > 0 And intY > 0 Then //p5暂离
                刹车
                请离p5 
                Goto 异常
            End If
            FindColor 800,415,867,488,"F5F5F6",intX,intY
            If intX > 0 And intY > 0 Then //p5离线
                刹车
                请离p5 
                Goto 异常
            End If
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
                            x = Int(((944-910)* Rnd) + 910) 
                            y = Int(((151-118) * Rnd) + 118)
                            MoveTo x, y
                            Delay 100
                            LeftClick 1
                            Delay 800
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
                                //点击一键喊话
                                Randomize //初始化随机数生成器。
                                x = Int(((915-779)* Rnd) + 779) 
                                y = Int(((700-660) * Rnd) + 660)
                                MoveTo x, y
                                Delay 100
                                LeftClick 1
                                Delay 800
                                //点击组队频道
                                Randomize //初始化随机数生成器。
                                x = Int(((902-785)* Rnd) + 785) 
                                y = Int(((615-571) * Rnd) + 571)
                                MoveTo x, y
                                Delay 100
                                LeftClick 1
                                Delay 800
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
                                //点击关闭队伍信息界面
                                Randomize //初始化随机数生成器。
                                x = Int(((944-910)* Rnd) + 910) 
                                y = Int(((151-118) * Rnd) + 118)
                                MoveTo x, y
                                Delay 100
                                LeftClick 1
                                Delay 800
                                任务
                            End If
                        End If
                    Else //否
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
    Randomize //初始化随机数生成器。
    x = Int(((985-904)* Rnd) + 904) 
    y = Int(((620-550) * Rnd) + 550)
    MoveTo x, y
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
    Randomize //初始化随机数生成器。
    x = Int(((513-443)* Rnd) + 443) 
    y = Int(((496-440) * Rnd) + 440)
    MoveTo x, y
    Delay 100
    LeftClick 1//点击长安
    Delay 1000
    sc = true
End Sub//让人物在长安站着不动
Sub 任务
    //右边信息栏是否打开
    Rem rw信息栏
    FindColor 750,130,792,180,"8FDBFF",intX,intY
    If intX > 0 And intY > 0 Then //是
        //是否显示任务信息
        Rem rw任务信息
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
            //点击显示任务信息
            Randomize //初始化随机数生成器。
            x = Int(((894-819)* Rnd) + 819) 
            y = Int(((171-136) * Rnd) + 136)
            MoveTo x, y
            Delay 100
            LeftClick 1
            Delay 800
            Goto rw任务信息
        End if
    End If
    Rem 结束检查任务
End Sub
Sub 请离p2
    //状态栏是否显示队伍
    FindColor 918,129,1024,180,"E8C745",intX,intY
    If intX > 0 And intY > 0 Then //是
        //进入队伍界面
        Rem 进入队伍界面1
        Randomize //初始化随机数生成器。
        x = Int(((1009-933)* Rnd) + 933) 
        y = Int(((174-139) * Rnd) + 139)
        MoveTo x, y
        Delay 100
        LeftClick 1
        Delay 800
        //点击p2
        Randomize //初始化随机数生成器。
        x = Int(((402-251)* Rnd) + 251) 
        y = Int(((618-249) * Rnd) + 249)
        MoveTo x, y
        Delay 100
        LeftClick 1
        Delay 800
        //请离p2
        Randomize //初始化随机数生成器。
        x = Int(((665-569)* Rnd) + 569) 
        y = Int(((425-388) * Rnd) + 388)
        MoveTo x, y
        Delay 100
        LeftClick 1
        Delay 800
        //关闭队伍界面
        Randomize //初始化随机数生成器。
        x = Int(((944-910)* Rnd) + 910) 
        y = Int(((151-118) * Rnd) + 118)
        MoveTo x, y
        Delay 100
        LeftClick 1
        Delay 800
    Else 
        //点击队伍按钮
        Randomize //初始化随机数生成器。
        x = Int(((1009-933)* Rnd) + 933) 
        y = Int(((174-139) * Rnd) + 139)
        MoveTo x, y
        Delay 100
        LeftClick 1
        Delay 500
        Goto 进入队伍界面1
    End if
End Sub
Sub 请离p3
    //状态栏是否显示队伍
    FindColor 918,129,1024,180,"E8C745",intX,intY
    If intX > 0 And intY > 0 Then //是
        //进入队伍界面
        Rem 进入队伍界面2
        Randomize //初始化随机数生成器。
        x = Int(((1009-933)* Rnd) + 933) 
        y = Int(((174-139) * Rnd) + 139)
        MoveTo x, y
        Delay 100
        LeftClick 1
        Delay 800
        //点击p3
        Randomize //初始化随机数生成器。
        x = Int(((557-446)* Rnd) + 446) 
        y = Int(((488-280) * Rnd) + 280)
        MoveTo x, y
        Delay 100
        LeftClick 1
        Delay 800
        //请离p3
        Randomize //初始化随机数生成器。
        x = Int(((836-736)* Rnd) + 736) 
        y = Int(((427-389) * Rnd) + 389)
        MoveTo x, y
        Delay 100
        LeftClick 1
        Delay 800
        //关闭队伍界面
        Randomize //初始化随机数生成器。
        x = Int(((944-910)* Rnd) + 910) 
        y = Int(((151-118) * Rnd) + 118)
        MoveTo x, y
        Delay 100
        LeftClick 1
        Delay 800
    Else 
        //点击队伍按钮
        Randomize //初始化随机数生成器。
        x = Int(((1009-933)* Rnd) + 933) 
        y = Int(((174-139) * Rnd) + 139)
        MoveTo x, y
        Delay 100
        LeftClick 1
        Delay 500
        Goto 进入队伍界面2
    End if
End Sub
Sub 请离p4
    //状态栏是否显示队伍
    FindColor 918,129,1024,180,"E8C745",intX,intY
    If intX > 0 And intY > 0 Then //是
        //进入队伍界面
        Rem 进入队伍界面3
        Randomize //初始化随机数生成器。
        x = Int(((1009-933)* Rnd) + 933) 
        y = Int(((174-139) * Rnd) + 139)
        MoveTo x, y
        Delay 100
        LeftClick 1
        Delay 800
        //点击p4
        Randomize //初始化随机数生成器。
        x = Int(((728-626)* Rnd) + 626) 
        y = Int(((468-311) * Rnd) + 311)
        MoveTo x, y
        Delay 100
        LeftClick 1
        Delay 800
        //请离p4
        Randomize //初始化随机数生成器。
        x = Int(((559-452)* Rnd) + 452) 
        y = Int(((432-387) * Rnd) + 387)
        MoveTo x, y
        Delay 100
        LeftClick 1
        Delay 800
        //关闭队伍界面
        Randomize //初始化随机数生成器。
        x = Int(((944-910)* Rnd) + 910) 
        y = Int(((151-118) * Rnd) + 118)
        MoveTo x, y
        Delay 100
        LeftClick 1
        Delay 800
    Else 
        //点击队伍按钮
        Randomize //初始化随机数生成器。
        x = Int(((1009-933)* Rnd) + 933) 
        y = Int(((174-139) * Rnd) + 139)
        MoveTo x, y
        Delay 100
        LeftClick 1
        Delay 500
        Goto 进入队伍界面3
    End if
End Sub
Sub 请离p5
    //状态栏是否显示队伍
    FindColor 918,129,1024,180,"E8C745",intX,intY
    If intX > 0 And intY > 0 Then //是
        //进入队伍界面
        Rem 进入队伍界面4
        Randomize //初始化随机数生成器。
        x = Int(((1009-933)* Rnd) + 933) 
        y = Int(((174-139) * Rnd) + 139)
        MoveTo x, y
        Delay 100
        LeftClick 1
        Delay 800
        //点击p5
        Randomize //初始化随机数生成器。
        x = Int(((902-790)* Rnd) + 790) 
        y = Int(((505-322) * Rnd) + 322)
        MoveTo x, y
        Delay 100
        LeftClick 1
        Delay 800
        //请离p5
        Randomize //初始化随机数生成器。
        x = Int(((728-569)* Rnd) + 625) 
        y = Int(((427-388) * Rnd) + 388)
        MoveTo x, y
        Delay 100
        LeftClick 1
        Delay 800
        //关闭队伍界面
        Randomize //初始化随机数生成器。
        x = Int(((944-910)* Rnd) + 910) 
        y = Int(((151-118) * Rnd) + 118)
        MoveTo x, y
        Delay 100
        LeftClick 1
        Delay 800
    Else 
        //点击队伍按钮
        Randomize //初始化随机数生成器。
        x = Int(((1009-933)* Rnd) + 933) 
        y = Int(((174-139) * Rnd) + 139)
        MoveTo x, y
        Delay 100
        LeftClick 1
        Delay 500
        Goto 进入队伍界面4
    End if
End Sub
Sub 战斗等待
    For 30//延迟30秒，在等待的过程中判断是否进入战斗
        FindColor 967,718,1007,755,"1B2F54",intX1,intY1
        FindColor 967,718,1007,755,"3866C0",intX,intY
        If intX > 0 or intX1 > 0 Then //如果进入了战斗
            Goto 等待结束
        End If
        Delay 1000
    Next
    Rem 等待结束
End Sub
Sub 点击任务栏
    //第一栏是否被点亮
    FindColor 87,188,288,253,"53A9E8",intX,intY
    If intX > 0 And intY > 0 Then //是
        //第一栏是否展开
        Rem 展开
        FindColor 242,194,263,225,"1C559B",intX,intY
        If intX > 0 And intY > 0 Then //否
            Randomize //初始化随机数生成器。
            x = Int(((240-123)* Rnd) + 123) 
            y = Int(((241-196) * Rnd) + 196)
            MoveTo x, y
            Delay 100
            LeftClick 1//点击展开第一栏
            Delay 1000
            Goto 展开
        Else //是
            //第一个选项是否被选中
            Rem 一中
            FindColor 94,265,282,324,"71D8FD",intX,intY
            If intX > 0 And intY > 0 Then //是
                //判断是不是抓鬼任务
                FindColor 320,162,609,451,"06AF08",intX,intY
                If intX > 0 And intY > 0 Then //如果找绿色的字
                    FindColor 336,375,888,619,"293F5B",intX1,intY1//找到此颜色，不是抓鬼任务
                    FindColor 632,314,901,416, "293F5B", intX2, intY2//找到此颜色，不是抓鬼任务
                    If intX1 > 0 or intX2 > 0 Then //不是抓鬼任务
                        Goto 三字
                    Else //是抓鬼任务
                        Randomize //初始化随机数生成器。
                        x = Int(((863-748)* Rnd) + 748) 
                        y = Int(((677-647) * Rnd) + 647)
                        MoveTo x, y//点击马上传送
                        Delay 500 
                        LeftClick 1//点击
                        Delay 1000
                        MoveTo 923, 138
                        LeftClick 1//点击关闭
                        Delay 300
                        sc = false
                        jrw = false
                    End If
                Else //不是抓鬼任务
                    Rem 三字
                    //判断第三栏是否有字
                    FindColor 84,339,286,397,"0A316C",intX,intY
                    If intX > 0 And intY > 0 Then //是
                        //是否可展开
                        FindColor 238,351,286,398,"2361AB",intX,intY
                        FindColor 238,351,286,398,"3274C4",intX1,intY1
                        If intX > 0 or intY1 > 0 Then //是
                            MoveTo 924, 138
                            Delay 500 
                            LeftClick 1//点击关闭任务界面
                            Delay 1000
                            接任务 
                        Else //否
                            MoveTo 127, 374
                            Delay 500 
                            LeftClick 1//点击第三栏
                            Delay 500
                            //判断是不是抓鬼任务
                            FindColor 320,162,609,451,"06AF08",intX,intY
                            If intX > 0 And intY > 0 Then //如果找绿色的字
                                FindColor 336,375,888,619,"293F5B",intX1,intY1//找到此颜色，不是抓鬼任务
                                FindColor 632,314,901,416, "293F5B", intX2, intY2//找到此颜色，不是抓鬼任务
                                If intX1 > 0 or intX2 > 0 Then //不是抓鬼任务
                                    Goto 四字
                                Else //是抓鬼任务
                                    Randomize //初始化随机数生成器。
                                    x = Int(((863-748)* Rnd) + 748) 
                                    y = Int(((677-647) * Rnd) + 647)
                                    MoveTo x, y//点击马上传送
                                    Delay 500 
                                    LeftClick 1//点击
                                    Delay 1000
                                    MoveTo 923, 138
                                    LeftClick 1//点击关闭
                                    Delay 300
                                    sc = false
                                    jrw = false
                                End If
                            Else //否
                                //判断第四栏是否有字
                                Rem 四字
                                FindColor 100,422,281,477,"0A316C",intX,intY
                                If intX > 0 And intY > 0 Then //是
                                    //判断是否可展开
                                    FindColor 243,429,287,475,"2361AB",intX,intY
                                    FindColor 243,429,287,475,"3274C4",intX1,intY1
                                    If intX > 0 or intY1 > 0 Then //是
                                        MoveTo 924, 138
                                        Delay 500 
                                        LeftClick 1//点击关闭任务界面
                                        Delay 1000
                                        接任务 
                                    Else //否
                                        MoveTo 181, 432
                                        Delay 500 
                                        LeftClick 1//点击第四栏
                                        Delay 1000
                                    End If
                                Else //否
                                    MoveTo 924, 138
                                    Delay 500 
                                    LeftClick 1//点击关闭任务界面
                                    Delay 1000
                                    接任务 
                                    //判断是不是抓鬼任务
                                    FindColor 320,162,609,451,"06AF08",intX,intY
                                    If intX > 0 And intY > 0 Then //如果找绿色的字
                                        FindColor 336,375,888,619,"293F5B",intX1,intY1//找到此颜色，不是抓鬼任务
                                        FindColor 632,314,901,416, "293F5B", intX2, intY2//找到此颜色，不是抓鬼任务
                                        If intX1 > 0 or intX2 > 0 Then //不是抓鬼任务
                                            Goto 五字
                                        Else //是抓鬼任务
                                            Randomize //初始化随机数生成器。
                                            x = Int(((863-748)* Rnd) + 748) 
                                            y = Int(((677-647) * Rnd) + 647)
                                            MoveTo x, y//点击马上传送
                                            Delay 500 
                                            LeftClick 1//点击
                                            Delay 1000
                                            MoveTo 923, 138
                                            LeftClick 1//点击关闭
                                            Delay 300
                                            sc = false
                                            jrw = false
                                        End If
                                    Else //否
                                        //判断第五栏是否有字
                                        Rem 五字
                                        FindColor 94,500,280,569,"0A316C",intX,intY
                                        If intX > 0 And intY > 0 Then //是
                                            //判断是否可展开
                                            FindColor 246, 504, 293, 560, "2361AB", intX, intY
                                            FindColor 246,504,293,560,"3274C4",intX1,intY1
                                            If intX > 0 or intY1 > 0 Then //是
                                                MoveTo 924, 138
                                                Delay 500 
                                                LeftClick 1//点击关闭任务界面
                                                Delay 1000
                                                接任务 
                                            Else //否
                                                MoveTo 177, 520
                                                Delay 500
                                                LeftClick 1//点击第五栏
                                                Delay 300
                                                //判断是不是抓鬼任务
                                                FindColor 320,162,609,451,"06AF08",intX,intY
                                                If intX > 0 And intY > 0 Then //如果找绿色的字
                                                    FindColor 336,375,888,619,"293F5B",intX1,intY1//找到此颜色，不是抓鬼任务
                                                    FindColor 632,314,901,416, "293F5B", intX2, intY2//找到此颜色，不是抓鬼任务
                                                    If intX1 > 0 or intX2 > 0 Then //不是抓鬼任务
                                                        Goto 五关
                                                    Else //是抓鬼任务
                                                        Randomize //初始化随机数生成器。
                                                        x = Int(((863-748)* Rnd) + 748) 
                                                        y = Int(((677-647) * Rnd) + 647)
                                                        MoveTo x, y//点击马上传送
                                                        Delay 500 
                                                        LeftClick 1//点击
                                                        Delay 1000
                                                        MoveTo 923, 138
                                                        LeftClick 1//点击关闭
                                                        Delay 300
                                                        sc = false
                                                        jrw = false
                                                    End If
                                                Else //否
                                                    Rem 五关
                                                    MoveTo 924, 138
                                                    Delay 500 
                                                    LeftClick 1//点击关闭任务界面
                                                    Delay 1000
                                                    接任务 
                                                End If
                                            End If
                                        Else //否
                                            MoveTo 924, 138
                                            Delay 500 
                                            LeftClick 1//点击关闭任务界面
                                            Delay 1000
                                            接任务 
                                        End If
                                    End if
                                End If
                            end if
                        End If
                    Else //否
                        MoveTo 924, 138
                        Delay 500 
                        LeftClick 1//点击关闭任务界面
                        Delay 1000
                        接任务
                    End If
                End if 
            Else //否
                MoveTo 190, 282
                Delay 100
                LeftClick 1//点击选中第一栏
                Delay 1000
                Goto 一中
            End If
        End If
    Else //否
        //是否展开
        Rem 是否展开
        FindColor 244,201,263,227,"1E579D",intX,intY
        If intX > 0 And intY > 0 Then //否
            MoveTo 185, 219
            Delay 100
            LeftClick 1//点击展开第一栏
            Delay 800
            Goto 是否展开
        Else //是 
            MoveTo 187, 293
            Delay 100
            LeftClick 1//点击第一项
            Delay 800
            Goto 一中
        End If
    End If
End Sub
Sub 接任务
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
        Delay 500
    Else //否
        Goto 找钟馗
    End if
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
Call 开始
