sub init()
    m.top.functionName = "GetWallpapers"
end sub

sub GetWallpapers()
    m.top.wallpapers = DoGetWallpapers()
end sub

function DoGetWallpapers() as object
    httpResp = HttpGetUnsafe("https://192.168.0.20:1880/endpoint/home/wallpapers", true)
    if httpResp = invalid
        return PlaceholderWallpapers()
    end if
    
    json = ParseJson(httpResp)
    if json = invalid
        return PlaceholderWallpapers()
    end if
   
    return ParseWallpapers(json)
end function

function PlaceholderWallpapers() as object
    return [
        "pkg:/images/pig-1.jpg",
        "pkg:/images/pig-2.jpg",
        "pkg:/images/pig-3.jpg",
        "pkg:/images/pig-4.jpg",
        "pkg:/images/pig-5.jpg",
        "pkg:/images/pig-6.jpg"
    ]
end function

function ParseWallpapers(json as object) as object
    return json.wallpapers
end function

function HttpGetUnsafe(url as String, unsafe as boolean) as string
    req = CreateObject("roUrlTransfer")
    req.SetUrl(url)
    req.EnableHostVerification(not unsafe)
    req.EnablePeerVerification(not unsafe)
    return req.GetToString()
end function
