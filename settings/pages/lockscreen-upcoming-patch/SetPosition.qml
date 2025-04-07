import QtQuick 2.0
import Sailfish.Silica 1.0
import org.nemomobile.configuration 1.0

Page 
{
    id: page
    allowedOrientations: Orientation.All
    readonly property bool largeScreen: Screen.sizeCategory >= Screen.Large
    
    ConfigurationGroup
    {
        id: posSettings
        path: "/desktop/lipstick-jolla-home/lockscreenUpcoming"
        property int xPos: 0
        property int yPos: 0
        property int xPosLandscape: 0
        property int yPosLandscape: 0
        property int dateLabelSize: Theme.fontSizeMedium
        property int timeLabelSize: Theme.fontSizeMedium
        property int eventLabelSize: Theme.fontSizeMedium
        property int maxEvents: 5
        property int borderThick: 2
        property bool moveClock: false

        property int xPosClock: 0
        property int yPosClock: 0
        property int xPosLandscapeClock: 0
        property int yPosLandscapeClock: 0
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
        color: "red"
        opacity: 1.0
        y: page.height/2
    }
    Rectangle
    {
        width: 1
        height:page.height
        color: "red"
        opacity: 1.0
        x: page.width/2
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
        }
        anchors.top: parent.top
    }
    
    Rectangle
    {
        id: clockBox
        visible: !posSettings.moveClock
        //height: largeScreen ? Theme.fontSizeHuge*2+ Theme.fontSizeLarge + Theme.fontSizeExtraLarge * 1.1 + Theme.paddingMedium + Theme.fontSizeHuge :  Math.round(128 * Screen.widthRatio) + Math.round(40 * Screen.widthRatio) + Math.round(55 * Screen.widthRatio)+ Theme.paddingMedium+ Theme.fontSizeHuge

        height: ( largeScreen ? Theme.fontSizeHuge * 2.0+ Theme.fontSizeLarge + Theme.fontSizeExtraLarge * 1.1 : Math.round(128 * Screen.widthRatio) +  Math.round(40 * Screen.widthRatio) + Math.round(55 * Screen.widthRatio))+ Theme.paddingMedium +Theme.fontSizeHuge+Theme.paddingLarge 

        width: Screen.width*0.5
        color: "transparent"
        border.color: Theme.primaryColor
        Label
        {
            text: "clock and weather"
            anchors.horizontalCenter: parent.horizontalCenter
        }
       anchors.top: page.isPortrait? statBar.bottom : undefined 
       anchors.topMargin: page.isPortrait? Screen.height / 16 + Theme.paddingLarge : undefined
        anchors.horizontalCenter:page.isPortrait? statBar.horizontalCenter: undefined
       anchors.left: page.isPortrait? undefined: page.left 
       anchors.leftMargin: page.isPortrait? undefined : Screen.height / 16 + Theme.paddingLarge +78
        anchors.verticalCenter:page.isPortrait? undefined : page.verticalCenter
        
    }
    Rectangle
    {
        id: clockBoxMove
        visible: posSettings.moveClock
        height: ( largeScreen ? Theme.fontSizeHuge * 2.0+ Theme.fontSizeLarge + Theme.fontSizeExtraLarge * 1.1 : Math.round(128 * Screen.widthRatio) +  Math.round(40 * Screen.widthRatio) + Math.round(55 * Screen.widthRatio))+ Theme.paddingMedium +Theme.fontSizeHuge+Theme.paddingLarge 

        width: Screen.width*0.5
        color: "transparent"
        border.color: Theme.primaryColor
        Label
        {
            text: "clock and weather"
            anchors.horizontalCenter: parent.horizontalCenter
        }
       
        x: page.isPortrait? posSettings.xPosClock: posSettings.xPosLandscapeClock
        y: page.isPortrait? posSettings.yPosClock + statBar.height -1 :posSettings.yPosLandscapeClock + statBar.height -1         
        MouseArea
        {   
            anchors.fill: parent          
            drag.target: clockBoxMove
            onReleased: 
            {
                page.isPortrait ? posSettings.xPosClock = Math.round(clockBoxMove.x) :posSettings.xPosLandscapeClock = Math.round(clockBoxMove.x) 
                page.isPortrait? posSettings.yPosClock = Math.round(clockBoxMove.y) - statBar.height + 1 : posSettings.yPosLandscapeClock = Math.round(clockBoxMove.y) - statBar.height + 1
            }
            onPressAndHold:
            {
                fcBox.isVisible = true
                var item = posSettings
                fcBox.initialise (clockBoxMove)                    
            }
        }
    }
            
    Rectangle
     {
        id: rect
        height: posSettings.maxEvents* (Math.max(posSettings.dateLabelSize, posSettings.timeLabelSize) + posSettings.eventLabelSize) + 2*posSettings.borderThick  
        width: 415*Screen.width/540
        x: page.isPortrait? posSettings.xPos: posSettings.xPosLandscape
        y: page.isPortrait? posSettings.yPos + statBar.height -1 :posSettings.yPosLandscape + statBar.height -1  
        color: "transparent"
        border.color: Theme.primaryColor
        Label
        {
            text: "Long press for arrows to nudge by 1px"
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
                page.isPortrait ? posSettings.xPos = Math.round(rect.x) :posSettings.xPosLandscape = Math.round(rect.x) 
                page.isPortrait? posSettings.yPos = Math.round(rect.y) - statBar.height + 1 : posSettings.yPosLandscape = Math.round(rect.y) - statBar.height + 1
            }
            onPressAndHold:
            {
                fcBox.isVisible = true
                var item = posSettings
                fcBox.initialise (rect)                    
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
            }
        }
    }
}
    
