[General]
SyntaxVersion=2
BeginHotkey=97
BeginHotkeyMod=2
PauseHotkey=98
PauseHotkeyMod=2
StopHotkey=99
StopHotkeyMod=2
RunOnce=1
EnableWindow=
MacroID=eba7fafe-8139-4f6a-9306-401e247e17a8
Description=梦幻倒计时抢购功能完善版（自己）
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
关注的物品一定不要有已经可以直接购买的物品，如果有，需要先取消关注。即：点击刷新按钮的时候 在我要购买这一栏必须没有任何东西

[Script]
/*
	梦幻西游手游自动抢购系统，最多可输入商城珍品公示期倒计时，自动算出抢购时间并抢购，可抢购完后选择自动关机。
*/
/*
	未完成： 
		基本已经完善
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
    If aqs = false Then //如果安全锁是锁着的
        Call Obj.Popup("安全锁未打开，请打开安全锁后再执行程序！", 5, "白玉京", 48)
        Goto reallyEnd
    End If
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
        If th2 = intNowTimeH and tm2-1 = intNowTimeM Then //如果到了抢购时间的前一分钟
            intXJtimeM = intNowTimeM//抢购前记录开始抢购的时间
            Call 抢购
            tm2 = 0//初始化
            th2 = 0
            t2 = True
        End If
        If th3 = intNowTimeH and tm3-1 = intNowTimeM Then //如果到了抢购时间的前一分钟
            intXJtimeM = intNowTimeM//抢购前记录开始抢购的时间
            Call 抢购
            tm3 = 0//初始化
            th3 = 0
            t3 = True
        End If
        If th4 = intNowTimeH and tm4-1 = intNowTimeM Then //如果到了抢购时间的前一分钟
            intXJtimeM = intNowTimeM//抢购前记录开始抢购的时间
            Call 抢购
            tm4 = 0//初始化
            th4 = 0
            t4 = True
        End If
        If th5 = intNowTimeH and tm5-1 = intNowTimeM Then //如果到了抢购时间的前一分钟
            intXJtimeM = intNowTimeM//抢购前记录开始抢购的时间
            Call 抢购
            tm5 = 0//初始化
            th5 = 0
            t5 = True
        End If
        If th6 = intNowTimeH and tm6-1 = intNowTimeM Then //如果到了抢购时间的前一分钟
            intXJtimeM = intNowTimeM//抢购前记录开始抢购的时间
            Call 抢购
            tm6 = 0//初始化
            th6 = 0
            t6 = True
        End If
        If th7 = intNowTimeH and tm7-1 = intNowTimeM Then //如果到了抢购时间的前一分钟
            intXJtimeM = intNowTimeM//抢购前记录开始抢购的时间
            Call 抢购
            tm7 = 0//初始化
            th7 = 0
            t7 = True
        End If
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
    FindColor 30,69,44,90,"8BD6FF",intX,intY
    If intX> 0 And intY> 0 Then//如果在战斗中
        MoveTo intX, intY //选中物品
        Delay 300
        LeftClick 1//点击选中 
        Delay 500
        Randomize //初始化随机数生成器。
        x = Int(((66-23)* Rnd) + 23) 
        y = Int(((258-212) * Rnd) + 212)
        MoveTo x, y//移动至商城按钮  
        Delay 500
        LeftClick 1//点击进入
    Else //如果不是在战斗中
        Randomize //初始化随机数生成器。
        x = Int(((63-9)* Rnd) + 9) 
        y = Int(((253-194) * Rnd) + 194)
        MoveTo x, y//移动至商城按钮  
        Delay 300
        LeftClick 1	//点击进入
        Delay 500
    End If
    Randomize //初始化随机数生成器。
    x = Int(((991-946)* Rnd) + 946) 
    y = Int(((402-326) * Rnd) + 326)
    MoveTo x, y//移动至摆摊
    Delay 300
    LeftClick 1//点击选中
    Delay 300
    Randomize //初始化随机数生成器。
    x = Int(((81-47)* Rnd) + 47) 
    y = Int(((348-285) * Rnd) + 285)
    MoveTo x, y//本服
    Delay 300
    LeftClick 1//点击选中
End Sub
Sub 刷新判断
    intXJtimeM = intXJtimeM + 2//2分钟的刷新时间
    Randomize //初始化随机数生成器。
    x = Int(((246-127)* Rnd) + 127) 
    y = Int(((603-308) * Rnd) + 308)
    MoveTo x, y//移动到左边选项栏
    rem 关注
    FindPic 95,288,270,347,"F:\按键精灵位图\梦幻手游\选中的关注.bmp",0.9,intX,intY
    If intX > 0 And intY > 0 Then //如果关注已经被选中
        MoveTo intX, intY
        Goto 疯狂刷新
    End If
    FindPic 95,288,270,347,"F:\按键精灵位图\梦幻手游\未选中的关注.bmp",0.9,intX,intY
    If intX > 0 And intY > 0 Then //如果关注没被选中
        MoveTo intX, intY
        Goto 疯狂刷新
    End If
    MoveTo 189, 354//向上划选项栏
    LeftDown 1
    Delay 300
    MoveTo 186, 553
    Delay 500
    LeftUp 1
    Delay 300
    Goto 关注
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
        FindColor 318,234,362,248,"6BD3FD",intX,intY
        If intX > 0 And intY > 0 Then //如果选中的物品存在
            购买 
            If Qbg = true Then 
                Goto 结束刷新
            End If
            Goto 重复购买
        Else 
            Goto 结束刷新
        End If
        Goto 重复购买//如果没有刷出物品则跳到刷新关注
    End If
    Goto 疯狂刷新
    Rem 结束刷新
End Sub
Sub 购买
    Randomize //初始化随机数生成器。
    x = Int(((900-783)* Rnd) + 783) 
    y = Int(((699-652) * Rnd) + 652)
    MoveTo x, y//移动到购买
    LeftClick 1//点击购买
    Delay 500
    //MoveTo 481, 339//移动到关闭
    Randomize //初始化随机数生成器。
    x = Int(((403-246)* Rnd) + 246) 
    y = Int(((547-498) * Rnd) + 498)
    MoveTo x, y//移动到确认*/
    LeftClick 1//点击确定
    Delay 300
    FindColor 691,287,727,324,"0013C0",intX,intY//如果出现钱不够情况
    If intX > 0 And intY > 0 Then 
        MoveTo intX, intY
        LeftClick 1
        Qbg = true
    End If
    Rem 结束购买
