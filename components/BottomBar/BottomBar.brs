sub init()
    m.currentTimeLabel = m.top.findNode("currentTimeLabel")
    m.amPmLabel = m.top.findNode("amPmLabel")
    m.titleLabel = m.top.findNode("titleLabel")
    m.weatherIcon = m.top.findNode("weatherIcon")
    m.lockIcon = m.top.findNode("lockIcon")
    m.armStatusLabel = m.top.findNode("armStatusLabel")
    m.clockTimer = m.top.findNode("clockTimer")

    m.weatherStates = createObject("roAssociativeArray")
    m.weatherStates.AddReplace("clear-night", "pkg:/images/icon-moon.png")    
    m.weatherStates.AddReplace("cloudy", "pkg:/images/icon-cloudy.png")   
    m.weatherStates.AddReplace("fog", "pkg:/images/icon-cloudy.png")   
    m.weatherStates.AddReplace("hail", "pkg:/images/icon-snow.png")   
    m.weatherStates.AddReplace("lightning", "pkg:/images/icon-lightning.png")   
    m.weatherStates.AddReplace("lightning-rainy", "pkg:/images/icon-lightning.png")   
    m.weatherStates.AddReplace("partlycloudy", "pkg:/images/icon-cloudy.png")   
    m.weatherStates.AddReplace("pouring", "pkg:/images/icon-rain.png")   
    m.weatherStates.AddReplace("rainy", "pkg:/images/icon-rain.png") 
    m.weatherStates.AddReplace("snowy", "pkg:/images/icon-snow.png") 
    m.weatherStates.AddReplace("snowy-rainy", "pkg:/images/icon-snow.png") 
    m.weatherStates.AddReplace("sunny", "pkg:/images/icon-sun.png") 
    m.weatherStates.AddReplace("windy", "pkg:/images/icon-cloudy.png") 
    m.weatherStates.AddReplace("windy-variant", "pkg:/images/icon-cloudy.png") 
    m.weatherStates.AddReplace("exceptional", "pkg:/images/icon-sun.png")   

    m.lockStates = createObject("roAssociativeArray")
    m.lockStates.AddReplace("armed home", "pkg:/images/icon-lock.png") 
    m.lockStates.AddReplace("armed away", "pkg:/images/icon-lock.png") 
    m.lockStates.AddReplace("disarmed", "pkg:/images/icon-unlock.png") 

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
    m.titleLabel.text = m.taskGetHomeStatus.homeStatus.name
    m.weatherIcon.uri = m.weatherStates[m.taskGetHomeStatus.homeStatus.currentConditions]
    m.armStatusLabel.text = m.taskGetHomeStatus.homeStatus.armStatus
    m.lockIcon.uri = m.lockStates[m.taskGetHomeStatus.homeStatus.armStatus]
end sub
