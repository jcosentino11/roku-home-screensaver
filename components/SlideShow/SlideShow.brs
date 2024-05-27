sub init()
    m.showStaging = true
    m.poster = m.top.findNode("poster")
    m.staging = m.top.findNode("staging")
    m.currentImageIndex = 0

    m.waitToLoadTimer = m.top.findNode("waitToLoadTimer")
    m.waitToLoadTimer.ObserveField("fire", "onWaitToLoadFinished")

    m.switchTimer = m.top.findNode("switchTimer")
    m.switchTimer.ObserveField("fire", "onSwitchTimerFire")

    fetchWallpapers()
    m.top.setFocus(true)
end sub

sub fetchWallpapers()
    m.taskGetWallpapers = createObject("roSGNode", "GetWallpapers")
    m.taskGetWallpapers.observeField("wallpapers", "onWallpapersResponse")
    m.taskGetWallpapers.control = "RUN"
end sub

sub onWallpapersResponse()
    m.imageUrls = m.taskGetWallpapers.wallpapers
    showNextImage()
end sub

sub showNextImage()
    if m.showStaging
        m.staging.uri = m.imageUrls[m.currentImageIndex]
    else
        m.poster.uri = m.imageUrls[m.currentImageIndex]
    end if
    m.currentImageIndex = (m.currentImageIndex + 1) mod m.imageUrls.count()
    waitForImagesToLoad()
end sub

sub waitForImagesToLoad()
    m.waitToLoadTimer.control = "start"
end sub

sub onWaitToLoadFinished()
    if m.showStaging
        m.staging.visible = true
        m.poster.visible = false
        m.showStaging = false
    else
        m.staging.visible = false
        m.poster.visible = true
        m.showStaging = true
    end if
    waitUntilNextSlide()
end sub

sub waitUntilNextSlide() 
    m.switchTimer.control = "start"
end sub

sub onSwitchTimerFire()
    showNextImage()
end sub
