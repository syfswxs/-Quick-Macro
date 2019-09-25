/*
	梦幻西游手游自动抢购系统，最多可输入商城珍品公示期倒计时，自动算出抢购时间并抢购，可抢购完后选择自动关机。
*/
/*
	注意：68级以上玩家适用 
*/
//*********************************   源代码   *****************************************
Dim Obj, UserName, NowTime, LenS, Num
Qbg = false
tuichu = false
zdgj = false//自动关机
//输入时间转整型
intSWTimeM = 0
intSWTimeH = 0
//系统时间转整型
intNowTimeM = 0
intNowTimeH = 0
//记录下架时间转整型
intXJtimeM = 0
//安全锁
aqs = false
//下架
Xj = false
tm1 = 0
th1 = 0
tm2 = 0
th2 = 0
tm3 = 0
th3 = 0
tm4 = 0
th4 = 0
tm5 = 0
th5 = 0
tm6 = 0
th6 = 0
tm7 = 0
th7 = 0
tm8 = 0
th8 = 0
t2 = true
t3 = true
t4 = true
t5 = true
t6 = true
t7 = true
t8 = true
set Obj = createobject("WScript.Shell")
Sub 开始
    //调用“Wscript.Shell”
    UserName=Obj.RegRead("HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\RegisteredOwner")
    // RegRead -- 读取注册表
    YN=Obj.Popup(UserName&" 你好，是否输入目标物品公示期时间进行定时抢购？"&chr (13) &" [是]   ：输入公示期结束时间"&chr (13) &" [否]   ：直接运行抢购程序"&chr (13) &" [取消]：退出程序",0,"白玉京",3)
    //Popup--弹出对话框
    If YN = 6 Then //如果【是】按钮被单击
        获取时间 
        If tuichu = true Then 
            Goto reallyEnd
        End If
        tm1 = intSWTimeM//记录时间的分钟
        th1 = intSWTimeH//记录的小时
        YN = Obj.Popup("是否添加下一个目标物品公示期时间？" & chr(13) & " [是]   ：输入公示期结束时间" & chr(13) & " [否]   ：等待系统运行"& chr(13) & "注意：不能输入相差2分钟之内的公示期结束时间，如有请酌情放弃其中一个"& chr(13) & "      否则会出现无法预期的错误", 0, "白玉京", 4)
        If YN = 6 Then //如果【是】按钮被单击
            获取时间 
            If tuichu = true Then 
                Goto reallyEnd
            End If
            tm2 = intSWTimeM//记录时间的分钟
            th2 = intSWTimeH//记录的小时
            t2 = false//已经记录时间
            YN = Obj.Popup("是否添加下一个目标物品公示期时间？" & chr(13) & " [是]   ：输入公示期结束时间" & chr(13) & " [否]   ：等待系统运行"& chr(13) & "注意：不能输入相差2分钟之内的公示期结束时间，如有请酌情放弃其中一个"& chr(13) & "      否则会出现无法预期的错误", 0, "白玉京", 4)
            If YN = 6 Then //如果【是】按钮被单击
                获取时间 
                If tuichu = true Then 
                    Goto reallyEnd
                End If
                tm3 = intSWTimeM//记录时间的分钟
                th3 = intSWTimeH//记录的小时
                t3 = false//已经记录时间
                YN = Obj.Popup("是否添加下一个目标物品公示期时间？" & chr(13) & " [是]   ：输入公示期结束时间" & chr(13) & " [否]   ：等待系统运行"& chr(13) & "注意：不能输入相差2分钟之内的公示期结束时间，如有请酌情放弃其中一个"& chr(13) & "      否则会出现无法预期的错误", 0, "白玉京", 4)
                If YN = 6 Then //如果【是】按钮被单击
                    获取时间 
                    If tuichu = true Then 
                        Goto reallyEnd
                    End If
                    tm4 = intSWTimeM//记录时间的分钟
                    th4 = intSWTimeH//记录的小时
                    t4 = false//已经记录时间
                    YN = Obj.Popup("是否添加下一个目标物品公示期时间？" & chr(13) & " [是]   ：输入公示期结束时间" & chr(13) & " [否]   ：等待系统运行"& chr(13) & "注意：不能输入相差2分钟之内的公示期结束时间，如有请酌情放弃其中一个"& chr(13) & "      否则会出现无法预期的错误", 0, "白玉京", 4)
                    If YN = 6 Then //如果【是】按钮被单击
                        获取时间 
                        If tuichu = true Then 
                            Goto reallyEnd
                        End If
                        tm5 = intSWTimeM//记录时间的分钟
                        th5 = intSWTimeH//记录的小时
                        t5 = false//已经记录时间
                        YN = Obj.Popup("是否添加下一个目标物品公示期时间？" & chr(13) & " [是]   ：输入公示期结束时间" & chr(13) & " [否]   ：等待系统运行"& chr(13) & "注意：不能输入相差2分钟之内的公示期结束时间，如有请酌情放弃其中一个"& chr(13) & "      否则会出现无法预期的错误", 0, "白玉京", 4)
                        If YN = 6 Then //如果【是】按钮被单击
                            获取时间 
                            If tuichu = true Then 
                                Goto reallyEnd
                            End If
                            tm6 = intSWTimeM//记录时间的分钟
                            th6 = intSWTimeH//记录的小时
                            t6 = false//已经记录时间
                            YN = Obj.Popup("是否添加下一个目标物品公示期时间？" & chr(13) & " [是]   ：输入公示期结束时间" & chr(13) & " [否]   ：等待系统运行"& chr(13) & "注意：不能输入相差2分钟之内的公示期结束时间，如有请酌情放弃其中一个"& chr(13) & "      否则会出现无法预期的错误", 0, "白玉京", 4)
                            If YN = 6 Then //如果【是】按钮被单击
                                获取时间 
                                If tuichu = true Then 
                                    Goto reallyEnd
                                End If
                                tm7 = intSWTimeM//记录时间的分钟
                                th7 = intSWTimeH//记录的小时
                                t7 = false//已经记录时间
                                YN = Obj.Popup("是否添加下一个目标物品公示期时间？" & chr(13) & " [是]   ：设置抢购时间" & chr(13) & " [否]   ：等待系统运行"& chr(13) & "注意：不能输入相差2分钟之内的公示期结束时间，如有请酌情放弃其中一个"& chr(13) & "      否则会出现无法预期的错误", 0, "白玉京", 4)
                                If YN = 6 Then //如果【是】按钮被单击
                                    获取时间 
                                    If tuichu = true Then 
                                        Goto reallyEnd
                                    End If
                                    tm8 = intSWTimeM//记录时间的分钟
                                    th8 = intSWTimeH//记录的小时
                                    t8 = false//已经记录时间
                                    YN = Obj.Popup("已经添加满8个抢购时间，请等待程序运行",3, "白玉京", 0)
                                end if
                            end if
                        end if
                    end if
                end if
            End If
        End If
        是否自动关机
        //*********************************** 对比时间 ****************************************************
        If t2 = true Then //如果没记录时间
            Call Obj.Popup("白玉京系统将在" & th1 & "时" & tm1 & "分抢购！！", 5, "白玉京", 48)
            Goto Start
        End If
        If t3 = true Then //如果没记录时间
            Call Obj.Popup("白玉京系统将在" & th1 & "时" & tm1 & "分、" & th2 & "时" & tm2 & "分抢购！！", 5, "白玉京", 48)
            Goto Start
        End If
        If t4 = true Then //如果没记录时间
            Call Obj.Popup("白玉京系统将在" & th1 & "时" & tm1 & "分、" & th2 & "时" & tm2 & "分、" & th3 & "时" & tm3 & "分抢购！！", 5, "白玉京", 48)
            Goto Start
        End If
        If t5 = true Then //如果没记录时间
            Call Obj.Popup("白玉京系统将在" & th1 & "时" & tm1 & "分、" & th2 & "时" & tm2 & "分、" & th3 & "时" & tm3 & "分、" & th4 & "时" & tm4 & "分抢购！！", 5, "白玉京", 48)
            Goto Start
        End If
        If t6 = true Then //如果没记录时间
            Call Obj.Popup("白玉京系统将在" & th1 & "时" & tm1 & "分、" & th2 & "时" & tm2 & "分、" & th3 & "时" & tm3 & "分、" & th4 & "时" & tm4 & "分、" & th5 & "时" & tm5 & "分抢购！！", 5, "白玉京", 48)
            Goto Start
        End If
        If t7 = true Then //如果没记录时间
            Call Obj.Popup("白玉京系统将在" & th1 & "时" & tm1 & "分、" & th2 & "时" & tm2 & "分、" & th3 & "时" & tm3 & "分、" & th4 & "时" & tm4 & "分、" & th5 & "时" & tm5 & "分、" & th6 & "时" & tm6 & "分抢购！！", 5, "白玉京", 48)
            Goto Start
        End If
        If t8 = true Then //如果没记录时间
            Call Obj.Popup("白玉京系统将在" & th1 & "时" & tm1 & "分、" & th2 & "时" & tm2 & "分、" & th3 & "时" & tm3 & "分、" & th4 & "时" & tm4 & "分、" & th5 & "时" & tm5 & "分、" & th6 & "时" & tm6 & "分、" & th7 & "时" & tm7 & "分抢购！！", 5, "白玉京", 48)
            Goto Start
        End If
        Call Obj.Popup("白玉京系统将在" & th1 & "时" & tm1 & "分、" & th2 & "时" & tm2 & "分、" & th3 & "时" & tm3 & "分、" & th4 & "时" & tm4 & "分、" & th5 & "时" & tm5 & "分、" & th6 & "时" & tm6 & "分、" & th7 & "时" & tm7 & "分、" & th8 & "时" & tm8 & "分抢购！！", 5, "白玉京", 48)
        Rem Start
        NowTime=Time
        //Time -- 获得当前时间
        intNowTimeM = CInt(Minute(NowTime))//把获取的系统时间分钟转换成整数型
        intNowTimeH = CInt(Hour(NowTime))//把获取的系统时间小时转换成整数型
        If th1 = intNowTimeH and tm1-1 = intNowTimeM Then //如果到了抢购时间的前一分钟
            intXJtimeM = intNowTimeM//抢购前记录开始抢购的时间
            Call 抢购
            tm1 = 0//初始化
            th1 = 0
            t1 = True
        End If
        NowTime=Time
        //Time -- 获得当前时间
        intNowTimeM = CInt(Minute(NowTime))//把获取的系统时间分钟转换成整数型
        intNowTimeH = CInt(Hour(NowTime))//把获取的系统时间小时转换成整数型
        If th2 = intNowTimeH and tm2-1 = intNowTimeM Then //如果到了抢购时间的前一分钟
            intXJtimeM = intNowTimeM//抢购前记录开始抢购的时间
            Call 抢购
            tm2 = 0//初始化
            th2 = 0
            t2 = True
        End If
        NowTime=Time
        //Time -- 获得当前时间
        intNowTimeM = CInt(Minute(NowTime))//把获取的系统时间分钟转换成整数型
        intNowTimeH = CInt(Hour(NowTime))//把获取的系统时间小时转换成整数型
        If th3 = intNowTimeH and tm3-1 = intNowTimeM Then //如果到了抢购时间的前一分钟
            intXJtimeM = intNowTimeM//抢购前记录开始抢购的时间
            Call 抢购
            tm3 = 0//初始化
            th3 = 0
            t3 = True
        End If
        NowTime=Time
        //Time -- 获得当前时间
        intNowTimeM = CInt(Minute(NowTime))//把获取的系统时间分钟转换成整数型
        intNowTimeH = CInt(Hour(NowTime))//把获取的系统时间小时转换成整数型
        If th4 = intNowTimeH and tm4-1 = intNowTimeM Then //如果到了抢购时间的前一分钟
            intXJtimeM = intNowTimeM//抢购前记录开始抢购的时间
            Call 抢购
            tm4 = 0//初始化
            th4 = 0
            t4 = True
        End If
        NowTime=Time
        //Time -- 获得当前时间
        intNowTimeM = CInt(Minute(NowTime))//把获取的系统时间分钟转换成整数型
        intNowTimeH = CInt(Hour(NowTime))//把获取的系统时间小时转换成整数型
        If th5 = intNowTimeH and tm5-1 = intNowTimeM Then //如果到了抢购时间的前一分钟
            intXJtimeM = intNowTimeM//抢购前记录开始抢购的时间
            Call 抢购
            tm5 = 0//初始化
            th5 = 0
            t5 = True
        End If
        NowTime=Time
        //Time -- 获得当前时间
        intNowTimeM = CInt(Minute(NowTime))//把获取的系统时间分钟转换成整数型
        intNowTimeH = CInt(Hour(NowTime))//把获取的系统时间小时转换成整数型
        If th6 = intNowTimeH and tm6-1 = intNowTimeM Then //如果到了抢购时间的前一分钟
            intXJtimeM = intNowTimeM//抢购前记录开始抢购的时间
            Call 抢购
            tm6 = 0//初始化
            th6 = 0
            t6 = True
        End If
        NowTime=Time
        //Time -- 获得当前时间
        intNowTimeM = CInt(Minute(NowTime))//把获取的系统时间分钟转换成整数型
        intNowTimeH = CInt(Hour(NowTime))//把获取的系统时间小时转换成整数型
        If th7 = intNowTimeH and tm7-1 = intNowTimeM Then //如果到了抢购时间的前一分钟
            intXJtimeM = intNowTimeM//抢购前记录开始抢购的时间
            Call 抢购
            tm7 = 0//初始化
            th7 = 0
            t7 = True
        End If
        NowTime=Time
        //Time -- 获得当前时间
        intNowTimeM = CInt(Minute(NowTime))//把获取的系统时间分钟转换成整数型
        intNowTimeH = CInt(Hour(NowTime))//把获取的系统时间小时转换成整数型
        If th8 = intNowTimeH and tm8-1 = intNowTimeM Then //如果到了抢购时间的前一分钟
            intXJtimeM = intNowTimeM//抢购前记录开始抢购的时间
            Call 抢购
            tm8 = 0//初始化
            th8 = 0
            t8 = True
        End If
        If t1 = true and t2 = true and t3 = true and t4 = true and t5 = true and t6 = true and t7 = true and t8 = true Then //如果设定的时间都跑完
            If zdgj = true Then 
                Call Obj.Popup("5秒后自动关机",5,"白玉京",48)
                Obj.Run "shutdown /f /s /t 0"
                //调用shutdown命令。 /f--强行关闭应用程序而不提醒， /s--关闭计算机（要重启的话，请把这改成/r[重启计算机]），/t time--在time秒后前闭计算机。
            End If
            Goto reallyEnd //退出程序
        End if
        For 5//系统每5秒监测一下时间
            Delay 1000
        Next
        Goto Start
    ElseIf YN = 7 Then//如果【否】按钮被点击
        NowTime=Time
        //Time -- 获得当前时间
        intNowTimeM = CInt(Minute(NowTime))//把获取的系统时间分钟转换成整数型
        intXJtimeM = intNowTimeM//抢购前记录开始抢购的时间
        Call 抢购//直接抢购
        Goto reallyEnd
    End If
    Rem reallyEnd
    Call Obj.Popup("已退出白玉京系统",5,"白玉京",48)
