sub init()
    m.myLabel = m.top.findNode("myLabel")
    m.myLabel.font.size=92
    m.myLabel.color="0x72D7EEFF"
    fetchHomeStatus()
    m.top.setFocus(true)
end sub

sub setMainTitle(text as string)
    m.myLabel.text = text
end sub

sub fetchHomeStatus()
    m.taskGetHomeStatus = createObject("roSGNode", "GetHomeStatus")
    m.taskGetHomeStatus.observeField("homeStatus", "onHomeStatusResponse")
    m.taskGetHomeStatus.control = "RUN"
end sub

sub onHomeStatusResponse()
    setMainTitle(m.taskGetHomeStatus.homeStatus.title)
end sub
