import QtQuick 6.8
import QtQuick.Controls 6.8
import QtQuick.Layouts 6.8
import QtGraphicalEffects 6.8

ApplicationWindow {
    id: root
    visible: true
    width: 1024
    height: 768
    color: isDarkTheme ? "#000000": "#FFFFFF"

    // Dynamic color scheme
    property var pywalColors: {
        "colors": [
            "#000000", // background color
            "#BC412B", // base color 1
            "#568C3B", // base color 2
            "#F7D000", // base color 3
            "#4169E1", // base color 4
            "#A020F0", // base color 5
            "#00CED1", // base color 6
            "#F5F5F5"  // Text color
        ],
        "special": {
            "background": "#000000",
            "foreground": "#F5F5F5",
            "cursor": "#F5F5F5"
        }
    }

    //State variables
    property bool isDarkTheme: true
    property int currentPage: 0
    property var keyboardLayouts: ["US", "AR"]
    property var notificationMessages: ["Welcome to Desind OS", "An innovative operating system that combines speed and beauty"]

    // Application settings
    Settings {
        property bool isFirstRun: true
    }

    // Check the first run
    Component.onCompleted: {
        if(!settings.isFirstRun) {
            rootLoader.source = "shell.qml" // Go directly to the home screen
        } else {
            settings.isFirstRun = false // Update the state after the first run
        }
    }

    //Welcome home page
    Rectangle {
        id: welcomeScreen
        anchors.fill: parent
        color: pywalColors.special.background
        visible: currentPage===0

        Column {
            anchors.centerIn: parent
            Spacing: 20

            Text {
                text: "Welcome to Desind OS"
                font.family: "IBM Plex Sans Bold"
                font.pixelSize: 36
                color: pywalColors.special.foreground
            }

            Text {
                text: "An innovative operating system that combines speed, simplicity, and beauty."
                font.family: "IBM Plex Sans Thin"
                font.pixelSize: 18
                color: pywalColors.colors[5]
                horizontalAlignment: Text.AlignHCenter
                width: parent.width * 0.8
                wrapMode: Text.Wrap
            }

            Button {
                text: "Let's get started >"
                width: 150
                height: 50
                radius: 25
                color: Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.2)
                border.color: pywalColors.colors[6]
                border.width: 1

                onClicked: {
                    currentPage = 1 // Go to the first page
                }
            }
        }
    }

    //Feature pages
    StackView {
        id: featurePages
        anchors.fill: parent
        visible: currentPage > 0
        initialItem: FeaturePage {featureIndex: 0}

        onCurrentIndexChanged: {
            if (featurePages.depth === 0) {
                currentPage = 0
            }
        }
    }

    // Feature page component
    Component {
        id: featurePageComponent
        Item {
            id: featurePage
            property int featureIndex: 0
            width: parent.width
            height: parent.height

            Column {
                anchors.centerIn: parent
                Spacing: 20

                Text {
                    text: getFeatureTitle(featureIndex)
                    font.family: "IBM Plex Sans Bold"
                    font.pixelSize: 28
                    color: pywalColors.special.foreground
                }

                Text {
                    text: getFeatureDescription(featureIndex)
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 18
                    color: pywalColors.colors[5]
                    horizontalAlignment: Text.AlignHCenter
                    width: parent.width * 0.8
                    wrapMode: Text.Wrap
                }

                RowLayout {
                    anchors.horizontalCenter: parent.horizontalCenter
                    Spacing: 10

                    Button {
                        text: "< previous"
                        width: 100
                        height: 40
                        radius: 20
                        visible: featureIndex > 0

                        onClicked: {
                            featureIndex -= 1
                            featurePages.pop()
                        }
                    }

                    Button {
                        text: "Next >"
                        width: 100
                        height: 40
                        radius: 20
                        visible: featureIndex < 2

                        onClicked: {
                            featureIndex += 1
                            featurePages.push(FeaturePage {featureIndex: featureIndex})
                        }
                    }
                }
            }
        }
    }

    // Change the theme
    Row {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        Spacing: 10

        Text {
            text: isDarkTheme ? "light mode": "dark mode"
            font.family: "IBM Plex Sans Thin"
            font.pixelSize: 16
            color: pywalColors.special.foreground
        }

        Switch {
            checked: isDarkTheme
            onCheckedChanged: {
                isDarkTheme = !isDarkTheme
                applyTheme()
            }
        }
    }

    // Manage keyboard layout
    Rectangle {
        id: keyboardSettings
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: 300
        height: 200
        radius: 20
        color: Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.2)
        border.color: pywalColors.colors[6]
        border.width: 1
        visible: currentPage===3

        Column {
            anchors.fill: parent
            Spacing: 10

            Text {
                text: "Keyboard Layout Management"
                font.family: "IBM Plex Sans Bold"
                font.pixelSize: 20
                color: pywalColors.special.foreground
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
            }

            ListView {
                width: parent.width
                height: 100
                model: keyboardLayout
                delegate: Item {
                    width: parent.width
                    height: 30

                    Row {
                        anchors.fill: parent
                        Spacing: 10

                        Text {
                            text: modelData
                            font.family: "IBM Plex Sans Thin"
                            font.pixelSize: 16
                            color: pywalColors.special.foreground
                        }

                        Button {
                            text: "Delete"
                            width: 60
                            height: 25
                            radius: 10
                            visible: model.index!== 0

                            onClicked: {
                                keyboardLayout.splice(model.index, 1)
                            }
                        }
                    }
                }
            }

            Button {
                text: "Add new layout"
                width: 150
                height: 40
                radius: 20
                color: Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.2)
                border.color: pywalColors.colors[6]
                border.width: 1

                onClicked: {
                    keyboardLayout.push("New Layout")
                }
            }
        }
    }

    //Help functions
    function getFeatureTitle(index) {
        switch (index) {
        case 0: return "Drile: Lightweight File Manager"
        case 1: return "Crosire: AI Engine"
        case 2: return "ArchStart: Application Manager"
        default: return ""
        }
    }

    function getFeatureDescription(index) {
        switch (index) {
        case 0: return "Drile is the lightest file manager ever!"
        case 1: return "Crosire is an AI engine that learns from you and adapts."
        case 2: return "ArchStart is a built-in application manager that provides speed and flexibility."
        default: return ""
        }
    }

    function applyTheme() {
        if (isDarkTheme) {
            pywalColors.special.background = "#000000"
            pywalColors.special.foreground = "#F5F5F5"
        } else {
            pywalColors.special.background = "#FFFFFF"
            pywalColors.special.foreground = "#000000"
        }
    }
}
