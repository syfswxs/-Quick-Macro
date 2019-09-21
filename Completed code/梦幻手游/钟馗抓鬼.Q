/*
	基本已经完善
*/
Dim Obj, Shuang, zdgj, Reallyend，PNumber，deng
//等待默认为false
deng = false
PNumber = false//人数默认不够4个
zdgj = false//自动关机默认为false
set Obj = createobject("WScript.Shell")
Shuang = true//双默认为还有
Reallyend = false//结束标记为false
Sub 自动关机
    YN = Obj.Popup("双用完后是否自动关机？", 0, "自动抓鬼", 4)
    If YN = 6 Then //如果点击是
        zdgj = true
    End If 		
End Sub
Sub 双
    Delay 1000
    Randomize //初始化随机数生成器。
    x = Int(((473-436)* Rnd) + 436) 
    y = Int(((87-46) * Rnd) + 46)
    MoveTo x, y
    Delay 100
    LeftClick 1//点击进入挂机界面
    Delay 1000
    FindColor 554,642,636,687,"0A316C",intX,intY
    If intX > 0 And intY > 0 Then //如果双还存在
        Shuang = true
    Else 
        Shuang = false
    End If
    Randomize //初始化随机数生成器。
    x = Int(((971-936)* Rnd) + 936) 
    y = Int(((156-121) * Rnd) + 121)
    MoveTo x, y
    Delay 100
    LeftClick 1//点击关闭界面
    Delay 500
End Sub//给出Shuang的值 true为双倍经验还在，false为已经用完
Sub 站着不动且没任务
    双 //检测是否用完双
    If Shuang = true Then 
        人数 //检测队伍人数
    End If
    If Shuang = true and PNumber = true Then 
        接任务
    End If
    If Shuang = false and zdgj = true Then 
        Call Obj.Popup("5秒后自动关机",5,"自动抓鬼",48)
        Obj.Run "shutdown /f /s /t 0"
        //调用shutdown命令。 /f--强行关闭应用程序而不提醒， /s--关闭计算机（要重启的话，请把这改成/r[重启计算机]），/t time--在time秒后前闭计算机。
    End If
    If Shuang = false and zdgj = false Then 
        Reallyend = true
    End If
End Sub
Sub 一轮
    FindColor 546,442,668,490,"62C1EE",intX,intY
    If intX > 0 And intY > 0 Then //如果出现抓完提示
        MoveTo intX, intY
        LeftClick 1//点击继续抓鬼
        Delay 3000
        MoveTo 571, 250
        LeftClick 1
        Delay 3000
        站着不动且没任务 
    End If
End Sub//如果出现提示则自动点击传送至钟馗处
Sub 监测是否正常
    //判断是否在战斗中
    Rem 是否战斗
    FindColor 967,718,1007,755,"1B2F54",intX1,intY1
    FindColor 967,718,1007,755,"3866C0",intX,intY
    If intX > 0 or intX1 > 0 Then //在战斗中
        Goto 是否战斗
    Else //不在战斗中
        If deng = true Then 
            For 30//延迟30秒，在等待的过程中判断是否进入战斗
                FindColor 967,718,1007,755,"3866C0",intX,intY
                If intX > 0 And intY Then //如果进入了战斗
                    Goto 是否战斗
                End If
                Delay 1000
            Next
        End If
        deng = true
        一轮 //第一步监控是否出现弹窗提醒抓完鬼
        //如果没有抓完鬼，又站着不动
        FindColor 750,130,792,180,"8FDBFF",intX,intY
        If intX > 0 And intY > 0 Then //右边队伍/任务栏是否打开
            //是
            Rem 是否在抓鬼
            FindColor 811,134,854,175,"ADE6D0",intX,intY
            If intX > 0 And intY > 0 Then //如果右边导航栏是显示任务
                //判断任务栏是否接有捉鬼任务
                FindColor 800, 182, 1023, 275, "38608D", intX, intY
                FindColor 800,182,1023,275,"14E351",intX1,intY1
                If intX> 0 And intY> 0 and intX> 0 And intY> 0 Then//任务栏第一项出现时钟和绿色的字
                    //点击任务开始自动捉鬼
                    MoveTo intX1, intY1
                    LeftClick 1
                    Delay 1000
                Else //如果没找到任务
                    站着不动且没任务
                End If
            Else //如果显示的是队伍
                Randomize //初始化随机数生成器。
                x = Int(((894-819)* Rnd) + 819) 
                y = Int(((171-136) * Rnd) + 136)
                MoveTo x, y
                Delay 100
                LeftClick 1//点亮任务栏
                Delay 500
                Goto 是否在抓鬼 
            End If
        Else //否
            //点击展开右边任务栏
            Randomize //初始化随机数生成器。
            x = Int(((1013-980)* Rnd) + 980) 
            y = Int(((175-144) * Rnd) + 144)
            MoveTo x, y
            Delay 100
            LeftClick 1
            Delay 800 
            Goto 是否在抓鬼
        End If
    End If
