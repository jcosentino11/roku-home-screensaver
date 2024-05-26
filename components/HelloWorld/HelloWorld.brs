sub init()
    m.myLabel = m.top.findNode("myLabel")
    m.myLabel.font.size=92
    m.myLabel.color="0x72D7EEFF"
    fetchTestResponse()
    m.top.setFocus(true)
end sub

sub fetchTestResponse()
    m.taskGetTest = createObject("roSGNode", "HttpGet")
    m.taskGetTest.observeField("response", "onTestResponse")
    m.taskGetTest.url = "https://192.168.0.20:1880/endpoint/test"
    m.taskGetTest.unsafe = true
    m.taskGetTest.control = "RUN"
end sub

sub onTestResponse()
    resp = parseTestResponse(m.taskGetTest.response)
    m.top.findNode("myLabel").text = resp.title
end sub

function parseTestResponse(resp as string) as object        
    json = ParseJson(resp)
    if json = invalid
        return {}
    end if
    return json
end function
