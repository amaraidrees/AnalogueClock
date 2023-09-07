import QtQuick 2.15
import QtQuick.Window 2.15


Window {
    id: id_root
    width: 820
    height: 680
    visible: true
    property color color: "white"
    property int hours: currentDate.getHours()
    property int minutes: currentDate.getMinutes()
    property int seconds: currentDate.getSeconds()
    property var currentDate: new Date()

    Timer {
        id: timer
        repeat: true
        interval: 1000
        running: true

        onTriggered: id_root.currentDate = new Date()
    }
    Rectangle {                                                                   //this Rectangle is used to design the clock plate
        id:id_plate
        anchors.centerIn: parent
        height: Math.min(id_root.width, id_root.height)
        width: height
        radius: width/2
        color: id_root.color
        border.color: "black"
        border.width: 40
        Repeater {                                                                   //Using repeater to represent the numbers in clock
            model: 12

            Item {
                id: hourContainer

                property int hour: index
                height: id_plate.height/2
                transformOrigin: Item.Bottom
                rotation: index * 30
                x: id_plate.width/2
                y: 0


        Text {                                                  //this text shows the hours in the clock from 1 to 12
            anchors {
                horizontalCenter: parent.horizontalCenter
            }
            x: 0
            y: id_plate.height*0.08
            rotation: 360 - index * 30
            text: hourContainer.hour == 00 ? 12 : hourContainer.hour
            font.pixelSize: id_plate.height*0.09
            font.family: "Comic Sans MS"
        }
        Text {                                                      //text shows the numbers in the border of the clock
            anchors {
                horizontalCenter: parent.horizontalCenter
            }
            x: 0
            y: id_plate.height*0.01
            rotation: 360 - index * 30
            text: hourContainer.hour == 00 ? 60 : hourContainer.hour*5
            font.pixelSize: id_plate.height*0.03
            font.family: "Comic Sans MS"
            color: "white"
        }
    }
        }
    }
    Repeater {                                                        //There are 60 intervals in one minute and same in one hour.using repeater for showing 60 intervals
                model: 60
                Item {
                    id: secondContainer
                    anchors {
                        horizontalCenter: id_plate.horizontalCenter
                    }

                    property int hour: index
                    height: id_plate.height/2
                    transformOrigin: Item.Bottom
                    rotation: index * 6
                    x: id_plate.width/2
                    y: 0
            Rectangle {                                               //This rectangle used to show the intervals around the clock
                id: fiveminutes
                x: 0
                y: id_plate.height*0.05
                           height: id_plate.height*0.04
                           width: 2
                           color: "black"

            }
    }}

    Rectangle {                                                          //center of the clock is designed by using rectangle
        id: id_center
        anchors.centerIn: parent
        height: id_plate.height*0.05
        width: height
        radius: width/2
        color: "yellow"
    }
    SecondNeedle {                                                           //seconneedle processng in main.qml
        anchors {
            top: id_plate.top
            bottom: id_plate.bottom
            horizontalCenter: parent.horizontalCenter
        }

    }
    MinutesNeedle {                                                        //minutesNeedle processing in main.qml
        anchors {
            top: id_plate.top
            bottom: id_plate.bottom
            horizontalCenter: parent.horizontalCenter

        }
        value: id_root.minutes                                                 //put minutes into int type variable value
    }
    HourNeedle {                                                               //HourNeedle processing in main.qml

        anchors {
            top: id_plate.top
            bottom: id_plate.bottom
            horizontalCenter: parent.horizontalCenter
        }
        value: id_root.hours
        valueminute: id_root.minutes
    }

    Text {                                                                          //Time printed in form of Hour:minutes:seconds
        id: id_root1
        anchors {
            horizontalCenter: id_plate.horizontalCenter
        }
        x: 0
        y: id_plate.height*0.3
        text: qsTr(id_root.hours+":"+id_root.minutes+":"+id_root.seconds)
        font.pixelSize: id_plate.height*0.05
        font.family: "Comic Sans MS"
    }

}