End Sub
Sub 接任务
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
    Rem 钟馗
    Randomize //初始化随机数生成器。
    x = Int(((179-94)* Rnd) + 94) 
    y = Int(((98-56) * Rnd) + 56)
    MoveTo x, y
    Delay 100
    LeftClick 1//点击小地图
    Delay 800
    Randomize //初始化随机数生成器。
    x = Int(((331-298)* Rnd) + 298) 
    y = Int(((480-464) * Rnd) + 464)
    MoveTo x, y
    Delay 100
    LeftClick 1//点击钟馗
    Delay 5000
    FindColor 139,542,213,595,"1133FF",intX,intY
    If intX > 0 And intY > 0 Then //如果弹出钟馗对话框
        Randomize //初始化随机数生成器。
        x = Int(((920-777)* Rnd) + 777) 
        y = Int(((415-379) * Rnd) + 379)
        MoveTo x, y
        Delay 100
        LeftClick 1//点击对话中的抓鬼任务
        Delay 500
        FindColor 411,353,516,403,"0015E0",intX,intY
        If intX > 0 And intY > 0 Then //如果提示人数不足5个是否自动匹配
            Randomize //初始化随机数生成器。
            x = Int(((457-381)* Rnd) + 381) 
            y = Int(((500-460) * Rnd) + 460)
            MoveTo x, y
            Delay 100
            LeftClick 1//点击取消
            Delay 500
        End If
        Randomize //初始化随机数生成器。
        x = Int(((947-838)* Rnd) + 838) 
        y = Int(((254-205) * Rnd) + 205)
        MoveTo x, y
        Delay 100
        LeftClick 1//点击任务栏自动抓鬼
        Delay 500
        LeftClick 1//开始抓鬼
        Delay 500
    Else 
        Goto 钟馗
    End If
