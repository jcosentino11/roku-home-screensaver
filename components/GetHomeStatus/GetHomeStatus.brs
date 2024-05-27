sub init()
    m.top.functionName = "GetHomeStatus"
end sub

sub GetHomeStatus()
    m.top.homeStatus = DoGetHomeStatus()
end sub

function DoGetHomeStatus() as object
    httpResp = HttpGetUnsafe("https://192.168.0.20:1880/endpoint/home/status", true)
    if httpResp = invalid
        return PlaceholderHomeStatus()
    end if
    
    json = ParseJson(httpResp)
    if json = invalid
        return PlaceholderHomeStatus()
    end if
   
    return ParseHomeStatus(json)
end function

function PlaceholderHomeStatus() as object
    node = CreateObject("roSGNode", "HomeStatus")
    node.name = "unknown"
    node.timeStr = "00:00"
    node.amPmStr = "AM"
    node.armStatus = "unknown"
    node.indoorTemp = 0.0
    node.outdoorTemp = 0.0
    node.currentConditions = "unknown"
    return node
end function

function ParseHomeStatus(homeStatusJson as object) as object
    print homeStatusJson
    node = CreateObject("roSGNode", "HomeStatus")
    node.name = homeStatusJson.name
    node.timeStr = homeStatusJson.timeStr
    node.amPmStr = homeStatusJson.amPmStr
    node.armStatus = homeStatusJson.armStatus
    node.indoorTemp = homeStatusJson.indoorTemp
    node.outdoorTemp = homeStatusJson.outdoorTemp
    node.currentConditions = homeStatusJson.currentConditions
    return node
end function

function HttpGetUnsafe(url as String, unsafe as boolean) as string
    req = CreateObject("roUrlTransfer")
    req.SetUrl(url)
    req.EnableHostVerification(not unsafe)
    req.EnablePeerVerification(not unsafe)
    return req.GetToString()
end function
