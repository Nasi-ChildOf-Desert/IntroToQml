import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    Item {

        anchors.fill: parent

        Rectangle {
            id: btnLeft
            anchors.left:parent.left
            anchors.leftMargin: 15;
            width: 150
            height: 100
            color: "blue"
            border.color: "black"
            border.width: 5
            radius: 10

        }
        Rectangle {

            id: btnRight
            anchors.left: btnLeft.right;
            anchors.leftMargin: 25;
            width: 150
            height: 100
            color: "green"
            border.color: "black"
            border.width: 5
            radius: 10

        }
        Button {
               id: btnSwap
               text: "Swap Color"
               anchors.top: btnLeft.bottom;
               anchors.topMargin: 35;
               anchors.left: btnLeft.left;
               property string name: "Second Item"
               property string temp: ""
               property string randColorLeft;
               property string randColorRight;
               onClicked: {
                 randColorLeft = btnLeft.color  ;
                 randColorRight = btnRight.color ;
                 temp = randColorLeft;
                 randColorLeft =  randColorRight;
                 randColorRight = temp ;
                  btnLeft.color =  randColorLeft;
                 btnRight.color =  randColorRight;
               }
          }
        Button {
               text: "AutoColorGenerate"
               anchors.verticalCenter: btnSwap.verticalCenter;
               anchors.left:  btnSwap.right;
               anchors.leftMargin: 100;

            property string randColorLeft: "#"+ Qt.rgba(Math.random()*1000,Math.random()*1000,Math.random()*1000,1).toString(16);
            property string randColorRight: Qt.rgba(Math.random(),Math.random(),Math.random(),1);

               onClicked: {
                   btnLeft.color =  generateRandomColor();
                   btnRight.color =  generateRandomColor();
              //  btnLeft.border.color= "yellow"
               }
               function generateRandomColor() {
                   return "#" + Math.floor(Math.random()*0xFFFFFF).toString(16);
                           }
          }
    }


}
