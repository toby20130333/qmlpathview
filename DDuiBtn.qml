import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1

Button{
    id:topContorl
    property string myTxt: "第一页"
    signal signalBtnClick();
    signal signalBtnBack();
    width: 100
    height: 30
    text: myTxt
    style: ButtonStyle {
            background: Rectangle {
                implicitWidth: topContorl.width
                implicitHeight: 30
//                border.width: control.activeFocus ? 2 : 1
//                border.color: "#888"
                gradient: Gradient {
                    GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                    GradientStop { position: 0.5 ; color: control.pressed ? "#bbb" : "#ddd" }
                    GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                }
            }
        }
    MouseArea{
        id:ma
        anchors.fill: parent
        onClicked: {
            if(mouseX<topContorl.width/2){
                signalBtnBack();
            }else{
                signalBtnClick();
            }
        }
    }
}

