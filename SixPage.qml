import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1

Rectangle {
    property real itemAngle: 60
    property real itemSize: 200
    signal signalClick();
    signal signalBack();

    DDuiBtn{
        id:topContorl
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        width: parent.width
        height: 30
        text: "第六页"
        onSignalBtnBack: {
            signalBack();
        }
        onSignalBtnClick: {
            signalClick();
        }
    }
    width: 1200
    height: 400

    ListModel {
        id: dataModel

        ListElement {
            color: "orange"
            text: "first"
        }
        ListElement {
            color: "lightgreen"
            text: "second"
        }
        ListElement {
            color: "orchid"
            text: "third"
        }
        ListElement {
            color: "tomato"
            text: "fourth"
        }
        ListElement {
            color: "skyblue"
            text: "fifth"
        }
        ListElement {
            color: "hotpink"
            text: "sixth"
        }
        ListElement {
            color: "darkseagreen"
            text: "seventh"
        }
    }

    PathView {
        id: view

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: topContorl.bottom
        anchors.bottom: parent.bottom
        model: dataModel
        pathItemCount: 6

        path: Path {
            startX: 0
            startY: height / 2

            PathPercent { value: 0.0 }
            PathAttribute { name: "z"; value: 0 }
            PathAttribute { name: "angle"; value: itemAngle }
            PathAttribute { name: "origin"; value: 0 }
            PathLine {
                x: (view.width - itemSize) / 2
                y: view.height / 2
            }
            PathAttribute { name: "angle"; value: itemAngle }
            PathAttribute { name: "origin"; value: 0 }
            PathPercent { value: 0.49 }
            PathAttribute { name: "z"; value: 10 }


            PathLine { relativeX: 0; relativeY: 0 }

            PathAttribute { name: "angle"; value: 0 }
            PathLine {
                x: (view.width - itemSize) / 2 + itemSize
                y: view.height / 2
            }
            PathAttribute { name: "angle"; value: 0 }
            PathPercent { value: 0.51 }

            PathLine { relativeX: 0; relativeY: 0 }

            PathAttribute { name: "z"; value: 10 }
            PathAttribute { name: "angle"; value: -itemAngle }
            PathAttribute { name: "origin"; value: itemSize }
            PathLine {
                x: view.width
                y: view.height / 2
            }
            PathPercent { value: 1 }
            PathAttribute { name: "z"; value: 0 }
            PathAttribute { name: "angle"; value: -itemAngle }
            PathAttribute { name: "origin"; value: itemSize }
        }
        delegate: Rectangle {
            property real rotationAngle: PathView.angle
            property real rotationOrigin: PathView.origin
            radius: itemSize/2
            width: itemSize
            height: width
            z: PathView.z
            color: Qt.rgba(Math.random(),Math.random(),Math.random(),1.0)
//            color: model.color
            border {
                color: "gray"
                width: 1
            }
            transform: Rotation {
                axis { x: 0; y: 1; z: 0 }
                angle: rotationAngle
                origin.x: rotationOrigin
            }
            Image {
                width: 32
                height: 32
                anchors.centerIn: parent
                source:returnSource(index)// "http://download.easyicon.net/png/1174866/32/"
                function returnSource(index){
                    var tmp = "http://download.easyicon.net/png/";
                    var addNumber = 1174856+index;
                    return tmp+addNumber+"/32/"
                }
            }
        }
    }
}

