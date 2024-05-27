sub init()
    fetchHomeStatus()
    m.homeStatusTitleLabel = m.top.findNode("homeStatusTitleLabel")
end sub

sub fetchHomeStatus()
    m.taskGetHomeStatus = createObject("roSGNode", "GetHomeStatus")
    m.taskGetHomeStatus.observeField("homeStatus", "onHomeStatusResponse")
    m.taskGetHomeStatus.control = "RUN"
end sub

sub onHomeStatusResponse()
    m.homeStatusTitleLabel.text = m.taskGetHomeStatus.homeStatus.name
end sub
