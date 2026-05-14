import QtQuick
import qs.Common
import qs.Services
import qs.Widgets
import qs.Modules.Plugins
import Quickshell.Io

PluginComponent {
    id: root

    property string displayText: "loading..."

    Process {
        id: hostnameProcess
        command: ["hostname"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                root.displayText = this.text.trim()
            }
        }
    }

    horizontalBarPill: Component {
        Row {
            spacing: Theme.spacingXS

            DankIcon {
                name: "monitor"
                size: Theme.iconSizeSmall
                color: Theme.surfaceText
                anchors.verticalCenter: parent.verticalCenter
            }

            StyledText {
                text: root.displayText
                font.pixelSize: Theme.fontSizeSmall
                color: Theme.surfaceText
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }

    verticalBarPill: Component {
        Column {
            spacing: Theme.spacingXS

            DankIcon {
                name: "monitor"
                size: Theme.iconSizeSmall
                color: Theme.surfaceText
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Item {
                implicitWidth: rotatedText.height + Theme.spacingS
                implicitHeight: rotatedText.width + Theme.spacingS
                StyledText {
                    id: rotatedText
                    text: root.displayText
                    font.pixelSize: Theme.fontSizeSmall
                    color: Theme.surfaceText
                    rotation: 90
                    transformOrigin: Item.Center
                    anchors.centerIn: parent
                }
            }

        }
    }
}

