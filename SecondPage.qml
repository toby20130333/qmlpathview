import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1

Rectangle {
    width: 400
    height: 400
    signal signalClick();
    signal signalBack();
    DDuiBtn{
        id:topContorl
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        width: parent.width
        height: 30
        myTxt: "第二页"
        onSignalBtnBack: {
            signalBack();
        }
        onSignalBtnClick: {
            signalClick();
        }
    }
    PathView {
        id: view
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: topContorl.bottom
        anchors.bottom: parent.bottom
        model: 40

        path: Path {
            startX: view.width / 2
            startY: view.height / 2

            PathQuad {
                relativeX: 0
                y: view.height
                controlX: view.width
                controlY: 0
            }
            PathQuad {
                relativeX: 0
                y: view.height / 2
                controlX: 0
                controlY: 0
            }
        }
        delegate: Image {
            width: 32
            height: 32
            source:returnSource(index)// "http://download.easyicon.net/png/1174866/32/"
            function returnSource(index){
                var tmp = "http://download.easyicon.net/png/";
                var addNumber = 1174856+index;
                return tmp+addNumber+"/32/"
            }
        }
    }
}