End Sub
Sub 是否自动关机
    YN = Obj.Popup("抢购最后一个后是否自动关机？", 0, "白玉京", 4)
    If YN = 6 Then 
        zdgj = true
    End If 		
End Sub
Sub 转到商城关注
    FindColor 967,718,1007,755,"3866C0",intX,intY
    If intX > 0 And intY > 0 Then //在战斗中
        Randomize //初始化随机数生成器。
        x = Int(((40-22)* Rnd) + 22) 
        y = Int(((93-65) * Rnd) + 65)
        MoveTo x, y//移动至展开菜单栏按钮  
        Delay 100
        LeftClick 1//点击进入
        Delay 500
        Randomize //初始化随机数生成器。
        x = Int(((63-27)* Rnd) + 27) 
        y = Int(((258-215) * Rnd) + 215)
        MoveTo x, y//移动至商城按钮  
        Delay 500
        LeftClick 1//点击进入
        Delay 800
    Else //如果不是在战斗中
        Randomize //初始化随机数生成器。
        x = Int(((56-15)* Rnd) + 15) 
        y = Int(((241-204) * Rnd) + 204)
        MoveTo x, y//移动至商城按钮  
        Delay 300
        LeftClick 1	//点击进入
        Delay 800
    End If
    Randomize //初始化随机数生成器。
    x = Int(((986-954)* Rnd) + 954) 
    y = Int(((391-335) * Rnd) + 335)
    MoveTo x, y//移动至摆摊
    Delay 300
    LeftClick 1//点击选中
    Delay 300
    Randomize //初始化随机数生成器。
    x = Int(((79-49)* Rnd) + 49) 
    y = Int(((344-292) * Rnd) + 292)
    MoveTo x, y//本服
    Delay 500
    LeftClick 1//点击选中
