# Roku Home-Aware Screensaver

A Roku Screensaver that's tailor-made for my "smart" home

![Screensaver](https://github.com/jcosentino11/roku-home-app/blob/main/images/example.jpg?raw=true)

## Local Web API

![NodeRED API](https://github.com/jcosentino11/roku-home-app/blob/main/images/node-red.png?raw=true)

### /endpoint/home/status

Get some basic data from HomeAssistant to display in the screensaver.
```
{
    "name": "My House Name",
    "timeStr": "3:31",
    "amPmStr": "PM",
    "armStatus": "disarmed",
    "indoorTemp": "71",
    "outdoorTemp": "65",
    "currentConditions": "cloudy",
    "notificationText": "Camera battery needs charging!"
}
```

### /endpoint/home/wallpapers

Returns URLs to randomly-picked, royalty-free wallpapers that are sized to my TV's resolution.
```
{
    "wallpapers": [
        "https://some-wallpaper/wallpaper.jpg",
        ...
    ]
}
```
