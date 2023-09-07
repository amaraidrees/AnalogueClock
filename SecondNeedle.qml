import QtQuick 2.15



//SecondNeedle.qml represent the MouseArea item so we can drag this needle at 360.

Item {
    id: id_root;
    property real centerX : (width/2);
    property real centerY : (height/2);

        Rectangle {
            id: handle;
            width: 8
            height: id_root.height * 0.6
            color: "red"
            anchors.centerIn: parent
            antialiasing: true

            MouseArea{
                anchors.fill: parent;
                onPositionChanged:  {
                    var point =  mapToItem (id_root, mouse.x, mouse.y);
                    var diffX = (point.x - id_root.centerX);
                    var diffY = -1 * (point.y - id_root.centerY);
                    var rad = Math.atan (diffY / diffX);
                    var deg = (rad * 180 / Math.PI);
                    if (diffX > 0 && diffY > 0) {
                        handle.rotation = 90 - Math.abs (deg);
                    }
                    else if (diffX > 0 && diffY < 0) {
                        handle.rotation = 90 + Math.abs (deg);
                    }
                    else if (diffX < 0 && diffY > 0) {
                        handle.rotation = 270 + Math.abs (deg);
                    }
                    else if (diffX < 0 && diffY < 0) {
                        handle.rotation = 270 - Math.abs (deg);
                    }
                }
            }

        }
        Text {
            text: "%1 secs".arg (Math.round (handle.rotation /6));
            font {
                pixelSize: 40;
                bold: true;
            }
            anchors.centerIn: parent;
        }


}