End Sub
Sub 刷新判断
    intXJtimeM = intXJtimeM + 3//3分钟的刷新时间
    Randomize //初始化随机数生成器。
    x = Int(((246-127)* Rnd) + 127) 
    y = Int(((603-308) * Rnd) + 308)
    MoveTo x, y//移动到左边选项栏
    rem 关注
    MoveTo 189, 354//向上划选项栏
    LeftDown 1
    Delay 300
    MoveTo 186, 553
    Delay 500
    FindColor 121,296,130,305,"CFE0ED",intX,intY
    If intX > 0 And intY > 0 Then 
    Else 
        LeftUp 1
        Delay 500
        Goto 关注
    End If
    FindColor 210,288,218,300,"CFE0ED",intX,intY
    If intX > 0 And intY > 0 Then 
    Else 
        LeftUp 1
        Delay 500
        Goto 关注
    End If
    FindColor 201,322,212,334,"CFE0ED",intX,intY
    If intX > 0 And intY > 0 Then 
    Else 
        LeftUp 1
        Delay 500
        Goto 关注
    End If
    FindColor 131,320,142,329,"CFE0ED",intX,intY
    If intX > 0 And intY > 0 Then //判断上面几个点是否把菜单栏拉到最上面
    Else 
        LeftUp 1
        Delay 500
        Goto 关注
    End If
    LeftUp 1
    Delay 500
    Randomize //初始化随机数生成器。
    x = Int(((214-135)* Rnd) + 135) 
    y = Int(((341-298) * Rnd) + 298)
    MoveTo x, y//移动到关注按钮
    LeftClick 1//点击
    Delay 800
    Rem 疯狂刷新
    LeftClick 1//点击
    NowTime = Time//获取第一次刷新的当下时间
    intNowTimeM = CInt(Minute(NowTime))
    If intXJtimeM >= 60 Then //如果大于60 则计算正确的分钟
        intXJtimeM = intXJtimeM - 60
    End If
    If intXJtimeM = intNowTimeM Then //如果2分钟后没刷出东西，说明卖家下架
        Xj = true
        Goto 结束刷新
    End If
    FindColor 318,234,362,248,"D3E3F0",intX,intY
    If intX> 0 And intY> 0 Then//如果刷出物品
        MoveTo intX, intY+5 //选中物品
        Delay 100
        LeftClick 1//点击选中
        购买
        Rem 重复购买
        FindColor 377,244,515,283,"A0C3DF",intX,intY
        If intX > 0 And intY > 0 Then //如果物品不在
            Goto 结束刷新
        Else 
            购买
            If Qbg = true Then 
                Goto 结束刷新
            End If
        End If
        Goto 重复购买//如果没有刷出物品则跳到刷新关注
    End If
    Goto 疯狂刷新
    Rem 结束刷新
