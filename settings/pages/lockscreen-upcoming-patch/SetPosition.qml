import QtQuick 2.0
import Sailfish.Silica 1.0
import org.nemomobile.configuration 1.0

Page 
{
    id: page
    allowedOrientations: Orientation.All
    readonly property bool largeScreen: Screen.sizeCategory >= Screen.Large
   // onOrientationChanged: pageStack.pop()
    ConfigurationGroup
    {
        id: posSettings
        path: "/desktop/lipstick-jolla-home/lockscreenUpcoming"
        
        property int dateLabelSize: Theme.fontSizeMedium
        property int timeLabelSize: Theme.fontSizeMedium
        property int eventLabelSize: Theme.fontSizeMedium
        property int maxEvents: 5
        property int borderThick: 2
        property bool moveAll: false

    }
    ConfigurationGroup
    {
        id: calPosSettings
        path: "/desktop/lipstick-jolla-home/lockscreenUpcoming/cal"      
        property int xPos: 0
        property int yPos: 0
        property int xPosLandscape: 0
        property int yPosLandscape: 0
    }
    ConfigurationGroup
    {
        id: clockPosSettings
        path: "/desktop/lipstick-jolla-home/lockscreenUpcoming/clock"      
        property int xPos: clockBoxMove.defaultX
        property int yPos: clockBoxMove.defaultY
        property int xPosLandscape: clockBoxMove.defaultXLandscape
        property int yPosLandscape: clockBoxMove.defaultYLandscape
    }
    ConfigurationGroup
    {
        id: musicPosSettings
        path: "/desktop/lipstick-jolla-home/lockscreenUpcoming/music"      
        property int xPos: musicBoxMove.defaultX
        property int yPos: musicBoxMove.defaultY
        property int xPosLandscape: musicBoxMove.defaultXLandscape
        property int yPosLandscape: musicBoxMove.defaultYLandscape
    }
    ConfigurationGroup
    {
        id: callPosSettings
        path: "/desktop/lipstick-jolla-home/lockscreenUpcoming/call"      
        property int xPos: callBoxMove.defaultX
        property int yPos: callBoxMove.defaultY
        property int xPosLandscape: callBoxMove.defaultXLandscape
        property int yPosLandscape: callBoxMove.defaultYLandscape
    }

    Column
    {
        spacing: 49
        id: horLines
        Repeater
        {
            model: Math.ceil(page.height/(horLines.spacing+1))

            Rectangle
            {
                width: page.width
                height:1
                color: "yellow"
                opacity: 0.5
            }
        }
    }

    Row
    {
        spacing: 49
        id: verLines
        Repeater
        {  
            model:Math.ceil( page.width/(verLines.spacing+1))
            Rectangle
            {
                width: 1
                height:page.height
                color: "yellow"
                opacity:0.5
            }
        }
    }
    Rectangle
    {
        width: page.width
        height:1
        color: "blue"
        opacity: 1.0
        y: page.height/2
    }
    Rectangle
    {
        width: 1
        height:page.height
        color: "blue"
        opacity: 1.0
        x: page.width/2
    }
    Rectangle
    {
        visible:!page.isPortrait
        width: 1
        height:page.height
        color: "blue"
        opacity: 1.0
        x: page.width/4
    }
Rectangle
    {
        visible:!page.isPortrait
        width: 1
        height:page.height
        color: "blue"
        opacity: 1.0
        x: page.width*3/4
    }
    Rectangle
    {
        visible:page.isPortrait
        width: page.width
        height:1
        color: "blue"
        opacity: 1.0
        y: page.height/4
    }
Rectangle
    {
        visible:page.isPortrait
        width: page.width
        height:1
        color: "blue"
        opacity: 1.0
        y: page.height*3/4
    }
    FineControlBox
    {
        id: fcBox 
        z: 100
        isVisible: false
        isPortrait : page.isPortrait 
        anchors.fill: parent
    } 
  
    Rectangle
    {
        id: statBar
        height: Theme.paddingMedium + Theme.paddingSmall + Theme.iconSizeExtraSmall
        width: parent.width
        color: "transparent"
        border.color: Theme.primaryColor
        Label
        {
            text: "status bar"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter : parent.verticalCenter 
        }
        anchors.top: parent.top
    }
Rectangle
    {
        id: sideBar
        anchors.top: statBar.bottom
        anchors.bottom: cellBar.top
        anchors.left: parent.left 
        width: 78*2
        color: "transparent"
        border.color: Theme.primaryColor
        Label
        {
            text: "icons"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter : parent.verticalCenter 
        }
        
    }
  
    Rectangle
    {
        id: cellBar
        height: Theme.fontSizeMedium+Theme.paddingSmall*2 +84
        width: parent.width
        color: "transparent"
        border.color: Theme.primaryColor
        Label
        {
            text: "cell info  bar"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter : parent.verticalCenter 
        }
        anchors.bottom: parent.bottom
    }
    Button 
            {
                id: resetButton
                text: "reset"
                //width: parent.width
                anchors.right:cellBar.right
                anchors.bottom: cellBar.bottom
                height: cellBar.height

                visible: posSettings.moveAll
                onClicked:  {
                    if(page.isPortrait){
                        clockPosSettings.xPos= clockBoxMove.defaultX
                        clockPosSettings.yPos= clockBoxMove.defaultY
                        musicPosSettings.xPos= musicBoxMove.defaultX
                        musicPosSettings.yPos=musicBoxMove.defaultY
                        callPosSettings.xPos= callBoxMove.defaultX
                        callPosSettings.yPos=callBoxMove.defaultY

                        clockBoxMove.x= Screen.width/2 + clockBoxMove.defaultX-clockBoxMove.width/2
                        clockBoxMove.y= clockBoxMove.defaultY
                        musicBoxMove.x= musicBoxMove.defaultX
                        musicBoxMove.y= musicBoxMove.defaultY
                        callBoxMove.x= callBoxMove.defaultX
                        callBoxMove.y= callBoxMove.defaultY
} else { 
                        clockPosSettings.xPosLandscape= clockBoxMove.defaultXLandscape
                        clockPosSettings.yPosLandscape= clockBoxMove.defaultYLandscape
                        musicPosSettings. xPosLandscape= musicBoxMove.defaultXLandscape
                        musicPosSettings.yPosLandscape= musicBoxMove.defaultYLandscape
                        callPosSettings.xPosLandscape= callBoxMove.defaultXLandscape
                        callPosSettings.yPosLandscape= callBoxMove.defaultYLandscape


                        clockBoxMove.x= Screen.height/2  +clockBoxMove.defaultXLandscape-clockBoxMove.width/2
                        clockBoxMove.y= clockBoxMove.defaultYLandscape
                        musicBoxMove.x= musicBoxMove.defaultXLandscape
                        musicBoxMove.y= musicBoxMove.defaultYLandscape
                        callBoxMove.x= callBoxMove.defaultXLandscape
                        callBoxMove.y= callBoxMove.defaultYLandscape
                    }
                }                            
            }
    Rectangle
    {
        id: clockBoxMove
        height: ( largeScreen ? Theme.fontSizeHuge * 2.0+ Theme.fontSizeLarge + Theme.fontSizeExtraLarge * 1.1 : Math.round(128 * Screen.widthRatio) +  Math.round(40 * Screen.widthRatio) + Math.round(55 * Screen.widthRatio))+ Theme.paddingMedium +Theme.fontSizeHuge+Theme.paddingLarge 

        width: Screen.width*0.5
        color: "transparent"
        border.color: posSettings.moveAll? "red": Theme.primaryColor
        Label
        {
            wrapMode: Text.Wrap
            text:posSettings.moveAll? "clock and weather \nLong press for arrows to nudge by 1px":"clock and weather" 
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter : parent.verticalCenter 
            width:parent.width - Theme.paddingLarge 
        }
        
        property int defaultX: 0 
        //property int defaultXLandscape:   Screen.height / 16 + Theme.paddingLarge +78 + width/2 -Screen.height/2
        property int defaultXLandscape:   0
        property int defaultY: Screen.height / 16 + Theme.paddingLarge +statBar.height+1
        property int defaultYLandscape: statBar.height+1
        
        x:(posSettings.moveAll?( page.isPortrait? Screen.width/2 + clockPosSettings.xPos : Screen.height/2  + clockPosSettings.xPosLandscape): (page.isPortrait?Screen.width/2 + defaultX: Screen.height/2 +  defaultXLandscape)) -  width/2
        y:posSettings.moveAll?( page.isPortrait? clockPosSettings.yPos  :clockPosSettings.yPosLandscape) :( page.isPortrait?defaultY: defaultYLandscape)
        MouseArea
        {   
            enabled:posSettings.moveAll
            anchors.fill: parent          
            drag.target: clockBoxMove
            onReleased: 
            {
                page.isPortrait ? clockPosSettings.xPos = Math.round(clockBoxMove.x) + width/2 - Screen.width/2 :clockPosSettings.xPosLandscape = Math.round(clockBoxMove.x) + width/2 - Screen.height/2 
                page.isPortrait? clockPosSettings.yPos = Math.round(clockBoxMove.y) : clockPosSettings.yPosLandscape = Math.round(clockBoxMove.y)
            }
            onPressAndHold:
            {
                fcBox.isVisible = true
                fcBox.initialise (clockBoxMove,"clock",clockPosSettings.xPos,clockPosSettings.yPos,clockPosSettings.xPosLandscape, clockPosSettings.yPosLandscape)                    
            }
        }
        Rectangle 
        {
            width: 1
            height: 20
           color: "red"
           opacity: 1.0
           anchors
           {
               top: parent.top
               horizontalCenter: parent.horizontalCenter
               horizontalCenterOffset:1 
            }
        }
        Rectangle
         {
             width: 20
             height: 1
             color: "red"
             opacity: 1.0
             anchors
              {
                left: parent.left
                verticalCenter: parent.verticalCenter
                verticalCenterOffset:1  
            }
        }
        Rectangle 
        {
            width: 1
            height: 20
            color: "red"
            opacity: 1.0
            anchors
            {              
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
                horizontalCenterOffset:1 
            }
        }
        Rectangle
        {
            width: 20
            height: 1
            color: "red"
            opacity: 1.0
            anchors
            {
                right: parent.right
                verticalCenter: parent.verticalCenter
                verticalCenterOffset:1  
            }
        }
    }
            
    Rectangle
    {
        id: musicBoxMove
        height: Math.min(Screen.sizeCategory > Screen.Medium ? Theme.iconSizeExtraLarge
                                                                          : Theme.iconSizeLarge, width / 3)+Math.max(Theme.itemSizeLarge,Theme.fontSizeMedium+2*Theme.fontSizeSmall)
        
        property int widthPortrait: Screen.sizeCategory > Screen.Medium ? 4 * Theme.itemSizeExtraLarge
                                                                   : 0.75 * Screen.width
        property int widthLandscape:  0.75 * Screen.height / 2

        width: page.isPortrait ? widthPortrait 
                             : widthLandscape

        color: "transparent"
        border.color: posSettings.moveAll? "red":Theme.primaryColor
        Label
        {
            wrapMode: Text.Wrap
            text:posSettings.moveAll? "media controls \nLong press for arrows to nudge by 1px":"media controls" 
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter : parent.verticalCenter 
            width:parent.width - Theme.paddingLarge 
        }
        
        property int defaultX:(Screen.width - widthPortrait)/2
                 
        property int defaultXLandscape: Screen.height - widthLandscape
 
        property int defaultY: Screen.height - height-cellBar.height - callBoxMove.height- Theme.paddingMedium-1
        property int defaultYLandscape: Screen.width - height-cellBar.height- callBoxMove.height- Theme.paddingMedium-1
        
        x:posSettings.moveAll?( page.isPortrait? musicPosSettings.xPos: musicPosSettings.xPosLandscape):( page.isPortrait? defaultX: defaultXLandscape)
        y:posSettings.moveAll?( page.isPortrait? musicPosSettings.yPos :musicPosSettings.yPosLandscape ):(page.isPortrait?defaultY: defaultYLandscape) 
        MouseArea
        {   
            enabled:posSettings.moveAll
            anchors.fill: parent          
            drag.target: musicBoxMove
            onReleased: 
            {
                page.isPortrait ? musicPosSettings.xPos = Math.round(musicBoxMove.x) :musicPosSettings.xPosLandscape = Math.round(musicBoxMove.x) 
                page.isPortrait? musicPosSettings.yPos = Math.round(musicBoxMove.y) : musicPosSettings.yPosLandscape = Math.round(musicBoxMove.y) 
            }
            onPressAndHold:
            {
                fcBox.isVisible = true
                fcBox.initialise (musicBoxMove, "music",musicPosSettings.xPos,musicPosSettings.yPos,musicPosSettings.xPosLandscape, musicPosSettings.yPosLandscape)                    
            }
        }
        Rectangle 
        {
            width: 1
            height: 20
           color: "red"
           opacity: 1.0
           anchors
           {
               top: parent.top
               horizontalCenter: parent.horizontalCenter
               horizontalCenterOffset:1  
            }
        }
        Rectangle
         {
             width: 20
             height: 1
             color: "red"
             opacity: 1.0
             anchors
              {
                left: parent.left
                verticalCenter: parent.verticalCenter
                verticalCenterOffset:1   
            }
        }
        Rectangle 
        {
            width: 1
            height: 20
            color: "red"
            opacity: 1.0
            anchors
            {              
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
               horizontalCenterOffset:1 
            }
        }
        Rectangle
        {
            width: 20
            height: 1
            color: "red"
            opacity: 1.0
            anchors
            {
                right: parent.right
                verticalCenter: parent.verticalCenter
                verticalCenterOffset:1   
            }
        }
    }
            
    Rectangle
    {
        id: callBoxMove
        height:  Theme.itemSizeLarge + Theme.paddingSmall
        
        width: Screen.width

        color: "transparent"
        border.color: posSettings.moveAll? "red":Theme.primaryColor
        Label
        {
            wrapMode: Text.Wrap
            text:posSettings.moveAll? "ongoing call \nLong press for arrows to nudge by 1px":"ongoing call" 
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter : parent.verticalCenter
            width:parent.width - Theme.paddingLarge 
        }
        
        property int defaultX: 0
        property int defaultY: Screen.height - height-cellBar.height-1
        property int defaultXLandscape: Screen.height-width
        property int defaultYLandscape: Screen.width - height-cellBar.height-1
        
        x:posSettings.moveAll?( page.isPortrait? callPosSettings.xPos: callPosSettings.xPosLandscape):(page.isPortrait? defaultX:defaultXLandscape)
        y:posSettings.moveAll?( page.isPortrait? callPosSettings.yPos :callPosSettings.yPosLandscape)     :(page.isPortrait ? defaultY:defaultYLandscape) 
        MouseArea
        {   
            enabled:posSettings.moveAll
            anchors.fill: parent          
            drag.target: callBoxMove
            onReleased: 
            {
                page.isPortrait ? callPosSettings.xPos = Math.round(callBoxMove.x) :callPosSettings.xPosLandscape = Math.round(callBoxMove.x) 
                page.isPortrait? callPosSettings.yPos = Math.round(callBoxMove.y): callPosSettings.yPosLandscape= Math.round(callBoxMove.y)
            }
            onPressAndHold:
            {
                fcBox.isVisible = true
                fcBox.initialise (callBoxMove,"call",callPosSettings.xPos,callPosSettings.yPos,callPosSettings.xPosLandscape, callPosSettings.yPosLandscape)                    
            }
        }
Rectangle 
        {
            width: 1
            height: 20
           color: "red"
           opacity: 1.0
           anchors
           {
               top: parent.top
               horizontalCenter: parent.horizontalCenter
               horizontalCenterOffset:1  
            }
        }
        Rectangle
         {
             width: 20
             height: 1
             color: "red"
             opacity: 1.0
             anchors
              {
                left: parent.left
                verticalCenter: parent.verticalCenter
                verticalCenterOffset:1   
            }
        }
        Rectangle 
        {
            width: 1
            height: 20
            color: "red"
            opacity: 1.0
            anchors
            {              
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
               horizontalCenterOffset:1 
            }
        }
        Rectangle
        {
            width: 20
            height: 1
            color: "red"
            opacity: 1.0
            anchors
            {
                right: parent.right
                verticalCenter: parent.verticalCenter
                verticalCenterOffset:1   
            }
        }
    }
           
    Rectangle
     {
        id: rect
        height: posSettings.maxEvents* (Math.max(posSettings.dateLabelSize, posSettings.timeLabelSize) + posSettings.eventLabelSize + Theme.paddingSmall*3) + 2*posSettings.borderThick  
        width: 415*Screen.width/540
        x: page.isPortrait? calPosSettings.xPos: calPosSettings.xPosLandscape
        y: page.isPortrait? calPosSettings.yPos  :calPosSettings.yPosLandscape
        color: "transparent"
        border.color: "red"
        Label
        {
            text: "upcoming events\nLong press for arrows to nudge by 1px"
            width: parent.width - Theme.paddingLarge 
            anchors.horizontalCenter: parent.horizontalCenter
            wrapMode: Text.WordWrap
            anchors.verticalCenter : parent.verticalCenter 
        }        
        MouseArea
        {   
            anchors.fill: parent          
            drag.target: rect
            onReleased: 
            {
                page.isPortrait ? calPosSettings.xPos = Math.round(rect.x) :calPosSettings.xPosLandscape = Math.round(rect.x) 
                page.isPortrait? calPosSettings.yPos = Math.round(rect.y) : calPosSettings.yPosLandscape = Math.round(rect.y) 
            }
            onPressAndHold:
            {
                fcBox.isVisible = true
                fcBox.initialise (rect,"cal",calPosSettings.xPos,calPosSettings.yPos,calPosSettings.xPosLandscape, calPosSettings.yPosLandscape)                    
            }
        }
        Rectangle 
        {
            width: 1
            height: 20
           color: "red"
           opacity: 1.0
           anchors
           {
               top: parent.top
               horizontalCenter: parent.horizontalCenter
               horizontalCenterOffset:1  
            }
        }
        Rectangle
         {
             width: 20
             height: 1
             color: "red"
             opacity: 1.0
             anchors
              {
                left: parent.left
                verticalCenter: parent.verticalCenter
                verticalCenterOffset:1   
            }
        }
        Rectangle 
        {
            width: 1
            height: 20
            color: "red"
            opacity: 1.0
            anchors
            {              
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
               horizontalCenterOffset:1 
            }
        }
        Rectangle
        {
            width: 20
            height: 1
            color: "red"
            opacity: 1.0
            anchors
            {
                right: parent.right
                verticalCenter: parent.verticalCenter
                verticalCenterOffset:1   
            }
        }
    }
}
    
