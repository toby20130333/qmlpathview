import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1

Rectangle {
    width: 360
    height: 360
    signal signalClick();
    signal signalBack();
    DDuiBtn{
        id:topContorl
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        width: parent.width
        height: 30
        myTxt: "第七页"
        onSignalBtnBack: {
            signalBack();
        }
        onSignalBtnClick: {
            signalClick();
        }
    }

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
    }

    Flickable {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: topContorl.bottom
        anchors.bottom: parent.bottom
        contentWidth: row.width

        Row {
            id: row

            height: parent.height

            Repeater {
                model: dataModel
                delegate: Item {
                    height: parent.height
                    width: 100

                    Rectangle {
                        anchors.margins: 5
                        anchors.fill: parent
                        color: model.color
                        border {
                            color: "black"
                            width: 1
                        }

                        Text {
                            anchors.centerIn: parent
                            renderType: Text.NativeRendering
                            text: model.text
                        }
                    }
                }
            }
        }
    }
}


