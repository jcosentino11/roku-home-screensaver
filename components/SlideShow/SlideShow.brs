sub init()
    m.poster = m.top.findNode("poster")
    m.imageUrls = [
        "pkg:/images/pig-1.jpg",
        "pkg:/images/pig-2.jpg",
        "pkg:/images/pig-3.jpg",
        "pkg:/images/pig-4.jpg",
        "pkg:/images/pig-5.jpg",
        "pkg:/images/pig-6.jpg"
    ]
    m.currentImageIndex = 0
    showNextImage()

    m.switchTimer = m.top.findNode("switchTimer")
    m.switchTimer.control = "start"
    m.switchTimer.ObserveField("fire", "onSwitchTimerFire")

    m.top.setFocus(true)
end sub

sub showNextImage()
    m.poster.uri = m.imageUrls[m.currentImageIndex]
    m.currentImageIndex = (m.currentImageIndex + 1) mod m.imageUrls.count()
end sub

sub onSwitchTimerFire()
    showNextImage()
end sub
