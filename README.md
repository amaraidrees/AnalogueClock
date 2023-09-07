# AnalogueClock
**Analogue Clock in Qt creator using QML**
There is no image used in this project
Red needle represents the seconds that are adjustable, larger black needle used for minutes and small black needle for hours.
This clock also shows the time in digits and adjustable senconds in the center.
I used rectangles, text, repeater and mousearea.
**Rectangles** are used for designing the needles, clcok plate and the center point of the clock.**Text** used to represent the number in the clock.
**Repeater** is used two times one for the text and secondly for the intervals lines.


Rectangle {                                                                 
        id:id_plate
        anchors.centerIn: parent
        Repeater {                                                                  
            model: 12
            Item {
                id: hourContainer
        Text {                                                 
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
        }
**Mouse area is used in secondneedle.qml to drag and adjust the second needle according to youself.**

            MouseArea{
                anchors.fill: parent;
                onPositionChanged:  {}
                
I have used **granuality and rotation in HourNeedle.qml and MinuteNeedle.qml** to move the hourneedle and minutesneedle on the clock.

    rotation: 360/granularity * (value%granularity) + 360/granularity * (valueminute / 60)
    antialiasing: true

