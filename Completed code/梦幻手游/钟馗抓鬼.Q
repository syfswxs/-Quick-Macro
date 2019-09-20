/*
	未完成：
	在队伍人数判断中如果4号位暂离会影响判断，待解决
*/
Dim Obj, Shuang, zdgj
zdgj = false//自动关机默认为false
set Obj = createobject("WScript.Shell")
Shuang = false//双默认为不存在
Sub 自动关机
    YN = Obj.Popup("双用完后是否自动关机？", 0, "自动抓鬼", 4)
    If YN = 6 Then //如果点击是
        zdgj = true
    End If 		
End Sub
Sub 队伍人数
    Randomize //初始化随机数生成器。
    x = Int(((1013-974)* Rnd) + 974) 
    y = Int(((175-135) * Rnd) + 135)
    MoveTo x, y
    Delay 100
    LeftClick 1//点击进入组队界面
    Delay 800
    LeftClick 1
    Delay 1000
    人数情况
End Sub//给出PNumber的值 true为够4个人 false为不够人数
Sub 人数情况
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
End Sub
Sub 双
    Randomize //初始化随机数生成器。
    x = Int(((473-436)* Rnd) + 436) 
    y = Int(((87-46) * Rnd) + 46)
    MoveTo x, y
    Delay 100
    LeftClick 1//点击进入挂机界面
    Delay 500
    FindColor 554,642,636,687,"0A316C",intX,intY
    If intX > 0 And intY > 0 Then //如果双还存在
        Shuang = true
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
    队伍人数 //检测队伍人数
    If Shuang = true and PNumber = true Then 
        接任务
    End If
    If Shuang = false and zdgj = true Then 
        Call Obj.Popup("5秒后自动关机",5,"自动抓鬼",48)
        Obj.Run "shutdown /f /s /t 0"
        //调用shutdown命令。 /f--强行关闭应用程序而不提醒， /s--关闭计算机（要重启的话，请把这改成/r[重启计算机]），/t time--在time秒后前闭计算机。
    End If
End Sub
Sub 一轮
    FindColor 546,442,668,490,"62C1EE",intX,intY
    If intX > 0 And intY > 0 Then //如果出现抓完提示
        MoveTo intX, intY
        LeftClick 1//点击继续抓鬼
        Delay 1000
        MoveTo 571, 250
        LeftClick 1
        Delay 3000
        站着不动且没任务 
    End If 
End Sub//如果出现提示则自动点击传送至钟馗处
Sub 监测是否正常
    //判断是否在战斗中
    Shuang = true
    FindColor 967,718,1007,755,"3866C0",intX,intY
    if intX > 0 And intY Then //在战斗中
    Else //不在战斗中
        Delay 10000
        一轮 //第一步监控是否出现弹窗提醒抓完鬼
        FindColor 977,187,1021,238,"3DFBFF",intX,intY
        If intX > 0 And intY > 0 Then //如果不在战斗中但右边有抓鬼任务
            Randomize //初始化随机数生成器。
            x = Int(((947-838)* Rnd) + 838) 
            y = Int(((254-205) * Rnd) + 205)
            MoveTo x, y
            Delay 100
            LeftClick 1//点击任务栏自动抓鬼
            Delay 20000//等20秒
        Else 
            站着不动且没任务 
        End If
    End If
End Sub
Sub 接任务
    Randomize //初始化随机数生成器。
    x = Int(((894-816)* Rnd) + 816) 
    y = Int(((167-135) * Rnd) + 135)
    MoveTo x, y
    Delay 100
    LeftClick 1//点击进入任务界面
    Delay 800
    LeftClick 1
    Delay 1000
    Randomize //初始化随机数生成器。
    x = Int(((983-948)* Rnd) + 948) 
    y = Int(((392-327) * Rnd) + 327)
    MoveTo x, y
    Delay 100
    LeftClick 1//点击进入可接任务界面
    Delay 500
    Randomize //初始化随机数生成器。
    x = Int(((248-106)* Rnd) + 106) 
    y = Int(((243-200) * Rnd) + 200)
    MoveTo x, y
    Delay 100
    LeftClick 1//点击进入常规任务任务界面
    Delay 500
    Randomize //初始化随机数生成器。
    x = Int(((252-120)* Rnd) + 120) 
    y = Int(((326-276) * Rnd) + 276)
    MoveTo x, y
    Delay 100
    LeftClick 1//点击抓鬼任务
    Delay 500
    Randomize //初始化随机数生成器。
    x = Int(((874-739)* Rnd) + 739) 
    y = Int(((688-646) * Rnd) + 646)
    MoveTo x, y
    Delay 100
    LeftClick 1//点击前往领取
    Delay 500
    Rem 对话钟馗
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
        Goto 结束接任务
    End If
    Goto 对话钟馗
    Rem 结束接任务
End Sub//自动接任务并开始抓鬼
Sub 主程序
    Rem 监测
    监测是否正常 
    If Shuang = false Then //如果双用完了
        Goto 结束
    Else 
        Goto 监测
    End If
    Rem 结束
End Sub
Call 主程序
