import QtQuick 2.12
import QtQuick.Controls 2.12

ApplicationWindow {
    visible: true
    width: 650
    height: 500
    title: "Smart Air Conditioner"

    property bool isAirConditionerOn: false
    property int houseTemperature: 25
    property int acTemperature: 22

    Rectangle {
        id: background
        anchors.fill: parent
        color: "#f2f2f2"
    }

    Rectangle {
        id: header
        width: parent.width
        height: parent.height * 0.1
        color: "#1c2331"

        Text {
            id: title
            text: "Smart Air Conditioner"
            color: "#ffffff"
            font.bold: true
            font.pointSize: 20
            anchors.centerIn: parent
        }
    }

    Rectangle {
        id: airconControls
        width: parent.width * 0.8
        height: parent.height * 0.4
        color: "#ffffff"
        anchors.centerIn: parent

        Column {
            anchors.centerIn: parent
            spacing: 20

            Row {
                spacing: 20

                Text {
                    text: "Air Conditioner:"
                    color: "#1c2331"
                    font.bold: true
                    font.pointSize: 16
                    verticalAlignment: Text.AlignVCenter
                }

                Text {
                    id: airconState
                    text: isAirConditionerOn ? "On" : "Off"
                    color: isAirConditionerOn ? "#4CAF50" : "#f44336"
                    font.bold: true
                    font.pointSize: 16
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Row {
                spacing: 20

                Text {
                    text: "House Temperature:"
                    color: "#1c2331"
                    font.bold: true
                    font.pointSize: 16
                    verticalAlignment: Text.AlignVCenter
                }

                Text {
                    id: houseTemperatureText
                    text: houseTemperature + " °C"
                    color: "#1c2331"
                    font.bold: true
                    font.pointSize: 16
                    verticalAlignment: Text.AlignVCenter
                }

                Slider {
                    id: houseTemperatureSlider
                    width: parent.width * 0.4
                    from: 16
                    to: 30
                    stepSize: 1
                    value: houseTemperature
                    onValueChanged: {
                        houseTemperature = value;
                        houseTemperatureText.text = houseTemperature + " °C";
                    }
                }
            }

            Row {
                spacing: 20

                Text {
                    text: "Turn On When:"
                    color: "#1c2331"
                    font.bold: true
                    font.pointSize: 16
                    verticalAlignment: Text.AlignVCenter
                }

                Text {
                    id: turnOnWhenText
                    text: "30 °C"
                    color: "#1c2331"
                    font.bold: true
                    font.pointSize: 16
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }
    }

    Rectangle {
        id: temperatureControls
        width: parent.width * 0.8
        height: parent.height * 0.2
        color: "#ffffff"
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        Row {
            anchors.centerIn: parent
            spacing: 20

            Text {
                text: "AC Temperature:"
                color: "#1c2331"
                font.bold: true
                font.pointSize: 16
                verticalAlignment: Text.AlignVCenter
                }
            Text {
                id: acTemperatureText
                text: acTemperature + " °C"
                color: "#1c2331"
                font.bold: true
                font.pointSize: 16
                verticalAlignment: Text.AlignVCenter
            }

            Slider {
                id: acTemperatureSlider
                width: parent.width * 0.4
                from: 16
                to: 30
                stepSize: 1
                value: acTemperature
                onValueChanged: {
                    acTemperature = value;
                    acTemperatureText.text = acTemperature + " °C";
                }
            }
        }
    }

    Button {
        id: powerButton
        text: isAirConditionerOn ? "Turn Off" : "Turn On"
        background: isAirConditionerOn ? "#f44336" : "#4CAF50"
        font.bold: true
        font.pointSize: 16
        width: parent.width * 0.4
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: airconControls.bottom
        onClicked: {
            isAirConditionerOn = !isAirConditionerOn;
            airconState.text = isAirConditionerOn ? "On" : "Off";
        }
    }
}
