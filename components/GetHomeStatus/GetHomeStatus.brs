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
    node = CreateObject("roSGNode", "ContentNode")
    node.title = "unknown"
    return node
end function

function ParseHomeStatus(homeStatusJson as object) as object
    node = CreateObject("roSGNode", "ContentNode")
    node.title = homeStatusJson.title
    return node
end function

function HttpGetUnsafe(url as String, unsafe as boolean) as string
    req = CreateObject("roUrlTransfer")
    req.SetUrl(url)
    req.EnableHostVerification(not unsafe)
    req.EnablePeerVerification(not unsafe)
    return req.GetToString()
end function