End Sub
Sub 购买
    Randomize //初始化随机数生成器。
    x = Int(((887-796)* Rnd) + 796) 
    y = Int(((696-660) * Rnd) + 660)
    MoveTo x, y//移动到购买
    LeftClick 1//点击购买
    Delay 200
    //MoveTo 488, 287//移动到关闭
    Randomize //初始化随机数生成器。
    x = Int(((357-285)* Rnd) + 285) 
    y = Int(((541-506) * Rnd) + 506)
    MoveTo x, y//移动到确认
    LeftClick 1//点击确定
    Delay 300
    FindColor 385,477,638,530,"C6E370",intX,intY
    If intX> 0 And intY> 0 Then//如果出现钱不够情况 
        MoveTo 704, 306
        LeftClick 1
        Qbg = true
    End If
    Rem 结束购买
End Sub
Sub 截图
    If Xj = true Then 
        Goto 结束截图
    End If
    FindColor 321,234,342,248,"9DC1DF",intX,intY
    If intX> 0 And intY> 0 Then//如果物品消失
        Randomize //初始化随机数生成器。
        x = Int(((939-910)* Rnd) + 910) 
        y = Int(((152-121) * Rnd) + 121)
        MoveTo x, y//移动到关闭
        LeftClick 1//点击
        Delay 800
        FindColor 967,718,1007,755,"3866C0",intX,intY
        if intX > 0 And intY > 0 Then //在战斗中
            Randomize //初始化随机数生成器。
            x = Int(((40-19)* Rnd) + 19) 
            y = Int(((95-64) * Rnd) + 64)
            MoveTo x, y//移动至展开菜单栏按钮  
            Delay 100
            LeftClick 1//点击进入
            Delay 800
            Randomize //初始化随机数生成器。
            x = Int(((64-26)* Rnd) + 26) 
            y = Int(((101-55) * Rnd) + 55)
            MoveTo x, y//移动到包裹
            LeftClick 1//点击
            Delay 500
        Else //如果不在战斗中
            Randomize //初始化随机数生成器。
            x = Int(((1008 - 971) * Rnd) + 971)
            y = Int(((699 - 660) * Rnd) + 660)
            MoveTo x, y//移动到包裹
            LeftClick 1//点击
            Delay 500
        End If
        MoveTo 1468, 918//点击截图按钮
        LeftClick 1
        Delay 1000
        MoveTo 492, 160//找到截图区域
        LeftDown 1
        Delay 500
        MoveTo 921, 644
        LeftUp 1
        Delay 500
        MoveTo 880, 661
        LeftClick 1
        Delay 1000
        MoveTo 1840, 1018//点击发送
        LeftClick 1
        Delay 1000
        MoveTo 928, 140//关闭背包
        LeftClick 1 
        Delay 300
    End If
    Rem 结束截图
