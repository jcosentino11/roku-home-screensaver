' sub init()
'     m.currentTimeLabel = m.top.findNode("currentTimeLabel")
'     fetchHomeStatus()
' end sub

' sub fetchHomeStatus()
'     m.taskGetHomeStatus = createObject("roSGNode", "GetHomeStatus")
'     m.taskGetHomeStatus.observeField("homeStatus", "onHomeStatusResponse")
'     m.taskGetHomeStatus.control = "RUN"
' end sub

' sub onHomeStatusResponse()
'     m.currentTimeLabel.text = m.taskGetHomeStatus.homeStatus.timeStr
' end sub


sub init()
    m.currentTimeLabel = m.top.findNode("currentTimeLabel")
    m.amPmLabel = m.top.findNode("amPmLabel")
    m.clockTimer = m.top.findNode("clockTimer")

    fetchHomeStatus()
    
    m.clockTimer.control = "start"
    m.clockTimer.ObserveField("fire", "onClockTimerFire")
end sub

sub fetchHomeStatus()
    m.taskGetHomeStatus = createObject("roSGNode", "GetHomeStatus")
    m.taskGetHomeStatus.observeField("homeStatus", "onHomeStatusResponse")
    m.taskGetHomeStatus.control = "RUN"
end sub

sub onClockTimerFire()
    fetchHomeStatus()
end sub

sub onHomeStatusResponse()
    m.currentTimeLabel.text = m.taskGetHomeStatus.homeStatus.timeStr
    m.amPmLabel.text = m.taskGetHomeStatus.homeStatus.amPmStr
end sub