End Sub
Sub 截图
    If Xj = true Then 
        Goto 结束截图
    End If
    FindColor 454,313,548,348,"A0C3DF",intX,intY
    If intX > 0 And intY > 0 Then //如果物品消失
        Randomize //初始化随机数生成器。
        x = Int(((402-281)* Rnd) + 281) 
        y = Int(((270-239) * Rnd) + 239)
        MoveTo x, y//移动到我要出售
        LeftClick 1//点击
        Delay 200
        Randomize //初始化随机数生成器。
        x = Int(((851-736)* Rnd) + 736) 
        y = Int(((265-239) * Rnd) + 239)
        MoveTo x, y//移动到交易记录
        LeftClick 1//点击
        Delay 500
        MoveTo 1468, 918//点击截图按钮
        LeftClick 1
        Delay 1000
        MoveTo 59, 188//找到截图区域
        LeftDown 1
        Delay 500
        MoveTo 923, 735
        LeftUp 1
        Delay 500
        MoveTo 887, 760
        LeftClick 1
        Delay 1000
        MoveTo 1840, 1018//点击发送
        LeftClick 1
        Delay 1000
        MoveTo 504, 306//关闭交易记录
        RightClick 1
        Delay 300
        RightClick 1
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
    FindColor 30,69,44,90,"8BD6FF",intX,intY
    If intX > 0 And intY > 0 Then //如果在战斗中
        MoveTo intX, intY //移动到左上方菜单
        Delay 100
        LeftClick 1//点击选中 
        Delay 300
        Randomize //初始化随机数生成器。
        x = Int(((209-161)* Rnd) + 161) 
        y = Int(((259-206) * Rnd) + 206)
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
        FindColor 556,739,578,763,"AC7D87",intX,intY
        If intX > 0 And intY > 0 Then //如果下方系统栏展开
            Randomize //初始化随机数生成器。
            x = Int(((588-548)* Rnd) + 548) 
            y = Int(((772-731) * Rnd) + 731)
            MoveTo x, y//移动至下方系统栏按钮  
            Delay 100
            LeftClick 1//点击进入
            Delay 300
            安全锁
        Else //如果没有展开
            Randomize //初始化随机数生成器。
            x = Int(((1014-967)* Rnd) + 967) 
            y = Int(((775-735) * Rnd) + 735)
            MoveTo x, y//移动至下方加号展开按钮  
            Delay 100
            LeftClick 1//点击进入
            Delay 1000
            Randomize //初始化随机数生成器。
            x = Int(((588-548)* Rnd) + 548) 
            y = Int(((772-731) * Rnd) + 731)
            MoveTo x, y//移动至下方系统栏按钮  
            Delay 100
            LeftClick 1//点击进入
            Delay 300
            安全锁
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
        aqs=true//安全锁已打开
    End If
    Randomize //初始化随机数生成器。
    x = Int(((949-908)* Rnd) + 908) 
    y = Int(((156-120) * Rnd) + 120)
    MoveTo x, y//移动关闭按钮  
    Delay 100
    LeftClick 1//点击进入
    Delay 300
End Sub
Sub 主程序
    查看安全锁 
    开始
End Sub
Call 主程序