End Sub
Sub 获取时间
    Rem InputTime
    SWTime=InputBox ("请输入公示期倒计时，时间之间冒号必须为英文“:”"&chr (13) &"如：0:16 或 3:35"&chr (13) &"系统已自动提前1分钟抢购，不需要提前预留时间，请如实填写","白玉京")
    //*********************************** 判断时间格式 ****************************************************
    LenS=Len(SWTime)
    //Len--获得字符串的长度
    Num=Instr(SWTime,":")
    //Instr--获得":"所在字符串中的位置
    If Num = 0 Then 
        Num = Instr(SWTime, "：")
        YN = Obj.Popup("你输入的不是时间！", 0, "错误", 5)
        If YN = 4 Then //如果【重试】按钮被单击
            Goto InputTime//跳到 输入时间
        Else 
            tuichu=true
        End If
    End If
    If Num=0 Then
        YN = Obj.Popup("间隔符错误！请用“ : ”或者“ ： ”", 0, "格式错误", 5)
        If YN = 4 Then //如果【重试】按钮被单击
            Goto InputTime//跳到 输入时间
        Else 
            tuichu=true
        End If
    End If
    If left(SWTime,Num-1)>23 or left(SWTime,Num-1)<0  Then
        //left--取字符串左边Num-1个长度的字符
        YN =Obj.Popup("小时格式输入错误！",0,"小时格式错误！",5)
        If YN = 4 Then //如果【重试】按钮被单击
            Goto InputTime//跳到 输入时间
        Else 
            tuichu=true
        End If
    End If
    If Right(SWTime,LenS-Num)>59 or Right(SWTime,LenS-Num)<0 Then
        //Right--取字符串右边LenS-Num个长度的字符
        YN =Obj.Popup("分钟格式输入错误！",0,"分钟格式错误！",5)
        If YN = 4 Then //如果【重试】按钮被单击
            Goto InputTime//跳到 输入时间
        Else 
            tuichu=true
        End If
    End If
    NowTime=Time
    //Time -- 获得当前时间
    intSWTimeM = CInt(Minute(SWTime))//输入的分钟转换成整数型
    intNowTimeM = CInt(Minute(NowTime))//把获取的系统时间分钟转换成整数型
    intSWTimeH = CInt(Hour(SWTime))//输入的小时转换成整数型
    intNowTimeH = CInt(Hour(NowTime))//把获取的系统时间小时转换成整数型
    intSWTimeM = intSWTimeM + intNowTimeM//分钟相加
    If intSWTimeM >= 60 Then //如果输入的分钟加上现在的时间大于60
        intSWTimeH = intSWTimeH + 1
        intSWTimeM = intSWTimeM - 60 
    End If
    intSWTimeH = intSWTimeH + intNowTimeH//小时相加
    If intSWTimeH >= 24 Then //如果输入的小时加上现在的时间大于24
        intSWTimeH = intSWTimeH - 24
    End If
