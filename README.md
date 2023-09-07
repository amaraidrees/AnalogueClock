# AnalogueClock
**Analogue Clock in Qt creator using QML**
There is no image used in this project
Red needle represents the seconds that are adjustable, larger black needle used for minutes and small black needle for hours.
This clock also shows the time in digits and adjustable senconds in the center.
I used rectangles, text, repeater and mousearea.
Rectangles are used for designing the needles, clcok plate and the center point of the clock.Text used to represent the number in the clock.
Repeater is used two times one for the text and secondly for the intervals lines.


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
**Mouse area is used in secondneedle.qml to drag and adjust the second needle according to youself.**

Rectangle {
            id: handle;
            width: 8
            height: id_root.height * 0.6
            color: "red"
            anchors.centerIn: parent
            antialiasing: true

            MouseArea{
                anchors.fill: parent;
                onPositionChanged:  {}
                
I have used **granuality and rotation in HourNeedle.qml and MinuteNeedle.qml** to move the hourneedle and minutesneedle on the clock.

Rectangle {
        id: recthour
        width: 8
        height: id_root.height * 0.3
        color: "black"
        anchors {
            horizontalCenter: id_root.horizontalCenter
            bottom: id_root.verticalCenter
        }
        antialiasing: true

    }
    rotation: 360/granularity * (value%granularity) + 360/granularity * (valueminute / 60)
    antialiasing: true

