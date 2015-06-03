import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

ApplicationWindow {
    id:main
    title: qsTr("Hello World")
    width: 640
    height: 480
    visible: true
    property Component oneView: EveryPage {
        onSignalClick: {
            Stack.view.push(secondView)
        }
    }
    property Component secondView: SecondPage {
        onSignalClick: {
            Stack.view.push(thridView)
        }
        onSignalBack: {
            Stack.view.pop();
        }
    }

    property Component thridView: ThridPage {
        onSignalClick: {
            Stack.view.push(fouthView)
        }
        onSignalBack: {
            Stack.view.pop();
        }
    }

    property Component fouthView: FourthPage {
        onSignalClick: {
            // Wrong: goes to movieDetailView.
            Stack.view.push(fiveView);
//            Stack.view.pop(moviesListView)
        }
        onSignalBack: {
            Stack.view.pop();
        }
    }

    property Component fiveView: FivePage {
        onSignalClick: {
            // Wrong: goes to movieDetailView.
            Stack.view.push(sixView)
        }
        onSignalBack: {
            Stack.view.pop();
        }
    }
    property Component sixView: SixPage {
        onSignalClick: {
            // Wrong: goes to movieDetailView.
            Stack.view.push(sevenView)
        }
        onSignalBack: {
            Stack.view.pop();
        }
    }
    property Component sevenView: SevenPage {
        onSignalClick: {
            // Wrong: goes to movieDetailView.
            Stack.view.pop()
        }
        onSignalBack: {
            Stack.view.pop();
        }
    }
    StackView {
        anchors.fill: parent
        initialItem: oneView
        delegate: StackViewDelegate {

            function transitionFinished(properties)
            {
                properties.exitItem.opacity = 1
            }

            pushTransition: StackViewTransition {
                PropertyAnimation {
                    target: enterItem
                    property: "width"
                    from: 0
                    to: main.width
                    duration: 800
                    easing.type: Easing.OutBack;
                    easing.amplitude: 2.0;
                    easing.period: 1.5
                }
                PropertyAnimation {
                    target: exitItem
                    property: "opacity"
                    to: 0
                    from: 1
                    duration: 10
                }
            }
        }
    }

    //    StackView {
    //        id: stackView
    //        anchors.fill: parent
    //        delegate: StackViewDelegate {

    //            function transitionFinished(properties)
    //            {
    //                properties.exitItem.opacity = 1
    //            }

    //            pushTransition: StackViewTransition {
    //                PropertyAnimation {
    //                    target: enterItem
    //                    property: "opacity"
    //                    from: 0
    //                    to: 1
    //                    duration: 10
    //                }
    //                PropertyAnimation {
    //                    target: exitItem
    //                    property: "opacity"
    //                    from: 1
    //                    to: 0
    //                    duration: 10
    //                }
    //            }
    //        }
    //        initialItem: Item {
    //            width: parent.width
    //            height: parent.height
    //            ListView {
    //                model: pageModel
    //                anchors.fill: parent
    //                delegate: Rectangle {
    //                    Text {
    //                        id: name
    //                        text: qsTr("text")
    //                    }
    ////                    onClicked: stackView.push(Qt.resolvedUrl(page))
    //                }
    //            }
    //        }
    //    }
}
