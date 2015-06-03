import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1

Rectangle {
    property int itemSize: 20
    signal signalClick();
    signal signalBack();

    DDuiBtn{
        id:topContorl
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        width: parent.width
        height: 30
        myTxt:"第四页"
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
        model: 20

        path: Path {
            startX: 0
            startY: height

            PathAttribute { name: "size"; value: itemSize }
            PathAttribute { name: "opacity"; value: 0.5 }
            PathCurve {
                x: view.width / 5
                y: view.height / 2
            }
            PathCurve {
                x: view.width / 5 * 2
                y: view.height / 4
            }
            PathPercent { value: 0.49 }
            PathAttribute { name: "size"; value: itemSize * 2 }
            PathAttribute { name: "opacity"; value: 1 }
            PathLine {
                x: view.width / 5 * 3
                y: view.height / 4
            }
            PathAttribute { name: "size"; value: itemSize * 2 }
            PathAttribute { name: "opacity"; value: 1 }
            PathPercent { value: 0.51 }
            PathCurve {
                x: view.width / 5 * 4
                y: view.height / 2
            }
            PathCurve {
                x: view.width
                y: view.height
            }
            PathPercent { value: 1 }
            PathAttribute { name: "size"; value: itemSize }
            PathAttribute { name: "opacity"; value: 0.5 }
        }
        delegate: Image {
            width: PathView.size
            height: PathView.size
            opacity: PathView.opacity
            source:returnSource(index)// "http://download.easyicon.net/png/1174866/32/"
            function returnSource(index){
                var tmp = "http://download.easyicon.net/png/";
                var addNumber = 1174856+index;
                return tmp+addNumber+"/32/"

            }
        }
    }
}