End Sub//自动接任务并开始抓鬼
Sub 人数
    //先判断右边任务栏是否展开
    FindColor 750,130,792,180,"8FDBFF",intX,intY
    If intX > 0 And intY > 0 Then //是
        Rem 判断队伍
        //判断是否显示的是队伍
        FindColor 918,129,1024,180,"E8C745",intX,intY
        If intX > 0 And intY > 0 Then //是
            //判断是否有暂离以及离线
            Rem 队员状态
            FindColor 802,242,868,309,"4ED3FF",intX,intY
            If intX > 0 And intY > 0 Then //p2暂离
                请离p2 
                Goto 队员状态
            End If
            FindColor 804,244,865,304,"F5F5F6",intX,intY
            If intX > 0 And intY > 0 Then //p2离线
                请离p2 
                Goto 队员状态
            End If
            FindColor 804,302,865,362,"4ED3FF",intX,intY
            If intX > 0 And intY > 0 Then //p3暂离
                请离p3 
                Goto 队员状态
            End If
            FindColor 802,303,863,362,"FBFBFB",intX,intY
            If intX > 0 And intY > 0 Then //p3离线
                请离p3 
                Goto 队员状态
            End If
            FindColor 803,362,865,420,"4ED3FF",intX,intY
            If intX > 0 And intY > 0 Then //p4暂离
                请离p4 
                Goto 队员状态
            End If
            FindColor 804,359,865,423,"FBFBFB",intX,intY
            If intX > 0 And intY > 0 Then //p4离线
                请离p4 
                Goto 队员状态
            End If
            FindColor 799,415,867,489,"4ED3FF",intX,intY
            If intX > 0 And intY > 0 Then //p5暂离
                请离p5 
                Goto 队员状态
            End If
            FindColor 800,415,867,488,"FBFBFB",intX,intY
            If intX > 0 And intY > 0 Then //p5离线
                请离p5 
                Goto 队员状态
            End If
            //判断4号位是否有人
            FindColor 883,371,998,422,"1E43E1",intX,intY
            If intX > 0 And intY > 0 Then //是	
                //人数够4个
                PNumber = true
            Else //否
                //点开队伍界面
                Randomize //初始化随机数生成器。
                x = Int(((1009-933)* Rnd) + 933) 
                y = Int(((174-139) * Rnd) + 139)
                MoveTo x, y
                Delay 100
                LeftClick 1
                Delay 800
                //点击自动匹配
                Randomize //初始化随机数生成器。
                x = Int(((917-809)* Rnd) + 809) 
                y = Int(((215-181) * Rnd) + 181)
                MoveTo x, y
                Delay 100
                LeftClick 1
                Delay 800
                rem 助战判断
                //判断队伍界面的4号位是否有助战信息
                FindColor 589,232,669,278,"BAD3E8",intX,intY
                If intX > 0 And intY > 0 Then //是,不满4人
                    Goto 助战判断 
                Else //否，已经满4人	
                    PNumber = true
                    //点击关闭队伍信息界面
                    Randomize //初始化随机数生成器。
                    x = Int(((944-910)* Rnd) + 910) 
                    y = Int(((151-118) * Rnd) + 118)
                    MoveTo x, y
                    Delay 100
                    LeftClick 1
                    Delay 800
                End If
            End If
        Else //否
            //点击切换到队伍
            Randomize //初始化随机数生成器。
            x = Int(((1009-933)* Rnd) + 933) 
            y = Int(((174-139) * Rnd) + 139)
            MoveTo x, y
            Delay 100
            LeftClick 1
            Delay 800
            Goto 队员状态
        End If	
    Else //否
        //点击展开右边任务栏
        Randomize //初始化随机数生成器。
        x = Int(((1013-980)* Rnd) + 980) 
        y = Int(((175-144) * Rnd) + 144)
        MoveTo x, y
        Delay 100
        LeftClick 1
        Delay 800
        Goto 判断队伍
    End If
End Sub//给出PNumber的值 true为够4个人 false为不够人数
Sub 请离p2
    //进入队伍界面
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
End Sub
Sub 请离p3
    //进入队伍界面
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
End Sub
Sub 请离p4
    //进入队伍界面
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
End Sub
Sub 请离p5
    //进入队伍界面
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
End Sub
Sub 主程序
    YN = Obj.Popup("注意：双必须是4的倍数，不然会无限抓鬼"&chr (13) &"         助战第一位放孙悟空"&chr (13) &"         队伍设置好行动目标为抓鬼任务以便自动匹配玩家"&chr (13) &"[是]：已设置好，继续"&chr (13) &"[否]：退出程序", 0, "自动抓鬼", 4)
    If YN = 6 Then //如果点击否
    Else
        Goto 结束
    End If
    自动关机 
     Rem 监测
    监测是否正常 
    If Reallyend = true Then 
        Goto 结束
    End If
    Goto 监测
    Rem 结束
End Sub
Call 主程序