End Sub 
Sub 抢购 
    转到商城关注 
    刷新判断 
    截图
End Sub
Sub 查看安全锁
    FindColor 967,718,1007,755,"3866C0",intX,intY
    if intX > 0 And intY > 0 Then //在战斗中
        Randomize //初始化随机数生成器。
        x = Int(((40-22)* Rnd) + 22) 
        y = Int(((93-65) * Rnd) + 65)
        MoveTo x, y//移动至展开菜单栏按钮  
        Delay 100
        LeftClick 1//点击进入
        Delay 300
        Randomize //初始化随机数生成器。
        x = Int(((205-169)* Rnd) + 169) 
        y = Int(((250-212) * Rnd) + 212)
        MoveTo x, y//移动至设置按钮  
        Delay 100
        LeftClick 1//点击进入
        Delay 300
        安全锁
        FindColor 370,71,385,88,"97E4FF",intX,intY
        If intX > 0 And intY > 0 Then 
            MoveTo intX,intY//移动关闭按钮  
            Delay 100
            LeftClick 1//点击进入
            Delay 300
        End If
    Else //如果没在战斗中
        FindColor 898,743,916,761,"2022FB",intX,intY
        If intX > 0 And intY > 0 Then //如果下方系统栏展开
            Rem 进入设置
            Randomize //初始化随机数生成器。
            x = Int(((585-545)* Rnd) + 545) 
            y = Int(((758-732) * Rnd) + 732)
            MoveTo x, y//移动至下方加号展开按钮  
            Delay 100
            LeftClick 1//点击进入
            Delay 500
            安全锁 
        Else //如果没有展开
            Randomize //初始化随机数生成器。
            x = Int(((1007-977)* Rnd) + 977) 
            y = Int(((765-734) * Rnd) + 734)
            MoveTo x, y//移动至下方加号展开按钮  
            Delay 100
            LeftClick 1//点击进入
            Delay 1000
            Goto 进入设置
        End If
    End If
End Sub
Sub 安全锁
    Randomize //初始化随机数生成器。
    x = Int(((988-947)* Rnd) + 947) 
    y = Int(((512-430) * Rnd) + 430)
    MoveTo x, y//移动至安全锁按钮  
    Delay 100
    LeftClick 1//点击进入
    Delay 300
    FindColor 753,444,778,467,"2956FF",intX,intY
    If intX > 0 And intY > 0 Then //如果安全锁是关闭状态
        aqs = true//安全锁已打开
        Randomize //初始化随机数生成器。
        x = Int(((949-908)* Rnd) + 908) 
        y = Int(((156-120) * Rnd) + 120)
        MoveTo x, y//移动关闭按钮  
        Delay 100
        LeftClick 1//点击进入
        Delay 300
    End If 
End Sub
Sub 主程序
    查看安全锁 
    If aqs = false Then //如果安全锁是锁着的
        Call Obj.Popup("安全锁未打开，请打开安全锁后再执行程序！", 5, "白玉京", 48)
        Goto 结束
    End If
    开始 
    Rem 结束
End Sub
Call 主程序
