set WshShell = WScript.CreateObject("WScript.Shell")

name = "calculator"
Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")
WshShell.Run("calc.exe")

do  
    checkProc objWMIService,name,randNumber(1,1000),randNumber(3000,3200)      
    checkProc objWMIService,name,"{+}",randNumber(200,300)      
    checkProc objWMIService,name,randNumber(1,1000),randNumber(200,300)                
    checkProc objWMIService,name,randOp(),randNumber(200,300)                
loop while 1

sub checkProc(wmiobj, name, tx, sleep)
    WScript.Sleep(sleep)
    sQuery = "SELECT * FROM Win32_Process where Name like '%"& name & "%'"
    Set objItems = wmiobj.ExecQuery(sQuery)
    if objItems.Count < 1 then
       WScript.Quit(0)
    End if
    if IsNumeric(tx) then
        typeSim(tx)
    Else
       WshShell.SendKeys tx
    End IF
end sub

sub typeSim(number)
    str = CStr(number)    
    size = Len(str)
    
    for i = 1 to size
        ch = Mid(str, i, 1)
        WshShell.SendKeys ch
        WScript.Sleep(randNumber(200,250))
    next
end sub

function randNumber(min, max)
    randNumber = Int((max-min+max)*Rnd+min)
end function

function randOp()  
    if randNumber(1, 10) > 2 Then
        randOp = "{+}"
    Else
        randOp = "="
    End IF
end function
