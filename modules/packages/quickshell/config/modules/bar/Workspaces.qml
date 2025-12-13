import QtQuick
import QtQuick.Layouts
import Quickshell

Rectangle {
    anchors.left: parent.left
    color: theme00
    height: 25
    width: 215
    bottomLeftRadius: 10
    bottomRightRadius: 10

    Rectangle {
        id: workspaceLayout
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            right: parent.right
            leftMargin: 10
            rightMargin: 10
        }

        RowLayout {
            anchors {
                verticalCenter: parent.verticalCenter
            }
            spacing: 5

            Repeater {
                model: niri.workspaces

                Rectangle {
                    visible: index < 11
                    width: 15
                    height: 15
                    radius: 10
                    color: model.isActive ? theme03 : theme04
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: niri.focusWorkspaceById(model.id)
                    }
                }
            }
        }
    }
}
