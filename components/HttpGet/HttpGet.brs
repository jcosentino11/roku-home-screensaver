sub init()
    m.top.functionName = "HttpGet"
end sub

sub HttpGet()
    m.top.response = HttpGetUnsafe(m.top.url, m.top.unsafe)
end sub

function HttpGetUnsafe(url as String, unsafe as boolean) as string
    req = CreateObject("roUrlTransfer")
    req.SetUrl(url)
    req.EnableHostVerification(not unsafe)
    req.EnablePeerVerification(not unsafe)
    
    resp = req.GetToString()
    if resp = invalid
        return ""
    end if

    return resp
end function
